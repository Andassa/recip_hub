import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/recipe_provider.dart';
import '../theme/app_colors.dart';
import '../utils/responsive.dart';
import '../widgets/filter_sheet.dart';
import '../widgets/recipe_card.dart';
import '../widgets/search_bar_widget.dart';

/// Écran Search / Search Results (maquettes Figma).
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _controller;
  bool _hasSubmitted = false;

  @override
  void initState() {
    super.initState();
    final query = context.read<RecipeProvider>().searchQuery;
    _controller = TextEditingController(text: query);
    _hasSubmitted = query.isNotEmpty;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<RecipeProvider>();
    final padding = horizontalPadding(context);
    final results = provider.filteredRecipes;
    final tablet = isTablet(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            provider.setSearchQuery('');
            context.goNamed('home');
          },
        ),
        title: Text(
          'Search recipes',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBarWidget(
              controller: _controller,
              onChanged: (value) {
                provider.setSearchQuery(value);
                setState(() => _hasSubmitted = value.isNotEmpty);
              },
              onFilterTap: () => showFilterSheet(context),
              hintText: _controller.text.isEmpty
                  ? 'Search recipe'
                  : _controller.text,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  _hasSubmitted ? 'Search Result' : 'Recent Search',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                if (_hasSubmitted)
                  Text(
                    '${results.length} results',
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
                        'Aucun résultat',
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
                          onTap: () => context.goNamed(
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
