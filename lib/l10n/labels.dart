import 'app_localizations.dart';

String categoryLabel(AppLocalizations l10n, String category) {
  switch (category) {
    case 'All':
      return l10n.categoryAll;
    case 'Indian':
      return l10n.categoryIndian;
    case 'Italian':
      return l10n.categoryItalian;
    case 'Asian':
      return l10n.categoryAsian;
    case 'Chinese':
      return l10n.categoryChinese;
    case 'Breakfast':
      return l10n.categoryBreakfast;
    case 'Dinner':
      return l10n.categoryDinner;
    case 'Local Dish':
      return l10n.categoryLocalDish;
    case 'Fruit':
      return l10n.categoryFruit;
    case 'Vegetables':
      return l10n.categoryVegetables;
    case 'Lunch':
      return l10n.categoryLunch;
    case 'Cereal':
      return l10n.categoryCereal;
    case 'Spanish':
      return l10n.categorySpanish;
    default:
      return category;
  }
}

String timeFilterLabel(AppLocalizations l10n, String time) {
  switch (time) {
    case 'All':
      return l10n.timeAll;
    case 'Newest':
      return l10n.timeNewest;
    case 'Oldest':
      return l10n.timeOldest;
    case 'Popularity':
      return l10n.timePopularity;
    default:
      return time;
  }
}

String difficultyLabel(AppLocalizations l10n, String difficulty) {
  switch (difficulty.toLowerCase()) {
    case 'easy':
      return l10n.difficultyEasy;
    case 'medium':
      return l10n.difficultyMedium;
    case 'hard':
      return l10n.difficultyHard;
    default:
      return difficulty;
  }
}

String notificationFilterLabel(AppLocalizations l10n, String filter) {
  switch (filter) {
    case 'All':
      return l10n.filterAll;
    case 'Read':
      return l10n.filterRead;
    case 'Unread':
      return l10n.filterUnread;
    default:
      return filter;
  }
}
