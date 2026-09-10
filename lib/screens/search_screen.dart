import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../models/recipe.dart';
import '../providers/recipe_provider.dart';
import '../theme/app_colors.dart';
import '../utils/responsive.dart';
import '../widgets/filter_sheet.dart';
import '../widgets/recipe_card.dart';
import '../widgets/search_bar_widget.dart';

/// Écran Search / Search Results (maquettes Figma).
class SearchScreen extends HookWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final initialQuery = useMemoized(
      () => context.read<RecipeProvider>().searchQuery,
    );
    final controller = useTextEditingController(text: initialQuery);
    final hasSubmitted = useState(initialQuery.isNotEmpty);

    final results = context.select<RecipeProvider, List<Recipe>>(
      (p) => p.filteredRecipes,
    );
    final l10n = AppLocalizations.of(context);
    final padding = horizontalPadding(context);
    final tablet = isTablet(context);
    final provider = context.read<RecipeProvider>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: l10n.semanticBack,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            provider.setSearchQuery('');
            context.goNamed('home');
          },
        ),
        title: Text(
          l10n.searchRecipes,
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBarWidget(
              controller: controller,
              onChanged: (value) {
                provider.setSearchQuery(value);
                hasSubmitted.value = value.isNotEmpty;
              },
              onFilterTap: () => showFilterSheet(context),
              hintText: controller.text.isEmpty
                  ? l10n.searchRecipeHint
                  : controller.text,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  hasSubmitted.value ? l10n.searchResult : l10n.recentSearch,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                if (hasSubmitted.value)
                  Text(
                    l10n.resultsCount(results.length),
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: results.isEmpty
                  ? Center(
                      child: Text(
                        l10n.noResults,
                        style: GoogleFonts.poppins(color: AppColors.textMuted),
                      ),
                    )
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: tablet ? 3 : 2,
                        mainAxisSpacing: 14,
                        crossAxisSpacing: 14,
                        childAspectRatio: 0.78,
                      ),
                      itemCount: results.length,
                      itemBuilder: (context, index) {
                        final recipe = results[index];
                        return RecipeCard(
                          recipe: recipe,
                          height: double.infinity,
                          onTap: () => context.pushNamed(
                            'detail',
                            pathParameters: {'id': recipe.id},
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
