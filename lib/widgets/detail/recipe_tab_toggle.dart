import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../l10n/app_localizations.dart';
import '../../theme/app_colors.dart';

/// Toggle Ingredients / Procedure (libellé Figma volontairement conservé).
class RecipeTabToggle extends StatelessWidget {
  const RecipeTabToggle({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  final int selectedIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Row(
      children: [
        Expanded(child: _btn(l10n.ingredientTab, 0)),
        const SizedBox(width: 12),
        Expanded(child: _btn(l10n.procedureTab, 1)),
      ],
    );
  }

  Widget _btn(String label, int index) {
    final selected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onChanged(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: selected ? AppColors.white : AppColors.primary,
          ),
        ),
      ),
    );
  }
}
