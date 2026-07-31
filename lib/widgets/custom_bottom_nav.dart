import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Bottom nav Figma : barre blanche, encoche circulaire, FAB central.
class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const double fabSize = 56;
  static const double notchMargin = 8;
  static const double barHeight = 62;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return SizedBox(
      height: barHeight + fabSize / 2 + bottomInset,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: barHeight + bottomInset,
            child: CustomPaint(
              painter: _NavBarPainter(
                fabRadius: fabSize / 2,
                notchMargin: notchMargin,
                bottomInset: bottomInset,
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom: bottomInset),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _NavIcon(
                            outlined: Icons.home_outlined,
                            filled: Icons.home_rounded,
                            selected: currentIndex == 0,
                            onTap: () => onTap(0),
                          ),
                          _NavIcon(
                            outlined: Icons.bookmark_border_rounded,
                            filled: Icons.bookmark_rounded,
                            selected: currentIndex == 1,
                            onTap: () => onTap(1),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: fabSize + notchMargin * 2),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _NavIcon(
                            outlined: Icons.notifications_none_rounded,
                            filled: Icons.notifications_rounded,
                            selected: currentIndex == 2,
                            onTap: () => onTap(2),
                          ),
                          _NavIcon(
                            outlined: Icons.person_outline_rounded,
                            filled: Icons.person_rounded,
                            selected: currentIndex == 3,
                            onTap: () => onTap(3),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: _FabButton(onTap: () => onTap(4)),
          ),
        ],
      ),
    );
  }
}

class _FabButton extends StatelessWidget {
  const _FabButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primary,
      shape: const CircleBorder(),
      elevation: 4,
      shadowColor: Colors.black26,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: const SizedBox(
          width: CustomBottomNav.fabSize,
          height: CustomBottomNav.fabSize,
          child: Icon(Icons.add, color: AppColors.white, size: 28),
        ),
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  const _NavIcon({
    required this.outlined,
    required this.filled,
    required this.selected,
    required this.onTap,
  });

  final IconData outlined;
  final IconData filled;
  final bool selected;
  final VoidCallback onTap;

  /// Gris clair des icônes inactives (maquette).
  static const Color _inactive = Color(0xFFD8D8D8);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: SizedBox(
        width: 48,
        height: CustomBottomNav.barHeight,
        child: Center(
          child: selected
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    // Remplissage très léger teal (état actif maquette)
                    Icon(
                      filled,
                      size: 26,
                      color: AppColors.primary.withValues(alpha: 0.16),
                    ),
                    Icon(outlined, size: 26, color: AppColors.primary),
                  ],
                )
              : Icon(outlined, size: 26, color: _inactive),
        ),
      ),
    );
  }
}

class _NavBarPainter extends CustomPainter {
  _NavBarPainter({
    required this.fabRadius,
    required this.notchMargin,
    required this.bottomInset,
  });

  final double fabRadius;
  final double notchMargin;
  final double bottomInset;

  @override
  void paint(Canvas canvas, Size size) {
    final barHeight = size.height - bottomInset;
    final host = Rect.fromLTWH(0, 0, size.width, barHeight);
    final notchRadius = fabRadius + notchMargin;
    final guest = Rect.fromCircle(
      center: Offset(size.width / 2, 0),
      radius: notchRadius,
    );

    final path = CircularNotchedRectangle().getOuterPath(host, guest);

    canvas.drawShadow(path, Colors.black.withValues(alpha: 0.16), 6, true);

    final paint = Paint()
      ..color = AppColors.white
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final fullPath = Path()
      ..addPath(path, Offset.zero)
      ..addRect(Rect.fromLTWH(0, barHeight - 1, size.width, bottomInset + 1));

    canvas.drawPath(fullPath, paint);
  }

  @override
  bool shouldRepaint(covariant _NavBarPainter oldDelegate) {
    return oldDelegate.fabRadius != fabRadius ||
        oldDelegate.notchMargin != notchMargin ||
        oldDelegate.bottomInset != bottomInset;
  }
}
