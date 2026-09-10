import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../core/assets.dart';
import '../l10n/app_localizations.dart';
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
    final recipes = context.watch<RecipeProvider>().allRecipes.take(4).toList();
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
      body: ListView(
        padding: EdgeInsets.all(pad),
        children: [
          Row(
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
          ),
          const SizedBox(height: 14),
          Text(
            'Afuwape Abiodun',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
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
          ),
          const SizedBox(height: 6),
          Text(
            l10n.profileBio,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 16),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              l10n.darkMode,
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
            ),
            value: context.watch<ThemeProvider>().isDark,
            activeThumbColor: AppColors.primary,
            onChanged: (_) => context.read<ThemeProvider>().toggleTheme(),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.myRecipes,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          ...recipes.map(
            (r) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: RecipeCard(
                recipe: r,
                height: 150,
                showTime: true,
                onTap: () =>
                    context.pushNamed('detail', pathParameters: {'id': r.id}),
              ),
            ),
          ),
        ],
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
