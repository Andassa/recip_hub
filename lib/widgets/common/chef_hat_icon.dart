import 'package:flutter/material.dart';

import '../../core/assets.dart';
import '../../l10n/app_localizations.dart';

/// Icône toque (PNG extrait du SVG Figma — évite le bug colorFilter).
class ChefHatIcon extends StatelessWidget {
  const ChefHatIcon({super.key, this.size = 72});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.chefHat,
      width: size,
      height: size,
      fit: BoxFit.contain,
      semanticLabel: AppLocalizations.of(context).semanticChefHat,
    );
  }
}
