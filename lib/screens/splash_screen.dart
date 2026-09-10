import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/assets.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_colors.dart';
import '../widgets/common/chef_hat_icon.dart';
import '../widgets/primary_button.dart';

/// Splash / onboarding Figma.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppAssets.splashBg,
            fit: BoxFit.cover,
            semanticLabel: l10n.semanticSplashImage,
          ),
          const _DarkOverlay(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  const SizedBox(height: 48),
                  const ChefHatIcon(size: 72),
                  const SizedBox(height: 14),
                  Text(
                    l10n.premiumRecipeCount,
                    style: GoogleFonts.poppins(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    l10n.getCooking,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: AppColors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                      height: 1.15,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    l10n.splashTagline,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: AppColors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 48),
                  PrimaryButton(
                    label: l10n.startCooking,
                    width: 220,
                    onPressed: () => context.goNamed('signIn'),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DarkOverlay extends StatelessWidget {
  const _DarkOverlay();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0x33000000), Color(0x99000000), Color(0xEE000000)],
          stops: [0.0, 0.45, 1.0],
        ),
      ),
    );
  }
}
