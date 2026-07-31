# Recipe Hub

App Flutter de recettes de cuisine. Les écrans suivent les maquettes Figma du projet.

## Score checklist (brief Navigation et Routing)

| Exigence | Statut | Où |
| --- | --- | --- |
| 4+ écrans | OK | Home, Detail, Add Recipe, Favorites, Settings, Search… |
| go_router + routes nommées | OK | `lib/router/app_router.dart` |
| Shell + bottom nav / NavigationRail | OK | `lib/screens/shell_screen.dart` |
| Recherche + filtres | OK | `RecipeProvider` + Home / Search |
| Détail `/recipe/:id` | OK | `recipe_detail_screen.dart` |
| Formulaire 3 champs + validation | OK | `add_recipe_screen.dart` + `form_validators.dart` |
| Thème clair / sombre persisté | OK | `ThemeProvider` + Settings |
| 8+ widgets Flutter | OK | ListView, GridView, Stack, Card, Hero… |
| 3+ widgets réutilisables | OK | `recipe_card`, `search_bar_widget`, `category_chip` |
| Responsive mobile / tablette | OK | `isTablet` + NavigationRail + GridView |
| Pas de data hardcodée dans widgets | OK | repository + provider |
| Tests | OK | dossier `test/` (unit + widget + router) |
| CI | OK | `.github/workflows/flutter_ci.yml` |

Détail du mapping : [docs/REQUIREMENTS.md](docs/REQUIREMENTS.md)

## Stack

- Flutter 3.x (null safety)
- go_router pour la navigation
- Provider pour l'état
- shared_preferences pour le thème clair / sombre
- google_fonts (Poppins)

## Prérequis

- Flutter SDK 3.x installé (`flutter doctor`)
- Un émulateur Android / iOS, ou un appareil, ou Chrome

Vérifier Flutter :

```bash
flutter --version
flutter doctor
```

## Installation

```bash
git clone https://github.com/Andassa/recip_hub.git
cd recip_hub
flutter pub get
```

## Lancer l'application

```bash
flutter run
```

Choisir une plateforme :

```bash
flutter run -d chrome
flutter run -d macos
flutter run -d android
```

Pour tester le mode tablette, redimensionne la fenêtre au-delà de 600 px (plus petit côté), ou utilise un émulateur tablette. Tu dois voir le `NavigationRail` à gauche à la place de la bottom nav.

## Tests

```bash
flutter test
flutter analyze
```

Couverture prévue :

- unitaires : repository, provider, validateurs, responsive
- widgets : CategoryChip, DifficultyBadge, SearchBarWidget, AddRecipe form, RecipeCard
- router : résolution des routes nommées

## Captures d'écran

### Splash
![Splash](assets/capture/Splash%20Screen.png)

### Sign in
![Sign in](assets/capture/Sign%20in.png)

### Sign up
![Sign up](assets/capture/Sign%20up.png)

### Home
![Home](assets/capture/Home.png)

### Search
![Search](assets/capture/Search.png)

### Filter
![Filter](assets/capture/Filter.png)

### Détail recette (ingrédients)
![Recipe detail](assets/capture/Receip%20Ingredient.png)

### Menu More
![More](assets/capture/receip%20ingredient/more.png)

### Share
![Share](assets/capture/receip_ingredient/share.png)

### Rate
![Rate](assets/capture/rate.png)

### Reviews
![Reviews](assets/capture/reviews.png)

### Notifications
![Notifications](assets/capture/notifications.png)

### Notification lue
![Notification read](assets/capture/notification_read.png)

### Profile
![Profile](assets/capture/Profile.png)

## Structure

```
lib/
  main.dart
  theme/        couleurs et thèmes clair / sombre
  models/       Recipe, Review, Notification
  data/         repository et données mock
  providers/    RecipeProvider, ThemeProvider
  router/       GoRouter (routes nommées)
  screens/      tous les écrans
  widgets/      cartes, chips, nav, dialogs
  utils/        isTablet, form validators, responsive
test/
  unit/         tests repository / provider / validators
  widgets/      tests UI réutilisables + formulaire
  router/       tests routes nommées
docs/
  REQUIREMENTS.md
assets/
  images/
  icons/
  capture/
```

## Fonctionnalités

- Splash, Sign in, Sign up
- Home (catégories, popular, new recipes)
- Recherche et filtres (temps, note, catégorie)
- Détail recette (ingrédients, étapes, favori, share, rate)
- Reviews
- Favoris (Saved)
- Notifications
- Profile et Settings (thème clair / sombre persisté)
- Formulaire d'ajout avec validation (titre, catégorie, durée)
- Responsive mobile et tablette (NavigationRail + GridView)

## Routes principales

- `/splash` : splash
- `/sign-in` / `/sign-up` : auth
- `/home` : accueil
- `/favorites` : favoris
- `/notifications` : notifications
- `/profile` : profil
- `/search` : recherche
- `/recipe/:id` : détail
- `/recipe/:id/reviews` : avis
- `/add-recipe` : ajout (formulaire validé)
- `/settings` : paramètres (toggle thème)

## Architecture

1. UI (`screens/`, `widgets/`) affiche les données
2. `providers/` détient l'état et appelle le repository
3. `data/recipe_repository.dart` lit / écrit les mocks
4. `models/` décrit les objets métier

Aucune liste de recettes n'est écrite dans un widget.

## Assets utiles

- Fond splash : `assets/images/splash_bg.jpg`
- Icône chef : `assets/icons/chef_hat.png`
- Photos recettes : `assets/images/recipe_1.jpg` à `recipe_4.jpg`
- Avatar : `assets/images/avatar.png`
- Captures : `assets/capture/`
