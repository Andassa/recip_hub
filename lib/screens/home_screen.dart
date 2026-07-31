import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
    final provider = context.watch<RecipeProvider>();
    final pad = horizontalPadding(context);
    // Catégories depuis le repository (via provider), pas hardcodées ici.
    final homeCategories = provider.categories.take(5).toList(growable: false);

    if (provider.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
      );
    }
    if (provider.error != null) {
      return Scaffold(
        body: EmptyState(message: provider.error!, icon: Icons.error_outline),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColors.primary,
          onRefresh: provider.loadRecipes,
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
                      SizedBox(
                        height: 36,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: homeCategories.length,
                          separatorBuilder: (_, _) => const SizedBox(width: 10),
                          itemBuilder: (_, i) {
                            final cat = homeCategories[i];
                            return CategoryChip(
                              label: cat,
                              isSelected: provider.selectedCategory == cat,
                              onTap: () => provider.setCategory(cat),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 260,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: pad),
                    scrollDirection: Axis.horizontal,
                    itemCount: provider.popularRecipes.length,
                    separatorBuilder: (_, _) => const SizedBox(width: 14),
                    itemBuilder: (_, i) {
                      final recipe = provider.popularRecipes[i];
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
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(pad, 24, pad, 12),
                  child: Text(
                    'New Recipes',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 120,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: pad),
                    scrollDirection: Axis.horizontal,
                    itemCount: provider.newRecipes.length,
                    itemBuilder: (_, i) {
                      final recipe = provider.newRecipes[i];
                      return NewRecipeCard(
                        recipe: recipe,
                        onTap: () => context.pushNamed(
                          'detail',
                          pathParameters: {'id': recipe.id},
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
            ],
          ),
        ),
      ),
    );
  }
}
