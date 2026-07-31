/// Avis utilisateur sur une recette.
class Review {
  const Review({
    required this.id,
    required this.authorName,
    required this.authorImageUrl,
    required this.dateLabel,
    required this.comment,
    this.likes = 0,
    this.dislikes = 0,
  });

  final String id;
  final String authorName;
  final String authorImageUrl;
  final String dateLabel;
  final String comment;
  final int likes;
  final int dislikes;
}
