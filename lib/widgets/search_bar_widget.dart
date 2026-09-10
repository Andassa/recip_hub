import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../l10n/app_localizations.dart';
import '../theme/app_colors.dart';

/// Barre de recherche stylée + bouton filtre optionnel (maquette Figma).
class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    this.controller,
    this.onChanged,
    this.onFilterTap,
    this.hintText,
    this.readOnly = false,
    this.onTap,
  });

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onFilterTap;
  final String? hintText;
  final bool readOnly;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            readOnly: readOnly,
            onTap: onTap,
            style: GoogleFonts.poppins(fontSize: 12),
            decoration: InputDecoration(
              hintText:
                  hintText ?? AppLocalizations.of(context).searchRecipeHint,
              hintStyle: GoogleFonts.poppins(
                color: AppColors.textSecondary,
                fontSize: 11,
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: AppColors.textSecondary,
                size: 22,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppColors.border),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppColors.border),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
            ),
          ),
        ),
        if (onFilterTap != null) ...[
          const SizedBox(width: 12),
          GestureDetector(
            onTap: onFilterTap,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.tune, color: AppColors.white, size: 22),
            ),
          ),
        ],
      ],
    );
  }
}
