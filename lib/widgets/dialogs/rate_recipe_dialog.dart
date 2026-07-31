import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_colors.dart';

/// Dialog "Rate recipe" (étoiles + Send).
Future<int?> showRateRecipeDialog(BuildContext context) {
  return showDialog<int>(
    context: context,
    builder: (_) => const RateRecipeDialog(),
  );
}

class RateRecipeDialog extends StatefulWidget {
  const RateRecipeDialog({super.key});

  @override
  State<RateRecipeDialog> createState() => _RateRecipeDialogState();
}

class _RateRecipeDialogState extends State<RateRecipeDialog> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    final canSend = _rating > 0;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Rate recipe',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (i) {
                final selected = i < _rating;
                return IconButton(
                  onPressed: () => setState(() => _rating = i + 1),
                  icon: Icon(
                    selected ? Icons.star : Icons.star_border,
                    color: AppColors.accent,
                    size: 32,
                  ),
                );
              }),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: 140,
              height: 40,
              child: ElevatedButton(
                onPressed: canSend
                    ? () => Navigator.pop(context, _rating)
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: canSend
                      ? AppColors.accent
                      : AppColors.border,
                  foregroundColor: AppColors.white,
                  disabledBackgroundColor: AppColors.border,
                  elevation: 0,
                  shape: const StadiumBorder(),
                ),
                child: Text(
                  'Send',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
