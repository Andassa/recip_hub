import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../l10n/app_localizations.dart';
import '../../models/recipe.dart';
import '../../theme/app_colors.dart';
import '../../utils/asset_image_fallback.dart';

/// Tuile ingrédient (image + nom + quantité).
class IngredientTile extends StatelessWidget {
  const IngredientTile({super.key, required this.ingredient});

  final Ingredient ingredient;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.cardLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              ingredient.imageUrl,
              fit: BoxFit.cover,
              cacheWidth: 144,
              cacheHeight: 144,
              semanticLabel: AppLocalizations.of(
                context,
              ).semanticIngredientImage(ingredient.name),
              errorBuilder: assetImageFallback,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              ingredient.name,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            ingredient.amount,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
