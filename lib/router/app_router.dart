import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../l10n/app_localizations.dart';

import '../screens/add_recipe_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/home_screen.dart';
import '../screens/notifications_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/recipe_detail_screen.dart';
import '../screens/reviews_screen.dart';
import '../screens/search_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/shell_screen.dart';
import '../screens/sign_in_screen.dart';
import '../screens/sign_up_screen.dart';
import '../screens/splash_screen.dart';

/// Routes nommées go_router.
final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (_, _) => const SplashScreen(),
    ),
    GoRoute(
      path: '/sign-in',
      name: 'signIn',
      builder: (_, _) => const SignInScreen(),
    ),
    GoRoute(
      path: '/sign-up',
      name: 'signUp',
      builder: (_, _) => const SignUpScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (_, _, shell) => ShellScreen(navigationShell: shell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              name: 'home',
              builder: (_, _) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/favorites',
              name: 'favorites',
              builder: (_, _) => const FavoritesScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/notifications',
              name: 'notifications',
              builder: (_, _) => const NotificationsScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              name: 'profile',
              builder: (_, _) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/search',
      name: 'search',
      builder: (_, _) => const SearchScreen(),
    ),
    GoRoute(
      path: '/recipe/:id',
      name: 'detail',
      builder: (_, state) =>
          RecipeDetailScreen(recipeId: state.pathParameters['id']!),
      routes: [
        GoRoute(
          path: 'reviews',
          name: 'reviews',
          builder: (_, state) =>
              ReviewsScreen(recipeId: state.pathParameters['id']!),
        ),
      ],
    ),
    GoRoute(
      path: '/add-recipe',
      name: 'addRecipe',
      builder: (_, _) => const AddRecipeScreen(),
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (_, _) => const SettingsScreen(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text(AppLocalizations.of(context).pageNotFound('${state.uri}')),
    ),
  ),
);
