import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Recipe Hub'**
  String get appTitle;

  /// No description provided for @pageNotFound.
  ///
  /// In en, this message translates to:
  /// **'Page not found: {uri}'**
  String pageNotFound(String uri);

  /// No description provided for @loadRecipesFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not load recipes.'**
  String get loadRecipesFailed;

  /// No description provided for @premiumRecipeCount.
  ///
  /// In en, this message translates to:
  /// **'100K+ Premium Recipe'**
  String get premiumRecipeCount;

  /// No description provided for @getCooking.
  ///
  /// In en, this message translates to:
  /// **'Get\nCooking'**
  String get getCooking;

  /// No description provided for @splashTagline.
  ///
  /// In en, this message translates to:
  /// **'Simple way to find Tasty Recipe'**
  String get splashTagline;

  /// No description provided for @startCooking.
  ///
  /// In en, this message translates to:
  /// **'Start Cooking'**
  String get startCooking;

  /// No description provided for @helloComma.
  ///
  /// In en, this message translates to:
  /// **'Hello,'**
  String get helloComma;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back!'**
  String get welcomeBack;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter Email'**
  String get enterEmail;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter Password'**
  String get enterPassword;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get dontHaveAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email required'**
  String get emailRequired;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get invalidEmail;

  /// No description provided for @minSixCharacters.
  ///
  /// In en, this message translates to:
  /// **'Min 6 characters'**
  String get minSixCharacters;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create an account'**
  String get createAccount;

  /// No description provided for @signUpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Let\'s help you set up your account,\nit won\'t take long.'**
  String get signUpSubtitle;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @enterName.
  ///
  /// In en, this message translates to:
  /// **'Enter Name'**
  String get enterName;

  /// No description provided for @nameRequired.
  ///
  /// In en, this message translates to:
  /// **'Name required'**
  String get nameRequired;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @retypePassword.
  ///
  /// In en, this message translates to:
  /// **'Retype Password'**
  String get retypePassword;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @acceptTermsRequired.
  ///
  /// In en, this message translates to:
  /// **'Please accept terms & conditions'**
  String get acceptTermsRequired;

  /// No description provided for @acceptTerms.
  ///
  /// In en, this message translates to:
  /// **'Accept terms & Condition'**
  String get acceptTerms;

  /// No description provided for @signUpButton.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUpButton;

  /// No description provided for @alreadyMember.
  ///
  /// In en, this message translates to:
  /// **'Already a member? '**
  String get alreadyMember;

  /// No description provided for @orSignInWith.
  ///
  /// In en, this message translates to:
  /// **'Or Sign in With'**
  String get orSignInWith;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get navSaved;

  /// No description provided for @navAlerts.
  ///
  /// In en, this message translates to:
  /// **'Alerts'**
  String get navAlerts;

  /// No description provided for @navProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// No description provided for @newRecipes.
  ///
  /// In en, this message translates to:
  /// **'New Recipes'**
  String get newRecipes;

  /// No description provided for @savedRecipes.
  ///
  /// In en, this message translates to:
  /// **'Saved recipes'**
  String get savedRecipes;

  /// No description provided for @noSavedRecipes.
  ///
  /// In en, this message translates to:
  /// **'No saved recipes yet'**
  String get noSavedRecipes;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @filterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get filterAll;

  /// No description provided for @filterRead.
  ///
  /// In en, this message translates to:
  /// **'Read'**
  String get filterRead;

  /// No description provided for @filterUnread.
  ///
  /// In en, this message translates to:
  /// **'Unread'**
  String get filterUnread;

  /// No description provided for @noNotifications.
  ///
  /// In en, this message translates to:
  /// **'No notifications'**
  String get noNotifications;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @statRecipe.
  ///
  /// In en, this message translates to:
  /// **'Recipe'**
  String get statRecipe;

  /// No description provided for @statFollowers.
  ///
  /// In en, this message translates to:
  /// **'Followers'**
  String get statFollowers;

  /// No description provided for @statFollowing.
  ///
  /// In en, this message translates to:
  /// **'Following'**
  String get statFollowing;

  /// No description provided for @chefRole.
  ///
  /// In en, this message translates to:
  /// **'Chef'**
  String get chefRole;

  /// No description provided for @profileBio.
  ///
  /// In en, this message translates to:
  /// **'Private Chef. Passionate about food and life.'**
  String get profileBio;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark mode'**
  String get darkMode;

  /// No description provided for @myRecipes.
  ///
  /// In en, this message translates to:
  /// **'My Recipes'**
  String get myRecipes;

  /// No description provided for @searchRecipes.
  ///
  /// In en, this message translates to:
  /// **'Search recipes'**
  String get searchRecipes;

  /// No description provided for @searchRecipeHint.
  ///
  /// In en, this message translates to:
  /// **'Search recipe'**
  String get searchRecipeHint;

  /// No description provided for @searchResult.
  ///
  /// In en, this message translates to:
  /// **'Search Result'**
  String get searchResult;

  /// No description provided for @recentSearch.
  ///
  /// In en, this message translates to:
  /// **'Recent Search'**
  String get recentSearch;

  /// No description provided for @resultsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} results'**
  String resultsCount(int count);

  /// No description provided for @noResults.
  ///
  /// In en, this message translates to:
  /// **'No results'**
  String get noResults;

  /// No description provided for @recipeNotFound.
  ///
  /// In en, this message translates to:
  /// **'Recipe not found'**
  String get recipeNotFound;

  /// No description provided for @reviewsCount.
  ///
  /// In en, this message translates to:
  /// **'({count} Reviews)'**
  String reviewsCount(String count);

  /// No description provided for @serveItems.
  ///
  /// In en, this message translates to:
  /// **'{servings} serve · {count} Items'**
  String serveItems(int servings, int count);

  /// No description provided for @stepsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} Steps'**
  String stepsCount(int count);

  /// No description provided for @thanksForRating.
  ///
  /// In en, this message translates to:
  /// **'Thanks for rating {rating}★'**
  String thanksForRating(int rating);

  /// No description provided for @reviews.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviews;

  /// No description provided for @commentsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} Comments'**
  String commentsCount(int count);

  /// No description provided for @savedCount.
  ///
  /// In en, this message translates to:
  /// **'{count} Saved'**
  String savedCount(int count);

  /// No description provided for @leaveAComment.
  ///
  /// In en, this message translates to:
  /// **'Leave a comment'**
  String get leaveAComment;

  /// No description provided for @saySomething.
  ///
  /// In en, this message translates to:
  /// **'Say something...'**
  String get saySomething;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @commentSent.
  ///
  /// In en, this message translates to:
  /// **'Comment sent'**
  String get commentSent;

  /// No description provided for @commentSentOn.
  ///
  /// In en, this message translates to:
  /// **'Comment sent on {title}'**
  String commentSentOn(String title);

  /// No description provided for @recipeAdded.
  ///
  /// In en, this message translates to:
  /// **'Recipe added successfully!'**
  String get recipeAdded;

  /// No description provided for @addRecipe.
  ///
  /// In en, this message translates to:
  /// **'Add Recipe'**
  String get addRecipe;

  /// No description provided for @titleLabel.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get titleLabel;

  /// No description provided for @recipeTitleHint.
  ///
  /// In en, this message translates to:
  /// **'Recipe title'**
  String get recipeTitleHint;

  /// No description provided for @categoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get categoryLabel;

  /// No description provided for @selectCategory.
  ///
  /// In en, this message translates to:
  /// **'Select category'**
  String get selectCategory;

  /// No description provided for @durationMinutes.
  ///
  /// In en, this message translates to:
  /// **'Duration (minutes)'**
  String get durationMinutes;

  /// No description provided for @durationHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 20'**
  String get durationHint;

  /// No description provided for @difficultyLabel.
  ///
  /// In en, this message translates to:
  /// **'Difficulty'**
  String get difficultyLabel;

  /// No description provided for @difficultyEasy.
  ///
  /// In en, this message translates to:
  /// **'Easy'**
  String get difficultyEasy;

  /// No description provided for @difficultyMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get difficultyMedium;

  /// No description provided for @difficultyHard.
  ///
  /// In en, this message translates to:
  /// **'Hard'**
  String get difficultyHard;

  /// No description provided for @descriptionSteps.
  ///
  /// In en, this message translates to:
  /// **'Description / Steps'**
  String get descriptionSteps;

  /// No description provided for @descriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Describe the recipe or steps (one per line)'**
  String get descriptionHint;

  /// No description provided for @ingredientsLabel.
  ///
  /// In en, this message translates to:
  /// **'Ingredients'**
  String get ingredientsLabel;

  /// No description provided for @ingredientsHint.
  ///
  /// In en, this message translates to:
  /// **'One ingredient per line'**
  String get ingredientsHint;

  /// No description provided for @saveRecipe.
  ///
  /// In en, this message translates to:
  /// **'Save Recipe'**
  String get saveRecipe;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @persistedOnRestart.
  ///
  /// In en, this message translates to:
  /// **'Saved across restarts'**
  String get persistedOnRestart;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageFrench.
  ///
  /// In en, this message translates to:
  /// **'Français'**
  String get languageFrench;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @aboutBody.
  ///
  /// In en, this message translates to:
  /// **'Cooking recipe app.\nVersion {version}'**
  String aboutBody(String version);

  /// No description provided for @helloJega.
  ///
  /// In en, this message translates to:
  /// **'Hello Jega'**
  String get helloJega;

  /// No description provided for @whatAreYouCooking.
  ///
  /// In en, this message translates to:
  /// **'What are you cooking today?'**
  String get whatAreYouCooking;

  /// No description provided for @filterSearch.
  ///
  /// In en, this message translates to:
  /// **'Filter Search'**
  String get filterSearch;

  /// No description provided for @timeLabel.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get timeLabel;

  /// No description provided for @rateLabel.
  ///
  /// In en, this message translates to:
  /// **'Rate'**
  String get rateLabel;

  /// No description provided for @filterButton.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filterButton;

  /// No description provided for @timeAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get timeAll;

  /// No description provided for @timeNewest.
  ///
  /// In en, this message translates to:
  /// **'Newest'**
  String get timeNewest;

  /// No description provided for @timeOldest.
  ///
  /// In en, this message translates to:
  /// **'Oldest'**
  String get timeOldest;

  /// No description provided for @timePopularity.
  ///
  /// In en, this message translates to:
  /// **'Popularity'**
  String get timePopularity;

  /// No description provided for @minsCount.
  ///
  /// In en, this message translates to:
  /// **'{duration} Mins'**
  String minsCount(int duration);

  /// No description provided for @minCount.
  ///
  /// In en, this message translates to:
  /// **'{duration} min'**
  String minCount(int duration);

  /// No description provided for @minsLower.
  ///
  /// In en, this message translates to:
  /// **'{duration} mins'**
  String minsLower(int duration);

  /// No description provided for @byAuthor.
  ///
  /// In en, this message translates to:
  /// **'By {name}'**
  String byAuthor(String name);

  /// No description provided for @ingredientTab.
  ///
  /// In en, this message translates to:
  /// **'Ingredient'**
  String get ingredientTab;

  /// No description provided for @procedureTab.
  ///
  /// In en, this message translates to:
  /// **'Procedure'**
  String get procedureTab;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @rateRecipe.
  ///
  /// In en, this message translates to:
  /// **'Rate Recipe'**
  String get rateRecipe;

  /// No description provided for @review.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get review;

  /// No description provided for @unsave.
  ///
  /// In en, this message translates to:
  /// **'Unsave'**
  String get unsave;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @follow.
  ///
  /// In en, this message translates to:
  /// **'Follow'**
  String get follow;

  /// No description provided for @followingAuthor.
  ///
  /// In en, this message translates to:
  /// **'Following {name}'**
  String followingAuthor(String name);

  /// No description provided for @recipeLink.
  ///
  /// In en, this message translates to:
  /// **'Recipe Link'**
  String get recipeLink;

  /// No description provided for @shareRecipeBody.
  ///
  /// In en, this message translates to:
  /// **'Copy recipe link and share your recipe link with friends and family.'**
  String get shareRecipeBody;

  /// No description provided for @linkCopied.
  ///
  /// In en, this message translates to:
  /// **'Link copied!'**
  String get linkCopied;

  /// No description provided for @copyLink.
  ///
  /// In en, this message translates to:
  /// **'Copy Link'**
  String get copyLink;

  /// No description provided for @titleMinLength.
  ///
  /// In en, this message translates to:
  /// **'Title must be at least 3 characters'**
  String get titleMinLength;

  /// No description provided for @categoryRequired.
  ///
  /// In en, this message translates to:
  /// **'Category is required'**
  String get categoryRequired;

  /// No description provided for @durationRequired.
  ///
  /// In en, this message translates to:
  /// **'Duration is required'**
  String get durationRequired;

  /// No description provided for @enterPositiveNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter a positive number'**
  String get enterPositiveNumber;

  /// No description provided for @emailIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailIsRequired;

  /// No description provided for @enterValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email'**
  String get enterValidEmail;

  /// No description provided for @passwordMinLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordMinLength;

  /// No description provided for @categoryAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get categoryAll;

  /// No description provided for @categoryIndian.
  ///
  /// In en, this message translates to:
  /// **'Indian'**
  String get categoryIndian;

  /// No description provided for @categoryItalian.
  ///
  /// In en, this message translates to:
  /// **'Italian'**
  String get categoryItalian;

  /// No description provided for @categoryAsian.
  ///
  /// In en, this message translates to:
  /// **'Asian'**
  String get categoryAsian;

  /// No description provided for @categoryChinese.
  ///
  /// In en, this message translates to:
  /// **'Chinese'**
  String get categoryChinese;

  /// No description provided for @categoryBreakfast.
  ///
  /// In en, this message translates to:
  /// **'Breakfast'**
  String get categoryBreakfast;

  /// No description provided for @categoryDinner.
  ///
  /// In en, this message translates to:
  /// **'Dinner'**
  String get categoryDinner;

  /// No description provided for @categoryLocalDish.
  ///
  /// In en, this message translates to:
  /// **'Local Dish'**
  String get categoryLocalDish;

  /// No description provided for @categoryFruit.
  ///
  /// In en, this message translates to:
  /// **'Fruit'**
  String get categoryFruit;

  /// No description provided for @categoryVegetables.
  ///
  /// In en, this message translates to:
  /// **'Vegetables'**
  String get categoryVegetables;

  /// No description provided for @categoryLunch.
  ///
  /// In en, this message translates to:
  /// **'Lunch'**
  String get categoryLunch;

  /// No description provided for @categoryCereal.
  ///
  /// In en, this message translates to:
  /// **'Cereal'**
  String get categoryCereal;

  /// No description provided for @categorySpanish.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get categorySpanish;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
