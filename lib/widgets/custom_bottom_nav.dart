import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Bottom navigation Figma avec encoche centrale pour le FAB.
class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 78,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomPaint(
            size: Size(MediaQuery.sizeOf(context).width, 62),
            painter: _NavBarPainter(),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavIcon(
                  icon: Icons.home_outlined,
                  activeIcon: Icons.home,
                  selected: currentIndex == 0,
                  onTap: () => onTap(0),
                ),
                _NavIcon(
                  icon: Icons.bookmark_border,
                  activeIcon: Icons.bookmark,
                  selected: currentIndex == 1,
                  onTap: () => onTap(1),
                ),
                const SizedBox(width: 56),
                _NavIcon(
                  icon: Icons.notifications_none_outlined,
                  activeIcon: Icons.notifications,
                  selected: currentIndex == 2,
                  onTap: () => onTap(2),
                ),
                _NavIcon(
                  icon: Icons.person_outline,
                  activeIcon: Icons.person,
                  selected: currentIndex == 3,
                  onTap: () => onTap(3),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            child: GestureDetector(
              onTap: () => onTap(4),
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.35),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(Icons.add, color: AppColors.white, size: 28),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  const _NavIcon({
    required this.icon,
    required this.activeIcon,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final IconData activeIcon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        selected ? activeIcon : icon,
        color: selected ? AppColors.primary : AppColors.textSecondary,
        size: 26,
      ),
    );
  }
}

class _NavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.white
      ..style = PaintingStyle.fill;

    final shadowPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.06)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

    final path = Path();
    final notchRadius = 34.0;
    final centerX = size.width / 2;

    path.moveTo(0, 0);
    path.lineTo(centerX - notchRadius - 12, 0);
    path.quadraticBezierTo(
      centerX - notchRadius,
      0,
      centerX - notchRadius + 4,
      10,
    );
    path.arcToPoint(
      Offset(centerX + notchRadius - 4, 10),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );
    path.quadraticBezierTo(
      centerX + notchRadius,
      0,
      centerX + notchRadius + 12,
      0,
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path.shift(const Offset(0, -2)), shadowPaint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
