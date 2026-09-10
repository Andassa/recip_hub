import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../l10n/app_localizations.dart';
import '../utils/responsive.dart';
import '../widgets/custom_bottom_nav.dart';

class ShellScreen extends StatelessWidget {
  const ShellScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        navigationShell.goBranch(0);
      case 1:
        navigationShell.goBranch(1);
      case 2:
        navigationShell.goBranch(2);
      case 3:
        navigationShell.goBranch(3);
      case 4:
        context.goNamed('addRecipe');
    }
  }

  @override
  Widget build(BuildContext context) {
    final index = navigationShell.currentIndex;
    final l10n = AppLocalizations.of(context);

    if (isTablet(context)) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.goNamed('addRecipe'),
          child: const Icon(Icons.add),
        ),
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: index,
              onDestinationSelected: navigationShell.goBranch,
              labelType: NavigationRailLabelType.all,
              destinations: [
                NavigationRailDestination(
                  icon: const Icon(Icons.home_outlined),
                  selectedIcon: const Icon(Icons.home),
                  label: Text(l10n.navHome),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.bookmark_border),
                  selectedIcon: const Icon(Icons.bookmark),
                  label: Text(l10n.navSaved),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.notifications_none),
                  selectedIcon: const Icon(Icons.notifications),
                  label: Text(l10n.navAlerts),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.person_outline),
                  selectedIcon: const Icon(Icons.person),
                  label: Text(l10n.navProfile),
                ),
              ],
            ),
            const VerticalDivider(width: 1),
            Expanded(child: navigationShell),
          ],
        ),
      );
    }

    return Scaffold(
      extendBody: true,
      body: navigationShell,
      bottomNavigationBar: Material(
        color: Colors.transparent,
        elevation: 0,
        child: CustomBottomNav(
          currentIndex: index,
          onTap: (i) => _onTap(context, i),
        ),
      ),
    );
  }
}
