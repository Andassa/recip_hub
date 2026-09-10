import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../l10n/app_localizations.dart';
import '../../models/review.dart';
import '../../theme/app_colors.dart';

/// Tuile avis (avatar, texte, like/dislike).
class ReviewTile extends StatelessWidget {
  const ReviewTile({super.key, required this.review});

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Semantics(
            label: AppLocalizations.of(context).semanticAvatar,
            image: true,
            child: CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage(review.authorImageUrl),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review.authorName,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  review.dateLabel,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  review.comment,
                  style: GoogleFonts.poppins(fontSize: 12, height: 1.4),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _react('👍', review.likes),
                    const SizedBox(width: 10),
                    _react('👎', review.dislikes),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _react(String emoji, int count) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.cardLight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text('$emoji $count', style: GoogleFonts.poppins(fontSize: 12)),
    );
  }
}
