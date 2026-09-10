import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../core/assets.dart';
import '../l10n/app_localizations.dart';
import '../models/recipe.dart';
import '../providers/recipe_provider.dart';
import '../providers/theme_provider.dart';
import '../theme/app_colors.dart';
import '../utils/responsive.dart';
import '../widgets/common/chef_hat_icon.dart';
import '../widgets/recipe_card.dart';

/// Profile Figma + accès Settings (thème).
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recipes = context.select<RecipeProvider, List<Recipe>>(
      (p) => p.newRecipes,
    );
    final l10n = AppLocalizations.of(context);
    final pad = horizontalPadding(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          l10n.profile,
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            tooltip: l10n.semanticSettings,
            icon: const Icon(Icons.more_horiz),
            onPressed: () => context.goNamed('settings'),
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(pad),
        itemCount: 10 + recipes.length,
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return Row(
                children: [
                  Semantics(
                    label: l10n.semanticAvatar,
                    image: true,
                    child: const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(AppAssets.avatar),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _stat(l10n.statRecipe, '${recipes.length}'),
                        _stat(l10n.statFollowers, '2.5M'),
                        _stat(l10n.statFollowing, '259'),
                      ],
                    ),
                  ),
                ],
              );
            case 1:
              return const SizedBox(height: 14);
            case 2:
              return Text(
                'Afuwape Abiodun',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              );
            case 3:
              return Row(
                children: [
                  const ChefHatIcon(size: 16),
                  const SizedBox(width: 4),
                  Text(
                    l10n.chefRole,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              );
            case 4:
              return const SizedBox(height: 6);
            case 5:
              return Text(
                l10n.profileBio,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: AppColors.textMuted,
                ),
              );
            case 6:
              return const SizedBox(height: 16);
            case 7:
              return SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  l10n.darkMode,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
                value: context.watch<ThemeProvider>().isDark,
                activeThumbColor: AppColors.primary,
                onChanged: (_) => context.read<ThemeProvider>().toggleTheme(),
              );
            case 8:
              return const SizedBox(height: 8);
            case 9:
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  l10n.myRecipes,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            default:
              final recipe = recipes[index - 10];
              return Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: RecipeCard(
                  recipe: recipe,
                  height: 150,
                  showTime: true,
                  onTap: () => context.pushNamed(
                    'detail',
                    pathParameters: {'id': recipe.id},
                  ),
                ),
              );
          }
        },
      ),
    );
  }

  Widget _stat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 11, color: AppColors.textMuted),
        ),
      ],
    );
  }
}
