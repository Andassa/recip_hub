# Recipe Hub

Application Flutter de recettes de cuisine, fidèle aux maquettes Figma (pixel-perfect).

## Stack technique

- Flutter 3.x (null safety)
- **go_router** — navigation déclarative + `StatefulShellRoute`
- **Provider** — state management
- **shared_preferences** — persistance du thème clair/sombre
- **google_fonts** — typographie Poppins
- **flutter_svg** — icône chef hat

## Captures d'écran

> Remplace les placeholders ci-dessous par tes screenshots :

| Splash | Sign In | Home |
|--------|---------|------|
| ![Splash](docs/screenshots/splash.png) | ![Sign In](docs/screenshots/sign_in.png) | ![Home](docs/screenshots/home.png) |

## Installation

```bash
flutter pub get
flutter run
```

## Structure du projet

```
lib/
  main.dart
  theme/          → couleurs + ThemeData clair/sombre
  models/         → Recipe, Ingredient
  data/           → repository + mock data (12 recettes)
  providers/      → RecipeProvider, ThemeProvider
  router/         → GoRouter (routes nommées)
  screens/        → Splash, Auth, Home, Search, Detail, Add, Favorites, Settings
  widgets/        → cartes, chips, search bar, bottom nav, filter sheet…
  utils/          → isTablet() / responsive helpers
assets/
  images/         → fonds et photos recettes
  icons/          → SVG (chef hat)
```

## Fonctionnalités

- Splash + Sign In / Sign Up (UI Figma)
- Home avec catégories, popular cards, new recipes
- Recherche + filtre avancé (Time / Rate / Category)
- Détail recette (Ingredients / Procedure, menu More, Share)
- Favoris (Saved recipes)
- Formulaire d’ajout avec validation
- Thème clair / sombre persisté
- Responsive mobile (< 600px) / tablette (≥ 600px)

## Assets

| Usage | Fichier |
|-------|---------|
| Splash background | `assets/images/splash_bg.jpg` |
| Chef hat icon | `assets/icons/chef_hat.svg` |
| Recipe photos | `assets/images/recipe_1.jpg` … `recipe_4.jpg` |
| Avatar | `assets/images/avatar.png` |
