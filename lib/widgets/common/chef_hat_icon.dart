import 'package:flutter/material.dart';

import '../../core/assets.dart';
import '../../l10n/app_localizations.dart';
import '../../utils/asset_image_fallback.dart';

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
      cacheWidth: (size * 3).round(),
      cacheHeight: (size * 3).round(),
      semanticLabel: AppLocalizations.of(context).semanticChefHat,
      errorBuilder: assetImageFallback,
    );
  }
}
