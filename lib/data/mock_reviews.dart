import '../core/assets.dart';
import '../models/review.dart';

/// Avis mock — hors des widgets.
const mockReviews = [
  Review(
    id: 'r1',
    authorName: 'Bella Throne',
    authorImageUrl: AppAssets.avatar,
    dateLabel: 'June 12, 2020 - 19:35',
    comment:
        'Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum dolore eu fugiat nulla pariatur?',
    likes: 9,
    dislikes: 2,
  ),
  Review(
    id: 'r2',
    authorName: 'Christopher Oshana',
    authorImageUrl: AppAssets.avatar,
    dateLabel: 'June 12, 2020 - 19:35',
    comment:
        'Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum dolore eu fugiat nulla pariatur?',
    likes: 9,
    dislikes: 2,
  ),
  Review(
    id: 'r3',
    authorName: 'Bella Throne',
    authorImageUrl: AppAssets.avatar,
    dateLabel: 'June 11, 2020 - 14:10',
    comment: 'Amazing recipe, will cook again!',
    likes: 12,
    dislikes: 1,
  ),
];
