import 'package:flutter/material.dart';

/// Seuil tablette (plus petit côté >= 600).
const double kTabletBreakpoint = 600;

/// `true` si l'appareil est considéré comme tablette.
/// Utilise [Size.shortestSide] pour rester fiable en portrait et paysage.
bool isTablet(BuildContext context) {
  return MediaQuery.sizeOf(context).shortestSide >= kTabletBreakpoint;
}

/// Padding horizontal adaptatif mobile / tablette.
double horizontalPadding(BuildContext context) {
  return isTablet(context) ? 32 : 20;
}

/// Nombre de colonnes pour les grilles de recettes.
int gridCrossAxisCount(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;
  if (width >= 900) return 3;
  if (isTablet(context)) return 2;
  return 1;
}
