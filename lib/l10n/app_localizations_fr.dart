// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Recipe Hub';

  @override
  String pageNotFound(String uri) {
    return 'Page introuvable : $uri';
  }

  @override
  String get loadRecipesFailed => 'Impossible de charger les recettes.';

  @override
  String get premiumRecipeCount => '100K+ recettes premium';

  @override
  String get getCooking => 'Get\nCooking';

  @override
  String get splashTagline => 'Trouvez facilement une recette savoureuse';

  @override
  String get startCooking => 'Commencer';

  @override
  String get helloComma => 'Bonjour,';

  @override
  String get welcomeBack => 'Bon retour !';

  @override
  String get email => 'E-mail';

  @override
  String get enterEmail => 'Entrez l\'e-mail';

  @override
  String get enterPassword => 'Entrez le mot de passe';

  @override
  String get forgotPassword => 'Mot de passe oublié ?';

  @override
  String get signIn => 'Connexion';

  @override
  String get dontHaveAccount => 'Pas encore de compte ? ';

  @override
  String get signUp => 'S\'inscrire';

  @override
  String get emailRequired => 'E-mail requis';

  @override
  String get invalidEmail => 'E-mail invalide';

  @override
  String get minSixCharacters => '6 caractères minimum';

  @override
  String get createAccount => 'Créer un compte';

  @override
  String get signUpSubtitle =>
      'Configurons votre compte,\nça ne prendra pas longtemps.';

  @override
  String get name => 'Nom';

  @override
  String get enterName => 'Entrez le nom';

  @override
  String get nameRequired => 'Nom requis';

  @override
  String get password => 'Mot de passe';

  @override
  String get confirmPassword => 'Confirmer le mot de passe';

  @override
  String get retypePassword => 'Retapez le mot de passe';

  @override
  String get passwordsDoNotMatch => 'Les mots de passe ne correspondent pas';

  @override
  String get acceptTermsRequired => 'Veuillez accepter les conditions';

  @override
  String get acceptTerms => 'Accepter les conditions';

  @override
  String get signUpButton => 'S\'inscrire';

  @override
  String get alreadyMember => 'Déjà membre ? ';

  @override
  String get orSignInWith => 'Ou se connecter avec';

  @override
  String get navHome => 'Accueil';

  @override
  String get navSaved => 'Favoris';

  @override
  String get navAlerts => 'Alertes';

  @override
  String get navProfile => 'Profil';

  @override
  String get newRecipes => 'Nouvelles recettes';

  @override
  String get savedRecipes => 'Recettes enregistrées';

  @override
  String get noSavedRecipes => 'Aucune recette enregistrée';

  @override
  String get notifications => 'Notifications';

  @override
  String get filterAll => 'Toutes';

  @override
  String get filterRead => 'Lues';

  @override
  String get filterUnread => 'Non lues';

  @override
  String get noNotifications => 'Aucune notification';

  @override
  String get profile => 'Profil';

  @override
  String get statRecipe => 'Recette';

  @override
  String get statFollowers => 'Abonnés';

  @override
  String get statFollowing => 'Abonnements';

  @override
  String get chefRole => 'Chef';

  @override
  String get profileBio => 'Chef privé. Passionné de cuisine et de vie.';

  @override
  String get darkMode => 'Mode sombre';

  @override
  String get myRecipes => 'Mes recettes';

  @override
  String get searchRecipes => 'Rechercher des recettes';

  @override
  String get searchRecipeHint => 'Rechercher une recette';

  @override
  String get searchResult => 'Résultat de recherche';

  @override
  String get recentSearch => 'Recherches récentes';

  @override
  String resultsCount(int count) {
    return '$count résultats';
  }

  @override
  String get noResults => 'Aucun résultat';

  @override
  String get recipeNotFound => 'Recette introuvable';

  @override
  String reviewsCount(String count) {
    return '($count avis)';
  }

  @override
  String serveItems(int servings, int count) {
    return '$servings pers. · $count ingrédients';
  }

  @override
  String stepsCount(int count) {
    return '$count étapes';
  }

  @override
  String thanksForRating(int rating) {
    return 'Merci pour la note $rating★';
  }

  @override
  String get reviews => 'Avis';

  @override
  String commentsCount(int count) {
    return '$count commentaires';
  }

  @override
  String savedCount(int count) {
    return '$count enregistrés';
  }

  @override
  String get leaveAComment => 'Laisser un commentaire';

  @override
  String get saySomething => 'Écrire un commentaire...';

  @override
  String get send => 'Envoyer';

  @override
  String get commentSent => 'Commentaire envoyé';

  @override
  String commentSentOn(String title) {
    return 'Commentaire envoyé sur $title';
  }

  @override
  String get recipeAdded => 'Recette ajoutée !';

  @override
  String get addRecipe => 'Ajouter une recette';

  @override
  String get titleLabel => 'Titre';

  @override
  String get recipeTitleHint => 'Titre de la recette';

  @override
  String get categoryLabel => 'Catégorie';

  @override
  String get selectCategory => 'Choisir une catégorie';

  @override
  String get durationMinutes => 'Durée (minutes)';

  @override
  String get durationHint => 'ex. 20';

  @override
  String get difficultyLabel => 'Difficulté';

  @override
  String get difficultyEasy => 'Facile';

  @override
  String get difficultyMedium => 'Moyen';

  @override
  String get difficultyHard => 'Difficile';

  @override
  String get descriptionSteps => 'Description / Étapes';

  @override
  String get descriptionHint =>
      'Décrivez la recette ou les étapes (une par ligne)';

  @override
  String get ingredientsLabel => 'Ingrédients';

  @override
  String get ingredientsHint => 'Un ingrédient par ligne';

  @override
  String get saveRecipe => 'Enregistrer';

  @override
  String get settings => 'Paramètres';

  @override
  String get appearance => 'Apparence';

  @override
  String get persistedOnRestart => 'Conservé au redémarrage';

  @override
  String get language => 'Langue';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageFrench => 'Français';

  @override
  String get about => 'À propos';

  @override
  String aboutBody(String version) {
    return 'Application de recettes de cuisine.\nVersion $version';
  }

  @override
  String get helloJega => 'Bonjour Jega';

  @override
  String get whatAreYouCooking => 'Que cuisinez-vous aujourd\'hui ?';

  @override
  String get filterSearch => 'Filtrer la recherche';

  @override
  String get timeLabel => 'Temps';

  @override
  String get rateLabel => 'Note';

  @override
  String get filterButton => 'Filtrer';

  @override
  String get timeAll => 'Tous';

  @override
  String get timeNewest => 'Plus récent';

  @override
  String get timeOldest => 'Plus ancien';

  @override
  String get timePopularity => 'Popularité';

  @override
  String minsCount(int duration) {
    return '$duration min';
  }

  @override
  String minCount(int duration) {
    return '$duration min';
  }

  @override
  String minsLower(int duration) {
    return '$duration min';
  }

  @override
  String byAuthor(String name) {
    return 'Par $name';
  }

  @override
  String get ingredientTab => 'Ingrédients';

  @override
  String get procedureTab => 'Préparation';

  @override
  String get share => 'Partager';

  @override
  String get rateRecipe => 'Noter la recette';

  @override
  String get review => 'Avis';

  @override
  String get unsave => 'Retirer';

  @override
  String get save => 'Enregistrer';

  @override
  String get follow => 'Suivre';

  @override
  String followingAuthor(String name) {
    return 'Vous suivez $name';
  }

  @override
  String get recipeLink => 'Lien de la recette';

  @override
  String get shareRecipeBody =>
      'Copiez le lien pour le partager avec vos proches.';

  @override
  String get linkCopied => 'Lien copié !';

  @override
  String get copyLink => 'Copier le lien';

  @override
  String get titleMinLength => 'Le titre doit contenir au moins 3 caractères';

  @override
  String get categoryRequired => 'La catégorie est obligatoire';

  @override
  String get durationRequired => 'La durée est obligatoire';

  @override
  String get enterPositiveNumber => 'Entrez un nombre positif';

  @override
  String get emailIsRequired => 'L\'e-mail est obligatoire';

  @override
  String get enterValidEmail => 'Entrez un e-mail valide';

  @override
  String get passwordMinLength =>
      'Le mot de passe doit contenir au moins 6 caractères';

  @override
  String get categoryAll => 'Toutes';

  @override
  String get categoryIndian => 'Indienne';

  @override
  String get categoryItalian => 'Italienne';

  @override
  String get categoryAsian => 'Asiatique';

  @override
  String get categoryChinese => 'Chinoise';

  @override
  String get categoryBreakfast => 'Petit-déjeuner';

  @override
  String get categoryDinner => 'Dîner';

  @override
  String get categoryLocalDish => 'Plat local';

  @override
  String get categoryFruit => 'Fruit';

  @override
  String get categoryVegetables => 'Légumes';

  @override
  String get categoryLunch => 'Déjeuner';

  @override
  String get categoryCereal => 'Céréales';

  @override
  String get categorySpanish => 'Espagnole';

  @override
  String get semanticNavHome => 'Accueil';

  @override
  String get semanticNavSaved => 'Recettes enregistrées';

  @override
  String get semanticNavAlerts => 'Notifications';

  @override
  String get semanticNavProfile => 'Profil';

  @override
  String get semanticAddRecipe => 'Ajouter une recette';

  @override
  String get semanticFilters => 'Filtres';

  @override
  String get semanticAddFavorite => 'Ajouter aux favoris';

  @override
  String get semanticRemoveFavorite => 'Retirer des favoris';

  @override
  String get semanticBack => 'Retour';

  @override
  String get semanticMore => 'Plus d\'options';

  @override
  String get semanticSettings => 'Paramètres';

  @override
  String get semanticClose => 'Fermer';

  @override
  String semanticStarRating(int count) {
    return '$count étoiles';
  }

  @override
  String get semanticSplashImage => 'Arrière-plan cuisine';

  @override
  String semanticRecipeImage(String title) {
    return 'Photo de $title';
  }

  @override
  String get semanticAvatar => 'Photo de profil';

  @override
  String get semanticChefHat => 'Toque de chef';

  @override
  String semanticIngredientImage(String name) {
    return 'Photo de $name';
  }
}
