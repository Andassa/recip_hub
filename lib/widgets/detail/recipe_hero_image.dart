import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../models/recipe.dart';
import '../../providers/recipe_provider.dart';
import '../../theme/app_colors.dart';

/// Image hero du détail recette + rating / temps / favori.
class RecipeHeroImage extends StatelessWidget {
  const RecipeHeroImage({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Hero(
              tag: 'recipe-image-${recipe.id}',
              child: Image.asset(recipe.imageUrl, fit: BoxFit.cover),
            ),
            Positioned(
              top: 12,
              right: 12,
              child: _badge(recipe.rating.toStringAsFixed(1)),
            ),
            Positioned(
              right: 12,
              bottom: 12,
              child: Row(
                children: [
                  const Icon(
                    Icons.timer_outlined,
                    size: 16,
                    color: AppColors.white,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    AppLocalizations.of(context).minCount(recipe.duration),
                    style: GoogleFonts.poppins(
                      color: AppColors.white,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 10),
                  _FavoriteButton(recipe: recipe),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _badge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.ratingBadge,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star, size: 12, color: AppColors.ratingStar),
          const SizedBox(width: 3),
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton({required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<RecipeProvider>().toggleFavorite(recipe.id),
      child: Container(
        width: 32,
        height: 32,
        decoration: const BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(
          recipe.isFavorite ? Icons.bookmark : Icons.bookmark_border,
          size: 18,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
