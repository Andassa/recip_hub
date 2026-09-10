// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Recipe Hub';

  @override
  String pageNotFound(String uri) {
    return 'Page not found: $uri';
  }

  @override
  String get loadRecipesFailed => 'Could not load recipes.';

  @override
  String get premiumRecipeCount => '100K+ Premium Recipe';

  @override
  String get getCooking => 'Get\nCooking';

  @override
  String get splashTagline => 'Simple way to find Tasty Recipe';

  @override
  String get startCooking => 'Start Cooking';

  @override
  String get helloComma => 'Hello,';

  @override
  String get welcomeBack => 'Welcome Back!';

  @override
  String get email => 'Email';

  @override
  String get enterEmail => 'Enter Email';

  @override
  String get enterPassword => 'Enter Password';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get signIn => 'Sign In';

  @override
  String get dontHaveAccount => 'Don\'t have an account? ';

  @override
  String get signUp => 'Sign up';

  @override
  String get emailRequired => 'Email required';

  @override
  String get invalidEmail => 'Invalid email';

  @override
  String get minSixCharacters => 'Min 6 characters';

  @override
  String get createAccount => 'Create an account';

  @override
  String get signUpSubtitle =>
      'Let\'s help you set up your account,\nit won\'t take long.';

  @override
  String get name => 'Name';

  @override
  String get enterName => 'Enter Name';

  @override
  String get nameRequired => 'Name required';

  @override
  String get password => 'Password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get retypePassword => 'Retype Password';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get acceptTermsRequired => 'Please accept terms & conditions';

  @override
  String get acceptTerms => 'Accept terms & Condition';

  @override
  String get signUpButton => 'Sign Up';

  @override
  String get alreadyMember => 'Already a member? ';

  @override
  String get orSignInWith => 'Or Sign in With';

  @override
  String get navHome => 'Home';

  @override
  String get navSaved => 'Saved';

  @override
  String get navAlerts => 'Alerts';

  @override
  String get navProfile => 'Profile';

  @override
  String get newRecipes => 'New Recipes';

  @override
  String get savedRecipes => 'Saved recipes';

  @override
  String get noSavedRecipes => 'No saved recipes yet';

  @override
  String get notifications => 'Notifications';

  @override
  String get filterAll => 'All';

  @override
  String get filterRead => 'Read';

  @override
  String get filterUnread => 'Unread';

  @override
  String get noNotifications => 'No notifications';

  @override
  String get profile => 'Profile';

  @override
  String get statRecipe => 'Recipe';

  @override
  String get statFollowers => 'Followers';

  @override
  String get statFollowing => 'Following';

  @override
  String get chefRole => 'Chef';

  @override
  String get profileBio => 'Private Chef. Passionate about food and life.';

  @override
  String get darkMode => 'Dark mode';

  @override
  String get myRecipes => 'My Recipes';

  @override
  String get searchRecipes => 'Search recipes';

  @override
  String get searchRecipeHint => 'Search recipe';

  @override
  String get searchResult => 'Search Result';

  @override
  String get recentSearch => 'Recent Search';

  @override
  String resultsCount(int count) {
    return '$count results';
  }

  @override
  String get noResults => 'No results';

  @override
  String get recipeNotFound => 'Recipe not found';

  @override
  String reviewsCount(String count) {
    return '($count Reviews)';
  }

  @override
  String serveItems(int servings, int count) {
    return '$servings serve · $count Items';
  }

  @override
  String stepsCount(int count) {
    return '$count Steps';
  }

  @override
  String thanksForRating(int rating) {
    return 'Thanks for rating $rating★';
  }

  @override
  String get reviews => 'Reviews';

  @override
  String commentsCount(int count) {
    return '$count Comments';
  }

  @override
  String savedCount(int count) {
    return '$count Saved';
  }

  @override
  String get leaveAComment => 'Leave a comment';

  @override
  String get saySomething => 'Say something...';

  @override
  String get send => 'Send';

  @override
  String get commentSent => 'Comment sent';

  @override
  String commentSentOn(String title) {
    return 'Comment sent on $title';
  }

  @override
  String get recipeAdded => 'Recipe added successfully!';

  @override
  String get addRecipe => 'Add Recipe';

  @override
  String get titleLabel => 'Title';

  @override
  String get recipeTitleHint => 'Recipe title';

  @override
  String get categoryLabel => 'Category';

  @override
  String get selectCategory => 'Select category';

  @override
  String get durationMinutes => 'Duration (minutes)';

  @override
  String get durationHint => 'e.g. 20';

  @override
  String get difficultyLabel => 'Difficulty';

  @override
  String get difficultyEasy => 'Easy';

  @override
  String get difficultyMedium => 'Medium';

  @override
  String get difficultyHard => 'Hard';

  @override
  String get descriptionSteps => 'Description / Steps';

  @override
  String get descriptionHint => 'Describe the recipe or steps (one per line)';

  @override
  String get ingredientsLabel => 'Ingredients';

  @override
  String get ingredientsHint => 'One ingredient per line';

  @override
  String get saveRecipe => 'Save Recipe';

  @override
  String get settings => 'Settings';

  @override
  String get appearance => 'Appearance';

  @override
  String get persistedOnRestart => 'Saved across restarts';

  @override
  String get language => 'Language';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageFrench => 'Français';

  @override
  String get about => 'About';

  @override
  String aboutBody(String version) {
    return 'Cooking recipe app.\nVersion $version';
  }

  @override
  String get helloJega => 'Hello Jega';

  @override
  String get whatAreYouCooking => 'What are you cooking today?';

  @override
  String get filterSearch => 'Filter Search';

  @override
  String get timeLabel => 'Time';

  @override
  String get rateLabel => 'Rate';

  @override
  String get filterButton => 'Filter';

  @override
  String get timeAll => 'All';

  @override
  String get timeNewest => 'Newest';

  @override
  String get timeOldest => 'Oldest';

  @override
  String get timePopularity => 'Popularity';

  @override
  String minsCount(int duration) {
    return '$duration Mins';
  }

  @override
  String minCount(int duration) {
    return '$duration min';
  }

  @override
  String minsLower(int duration) {
    return '$duration mins';
  }

  @override
  String byAuthor(String name) {
    return 'By $name';
  }

  @override
  String get ingredientTab => 'Ingredient';

  @override
  String get procedureTab => 'Procedure';

  @override
  String get share => 'Share';

  @override
  String get rateRecipe => 'Rate Recipe';

  @override
  String get review => 'Review';

  @override
  String get unsave => 'Unsave';

  @override
  String get save => 'Save';

  @override
  String get follow => 'Follow';

  @override
  String followingAuthor(String name) {
    return 'Following $name';
  }

  @override
  String get recipeLink => 'Recipe Link';

  @override
  String get shareRecipeBody =>
      'Copy recipe link and share your recipe link with friends and family.';

  @override
  String get linkCopied => 'Link copied!';

  @override
  String get copyLink => 'Copy Link';

  @override
  String get titleMinLength => 'Title must be at least 3 characters';

  @override
  String get categoryRequired => 'Category is required';

  @override
  String get durationRequired => 'Duration is required';

  @override
  String get enterPositiveNumber => 'Enter a positive number';

  @override
  String get emailIsRequired => 'Email is required';

  @override
  String get enterValidEmail => 'Enter a valid email';

  @override
  String get passwordMinLength => 'Password must be at least 6 characters';

  @override
  String get categoryAll => 'All';

  @override
  String get categoryIndian => 'Indian';

  @override
  String get categoryItalian => 'Italian';

  @override
  String get categoryAsian => 'Asian';

  @override
  String get categoryChinese => 'Chinese';

  @override
  String get categoryBreakfast => 'Breakfast';

  @override
  String get categoryDinner => 'Dinner';

  @override
  String get categoryLocalDish => 'Local Dish';

  @override
  String get categoryFruit => 'Fruit';

  @override
  String get categoryVegetables => 'Vegetables';

  @override
  String get categoryLunch => 'Lunch';

  @override
  String get categoryCereal => 'Cereal';

  @override
  String get categorySpanish => 'Spanish';

  @override
  String get semanticNavHome => 'Home';

  @override
  String get semanticNavSaved => 'Saved recipes';

  @override
  String get semanticNavAlerts => 'Notifications';

  @override
  String get semanticNavProfile => 'Profile';

  @override
  String get semanticAddRecipe => 'Add recipe';

  @override
  String get semanticFilters => 'Filters';

  @override
  String get semanticAddFavorite => 'Add to favorites';

  @override
  String get semanticRemoveFavorite => 'Remove from favorites';

  @override
  String get semanticBack => 'Back';

  @override
  String get semanticMore => 'More options';

  @override
  String get semanticSettings => 'Settings';

  @override
  String get semanticClose => 'Close';

  @override
  String semanticStarRating(int count) {
    return '$count stars';
  }

  @override
  String get semanticSplashImage => 'Cooking background';

  @override
  String semanticRecipeImage(String title) {
    return 'Photo of $title';
  }

  @override
  String get semanticAvatar => 'Profile photo';

  @override
  String get semanticChefHat => 'Chef hat';

  @override
  String semanticIngredientImage(String name) {
    return 'Photo of $name';
  }
}
