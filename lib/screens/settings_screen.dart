import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/locale_provider.dart';
import '../providers/theme_provider.dart';
import '../theme/app_colors.dart';
import '../utils/responsive.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final localeProvider = context.watch<LocaleProvider>();
    final l10n = AppLocalizations.of(context);
    final padding = horizontalPadding(context);
    final languageCode = localeProvider.locale.languageCode;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          l10n.settings,
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(padding),
        children: [
          Text(
            l10n.appearance,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: AppColors.border),
            ),
            child: SwitchListTile(
              value: themeProvider.isDark,
              activeThumbColor: AppColors.primary,
              title: Text(
                l10n.darkMode,
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                l10n.persistedOnRestart,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
              onChanged: (_) => themeProvider.toggleTheme(),
            ),
          ),
          const SizedBox(height: 28),
          Text(
            l10n.language,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: AppColors.border),
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    l10n.languageEnglish,
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                  ),
                  trailing: languageCode == 'en'
                      ? const Icon(Icons.check, color: AppColors.primary)
                      : null,
                  onTap: () => localeProvider.setLocale(const Locale('en')),
                ),
                ListTile(
                  title: Text(
                    l10n.languageFrench,
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                  ),
                  trailing: languageCode == 'fr'
                      ? const Icon(Icons.check, color: AppColors.primary)
                      : null,
                  onTap: () => localeProvider.setLocale(const Locale('fr')),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          Text(
            l10n.about,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: AppColors.border),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.appTitle,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    l10n.aboutBody('1.0.0'),
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: AppColors.textMuted,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
