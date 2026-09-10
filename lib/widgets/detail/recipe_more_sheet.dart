import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../l10n/app_localizations.dart';
import '../../theme/app_colors.dart';

/// Bottom sheet menu More (Share / Rate / Review / Unsave).
class RecipeMoreSheet extends StatelessWidget {
  const RecipeMoreSheet({super.key, required this.isFavorite});

  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _item(context, 'share', Icons.share_outlined, l10n.share),
          _item(context, 'rate', Icons.star_border, l10n.rateRecipe),
          _item(context, 'review', Icons.chat_bubble_outline, l10n.review),
          _item(
            context,
            'unsave',
            isFavorite ? Icons.bookmark : Icons.bookmark_border,
            isFavorite ? l10n.unsave : l10n.save,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _item(
    BuildContext context,
    String value,
    IconData icon,
    String label,
  ) {
    return ListTile(
      leading: Icon(icon, color: AppColors.textPrimary),
      title: Text(label, style: GoogleFonts.poppins(fontSize: 14)),
      onTap: () => Navigator.pop(context, value),
    );
  }
}
