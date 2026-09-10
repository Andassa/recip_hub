import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../models/recipe.dart';
import '../providers/recipe_provider.dart';
import '../theme/app_colors.dart';
import '../utils/responsive.dart';
import '../widgets/detail/ingredient_tile.dart';
import '../widgets/detail/procedure_step_tile.dart';
import '../widgets/detail/recipe_author_row.dart';
import '../widgets/detail/recipe_hero_image.dart';
import '../widgets/detail/recipe_more_sheet.dart';
import '../widgets/detail/recipe_tab_toggle.dart';
import '../widgets/dialogs/rate_recipe_dialog.dart';
import '../widgets/dialogs/share_recipe_dialog.dart';
import '../widgets/difficulty_badge.dart';

/// Écran 2 : détail recette (`/recipe/:id`).
/// Affiche image, titre, durée, difficulté, ingrédients, étapes, favori.
class RecipeDetailScreen extends StatefulWidget {
  const RecipeDetailScreen({super.key, required this.recipeId});

  final String recipeId;

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  int _tab = 0;

  Future<void> _onMore(Recipe recipe) async {
    final selected = await showModalBottomSheet<String>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => RecipeMoreSheet(isFavorite: recipe.isFavorite),
    );
    if (!mounted || selected == null) return;

    switch (selected) {
      case 'share':
        await showShareRecipeDialog(
          context,
          recipe.title.toLowerCase().replaceAll(' ', '_'),
        );
      case 'rate':
        final rating = await showRateRecipeDialog(context);
        if (rating != null && mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                AppLocalizations.of(context).thanksForRating(rating),
              ),
            ),
          );
        }
      case 'review':
        context.pushNamed('reviews', pathParameters: {'id': recipe.id});
      case 'unsave':
        await context.read<RecipeProvider>().toggleFavorite(recipe.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    final recipe = context.select<RecipeProvider, Recipe?>(
      (p) => p.getById(widget.recipeId),
    );
    final l10n = AppLocalizations.of(context);
    final pad = horizontalPadding(context);
    if (recipe == null) {
      return Scaffold(
        appBar: AppBar(
          leading: BackButton(onPressed: () => context.goNamed('home')),
        ),
        body: Center(child: Text(l10n.recipeNotFound)),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(pad, 8, pad, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          tooltip: l10n.semanticBack,
                          onPressed: () {
                            if (context.canPop()) {
                              context.pop();
                            } else {
                              context.goNamed('home');
                            }
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                        const Spacer(),
                        IconButton(
                          tooltip: l10n.semanticMore,
                          onPressed: () => _onMore(recipe),
                          icon: const Icon(Icons.more_horiz),
                        ),
                      ],
                    ),
                    RecipeHeroImage(recipe: recipe),
                    const SizedBox(height: 16),
                    Text(
                      recipe.title,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      l10n.reviewsCount(recipe.reviewCount),
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    DifficultyBadge(difficulty: recipe.difficulty),
                    const SizedBox(height: 16),
                    RecipeAuthorRow(recipe: recipe),
                    const SizedBox(height: 20),
                    RecipeTabToggle(
                      selectedIndex: _tab,
                      onChanged: (i) => setState(() => _tab = i),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _tab == 0
                          ? l10n.serveItems(
                              recipe.servings,
                              recipe.ingredients.length,
                            )
                          : l10n.stepsCount(recipe.steps.length),
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: pad),
              sliver: SliverList.separated(
                itemCount: _tab == 0
                    ? recipe.ingredients.length
                    : recipe.steps.length,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (_, i) => _tab == 0
                    ? IngredientTile(ingredient: recipe.ingredients[i])
                    : ProcedureStepTile(index: i + 1, text: recipe.steps[i]),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 32)),
          ],
        ),
      ),
    );
  }
}
