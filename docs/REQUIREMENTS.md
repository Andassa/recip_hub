# Cahier des charges : mapping fichier

Ce document montre où chaque exigence du brief est implémentée.

## 1. Au moins 4 écrans distincts

| Écran | Fichier |
| --- | --- |
| Home | `lib/screens/home_screen.dart` |
| Detail | `lib/screens/recipe_detail_screen.dart` |
| Add Recipe (formulaire) | `lib/screens/add_recipe_screen.dart` |
| Favorites / Saved | `lib/screens/favorites_screen.dart` |
| Settings | `lib/screens/settings_screen.dart` |
| Search | `lib/screens/search_screen.dart` |
| Splash / Sign in / Sign up | `lib/screens/splash_screen.dart`, `sign_in_screen.dart`, `sign_up_screen.dart` |
| Notifications / Profile / Reviews | `notifications_screen.dart`, `profile_screen.dart`, `reviews_screen.dart` |

## 2. Navigation go_router

- Config : `lib/router/app_router.dart`
- Shell : `StatefulShellRoute.indexedStack` + `lib/screens/shell_screen.dart`
- Routes nommées : `home`, `detail`, `addRecipe`, `favorites`, `settings`, etc.
- Mobile : `CustomBottomNav`
- Tablette : `NavigationRail`

## 3. Recherche et filtrage

- Provider : `lib/providers/recipe_provider.dart` (`setSearchQuery`, `setCategory`)
- UI Home / Search : chips + `SearchBarWidget`
- Empty state : texte `Aucun résultat` dans `search_screen.dart`

## 4. Détail avec paramètre

- Route `/recipe/:id` dans `app_router.dart`
- `state.pathParameters['id']` -> `RecipeDetailScreen`
- Image, titre, durée, difficulté, ingrédients, étapes, favori

## 5. Formulaire avec validation (3+ champs)

- UI : `lib/screens/add_recipe_screen.dart`
- `Form` + `GlobalKey<FormState>` + `TextFormField` / `DropdownButtonFormField`
- Validateurs : `lib/utils/form_validators.dart`
  - titre (min 3)
  - catégorie (obligatoire)
  - durée (nombre positif)
- Soumission via `RecipeProvider.addRecipe` + SnackBar

## 6. Thème clair / sombre

- `lib/theme/app_theme.dart` (`ColorScheme.fromSeed`)
- `lib/providers/theme_provider.dart` + `shared_preferences`
- Toggle : `lib/screens/settings_screen.dart`

## 7. Au moins 8 widgets Flutter différents

Utilisés dans le projet :

1. `ListView` / `ListView.builder` (Home, Favorites)
2. `GridView.builder` (Search, Favorites tablette)
3. `Stack` (Splash, RecipeCard, Hero image)
4. `Card` (Settings)
5. `Hero` (liste -> détail)
6. `CircularProgressIndicator` (Home, Favorites)
7. `NavigationRail` (tablette, ShellScreen)
8. `BottomNavigationBar` custom (`CustomBottomNav`)
9. `Form` / `TextFormField` / `DropdownButtonFormField`
10. `FloatingActionButton` (tablette)

## 8. Au moins 3 widgets réutilisables

- `lib/widgets/recipe_card.dart`
- `lib/widgets/search_bar_widget.dart`
- `lib/widgets/category_chip.dart`
- `lib/widgets/difficulty_badge.dart`

Ils reçoivent leurs données en paramètres. Aucune liste mock dedans.

## 9. Responsive mobile / tablette

- Utils : `lib/utils/responsive.dart` (`isTablet`, `gridCrossAxisCount`, `horizontalPadding`)
- Mobile (< 600 shortestSide) : bottom nav
- Tablette (>= 600) : `NavigationRail` + grilles multi-colonnes

## 10. Pas de données hardcodées dans les widgets

- Données : `lib/data/mock_recipes.dart`
- Accès : `lib/data/recipe_repository.dart`
- État : `lib/providers/recipe_provider.dart`
- Widgets / screens : modèles + callbacks uniquement

## Architecture en couches

```
screens/ widgets/  -> UI
providers/         -> état (ChangeNotifier)
data/              -> repository
models/            -> objets métier
```

## Tests

Voir le dossier `test/` :

- unitaires : repository, provider, validateurs, responsive
- widgets : chips, badge, search bar, formulaire, cartes
- router : routes nommées
