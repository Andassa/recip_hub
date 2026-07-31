# Recipe Hub

App Flutter de recettes de cuisine. Les écrans suivent les maquettes Figma du projet.

## Stack

- Flutter 3.x (null safety)
- go_router pour la navigation
- Provider pour l'état
- shared_preferences pour le thème clair / sombre
- google_fonts (Poppins)

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

## Installation

```bash
flutter pub get
flutter run
```

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
  utils/        isTablet et padding responsive
assets/
  images/       photos recettes et fonds
  icons/        chef hat
  capture/      screenshots de l'app
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
- Formulaire d'ajout avec validation
- Responsive mobile et tablette (NavigationRail)

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
- `/add-recipe` : ajout
- `/settings` : paramètres

## Assets utiles

- Fond splash : `assets/images/splash_bg.jpg`
- Icône chef : `assets/icons/chef_hat.png`
- Photos recettes : `assets/images/recipe_1.jpg` à `recipe_4.jpg`
- Avatar : `assets/images/avatar.png`
- Captures : `assets/capture/`
