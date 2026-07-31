import 'package:flutter/material.dart';

/// Seuil à partir duquel on considère l'appareil comme une tablette.
const double kTabletBreakpoint = 600;

/// Retourne `true` si la largeur disponible est celle d'une tablette.
bool isTablet(BuildContext context) {
  return MediaQuery.sizeOf(context).width >= kTabletBreakpoint;
}

/// Padding horizontal adaptatif.
double horizontalPadding(BuildContext context) {
  return isTablet(context) ? 32 : 20;
}
