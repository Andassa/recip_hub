import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

Widget assetImageFallback(
  BuildContext context,
  Object error,
  StackTrace? stackTrace,
) {
  return const ColoredBox(
    color: AppColors.cardLight,
    child: Center(
      child: Icon(Icons.broken_image_outlined, color: AppColors.textMuted),
    ),
  );
}
