import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/recipe_provider.dart';
import '../theme/app_colors.dart';
import '../utils/responsive.dart';
import '../widgets/recipe_card.dart';

/// Écran 4 : favoris (Saved). ListView mobile, GridView tablette.
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<RecipeProvider>();
    final l10n = AppLocalizations.of(context);
    final favorites = provider.favorites;
    final padding = horizontalPadding(context);
    // Responsive : ListView (mobile) / GridView (tablette).
    final columns = gridCrossAxisCount(context);
    final useGrid = columns >= 2;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          l10n.savedRecipes,
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: provider.isLoading
          ? const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            )
          : favorites.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.bookmark_border,
                    size: 56,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    l10n.noSavedRecipes,
                    style: GoogleFonts.poppins(
                      color: AppColors.textMuted,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            )
          : useGrid
          ? GridView.builder(
              padding: EdgeInsets.all(padding),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.4,
              ),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final recipe = favorites[index];
                return RecipeCard(
                  recipe: recipe,
                  showTime: true,
                  onFavoriteTap: () => provider.toggleFavorite(recipe.id),
                  onTap: () => context.pushNamed(
                    'detail',
                    pathParameters: {'id': recipe.id},
                  ),
                );
              },
            )
          : ListView.separated(
              padding: EdgeInsets.all(padding),
              itemCount: favorites.length,
              separatorBuilder: (_, _) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final recipe = favorites[index];
                return RecipeCard(
                  recipe: recipe,
                  height: 160,
                  showTime: true,
                  onFavoriteTap: () => provider.toggleFavorite(recipe.id),
                  onTap: () => context.pushNamed(
                    'detail',
                    pathParameters: {'id': recipe.id},
                  ),
                );
              },
            ),
    );
  }
}
