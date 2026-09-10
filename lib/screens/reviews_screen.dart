import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../data/mock_reviews.dart';
import '../l10n/app_localizations.dart';
import '../providers/recipe_provider.dart';
import '../theme/app_colors.dart';
import '../utils/responsive.dart';
import '../widgets/reviews/review_tile.dart';

/// Écran Reviews Figma.
class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key, required this.recipeId});

  final String recipeId;

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final recipe = context.watch<RecipeProvider>().getById(widget.recipeId);
    final l10n = AppLocalizations.of(context);
    final pad = horizontalPadding(context);
    final saved = context.watch<RecipeProvider>().favorites.length;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.goNamed(
                'detail',
                pathParameters: {'id': widget.recipeId},
              );
            }
          },
        ),
        title: Text(
          l10n.reviews,
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(pad),
        children: [
          Row(
            children: [
              Text(
                l10n.commentsCount(mockReviews.length),
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: AppColors.textMuted,
                ),
              ),
              const Spacer(),
              Text(
                l10n.savedCount(saved),
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            l10n.leaveAComment,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          _CommentField(
            controller: _controller,
            sendLabel: l10n.send,
            hintText: l10n.saySomething,
            onSend: () {
              if (_controller.text.trim().isEmpty) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    recipe != null
                        ? l10n.commentSentOn(recipe.title)
                        : l10n.commentSent,
                  ),
                ),
              );
              _controller.clear();
            },
          ),
          const SizedBox(height: 24),
          ...mockReviews.map((r) => ReviewTile(review: r)),
        ],
      ),
    );
  }
}

class _CommentField extends StatelessWidget {
  const _CommentField({
    required this.controller,
    required this.onSend,
    required this.sendLabel,
    required this.hintText,
  });

  final TextEditingController controller;
  final VoidCallback onSend;
  final String sendLabel;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(6),
          child: ElevatedButton(
            onPressed: onSend,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
              elevation: 0,
              minimumSize: const Size(70, 36),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              sendLabel,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
