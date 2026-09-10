import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../l10n/app_localizations.dart';
import '../models/recipe.dart';
import '../theme/app_colors.dart';

/// Carte recette réutilisable (grille search / saved).
class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.recipe,
    required this.onTap,
    this.onFavoriteTap,
    this.showTime = false,
    this.height = 180,
  });

  final Recipe recipe;
  final VoidCallback onTap;
  final VoidCallback? onFavoriteTap;
  final bool showTime;
  final double height;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          height: height,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Hero(
                tag: 'recipe-image-${recipe.id}',
                child: Image.asset(recipe.imageUrl, fit: BoxFit.cover),
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Color(0xCC000000)],
                    stops: [0.45, 1],
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.ratingBadge,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.star,
                        size: 10,
                        color: AppColors.ratingStar,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        recipe.rating.toStringAsFixed(1),
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 12,
                right: 12,
                bottom: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipe.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            l10n.byAuthor(recipe.authorName),
                            style: GoogleFonts.poppins(
                              color: AppColors.white.withValues(alpha: 0.85),
                              fontSize: 10,
                            ),
                          ),
                        ),
                        if (showTime) ...[
                          const Icon(
                            Icons.timer_outlined,
                            size: 14,
                            color: AppColors.white,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            l10n.minCount(recipe.duration),
                            style: GoogleFonts.poppins(
                              color: AppColors.white,
                              fontSize: 10,
                            ),
                          ),
                          if (onFavoriteTap != null) ...[
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: onFavoriteTap,
                              child: Container(
                                width: 28,
                                height: 28,
                                decoration: const BoxDecoration(
                                  color: AppColors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  recipe.isFavorite
                                      ? Icons.bookmark
                                      : Icons.bookmark_border,
                                  size: 16,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
