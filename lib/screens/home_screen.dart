import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../l10n/labels.dart';
import '../models/recipe.dart';
import '../providers/recipe_provider.dart';
import '../theme/app_colors.dart';
import '../utils/responsive.dart';
import '../widgets/category_chip.dart';
import '../widgets/common/empty_state.dart';
import '../widgets/filter_sheet.dart';
import '../widgets/home/home_header.dart';
import '../widgets/new_recipe_card.dart';
import '../widgets/popular_recipe_card.dart';
import '../widgets/search_bar_widget.dart';

/// Écran 1 (Home) : recherche, chips catégories, listes popular / new.
/// Les recettes viennent uniquement de [RecipeProvider].
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select<RecipeProvider, bool>((p) => p.isLoading);
    final error = context.select<RecipeProvider, String?>((p) => p.error);
    final l10n = AppLocalizations.of(context);
    final pad = horizontalPadding(context);

    if (isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
      );
    }
    if (error != null) {
      return Scaffold(
        body: EmptyState(
          message: l10n.loadRecipesFailed,
          icon: Icons.error_outline,
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColors.primary,
          onRefresh: context.read<RecipeProvider>().loadRecipes,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(pad, 16, pad, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HomeHeader(),
                      const SizedBox(height: 24),
                      SearchBarWidget(
                        readOnly: true,
                        onTap: () => context.goNamed('search'),
                        onFilterTap: () => showFilterSheet(context),
                      ),
                      const SizedBox(height: 20),
                      const _HomeCategoryRow(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(child: _PopularRecipesRow(padding: pad)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(pad, 24, pad, 12),
                  child: Text(
                    l10n.newRecipes,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: _NewRecipesRow(padding: pad)),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeCategoryRow extends StatelessWidget {
  const _HomeCategoryRow();

  @override
  Widget build(BuildContext context) {
    return Selector<RecipeProvider, String>(
      selector: (_, provider) => provider.selectedCategory,
      builder: (context, selectedCategory, _) {
        final provider = context.read<RecipeProvider>();
        final l10n = AppLocalizations.of(context);
        final homeCategories = provider.categories
            .take(5)
            .toList(growable: false);
        return SizedBox(
          height: 36,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: homeCategories.length,
            separatorBuilder: (_, _) => const SizedBox(width: 10),
            itemBuilder: (_, i) {
              final cat = homeCategories[i];
              return CategoryChip(
                label: categoryLabel(l10n, cat),
                isSelected: selectedCategory == cat,
                onTap: () => provider.setCategory(cat),
              );
            },
          ),
        );
      },
    );
  }
}

class _PopularRecipesRow extends StatelessWidget {
  const _PopularRecipesRow({required this.padding});

  final double padding;

  @override
  Widget build(BuildContext context) {
    return Selector<RecipeProvider, List<Recipe>>(
      selector: (_, provider) => provider.popularRecipes,
      builder: (context, recipes, _) {
        final provider = context.read<RecipeProvider>();
        return SizedBox(
          height: 260,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: padding),
            scrollDirection: Axis.horizontal,
            itemCount: recipes.length,
            separatorBuilder: (_, _) => const SizedBox(width: 14),
            itemBuilder: (_, i) {
              final recipe = recipes[i];
              return PopularRecipeCard(
                recipe: recipe,
                onTap: () => context.pushNamed(
                  'detail',
                  pathParameters: {'id': recipe.id},
                ),
                onFavoriteTap: () => provider.toggleFavorite(recipe.id),
              );
            },
          ),
        );
      },
    );
  }
}

class _NewRecipesRow extends StatelessWidget {
  const _NewRecipesRow({required this.padding});

  final double padding;

  @override
  Widget build(BuildContext context) {
    return Selector<RecipeProvider, List<Recipe>>(
      selector: (_, provider) => provider.newRecipes,
      builder: (context, recipes, _) {
        return SizedBox(
          height: 120,
          child: ListView.builder(
            padding: EdgeInsets.only(left: padding),
            scrollDirection: Axis.horizontal,
            itemCount: recipes.length,
            itemBuilder: (_, i) {
              final recipe = recipes[i];
              return NewRecipeCard(
                recipe: recipe,
                onTap: () => context.pushNamed(
                  'detail',
                  pathParameters: {'id': recipe.id},
                ),
              );
            },
          ),
        );
      },
    );
  }
}
