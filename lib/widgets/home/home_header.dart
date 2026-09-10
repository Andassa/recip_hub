import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/assets.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_colors.dart';

/// En-tête Home : greeting + avatar.
class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.helloJega,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                l10n.whatAreYouCooking,
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: AppColors.ratingBadge,
            borderRadius: BorderRadius.circular(10),
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.asset(
            AppAssets.avatar,
            fit: BoxFit.cover,
            semanticLabel: l10n.semanticAvatar,
          ),
        ),
      ],
    );
  }
}
