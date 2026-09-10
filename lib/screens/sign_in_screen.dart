import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../l10n/app_localizations.dart';
import '../theme/app_colors.dart';
import '../widgets/common/labeled_field.dart';
import '../widgets/common/or_divider.dart';
import '../widgets/common/social_login_row.dart';
import '../widgets/primary_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      context.goNamed('home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  l10n.helloComma,
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  l10n.welcomeBack,
                  style: GoogleFonts.poppins(fontSize: 20),
                ),
                const SizedBox(height: 40),
                LabeledField(
                  label: l10n.email,
                  hint: l10n.enterEmail,
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) {
                      return l10n.emailRequired;
                    }
                    if (!v.contains('@')) {
                      return l10n.invalidEmail;
                    }
                    return null;
                  },
                ),
                LabeledField(
                  label: l10n.enterPassword,
                  hint: l10n.enterPassword,
                  controller: _password,
                  obscure: true,
                  validator: (v) => (v == null || v.length < 6)
                      ? l10n.minSixCharacters
                      : null,
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    foregroundColor: AppColors.accent,
                  ),
                  child: Text(
                    l10n.forgotPassword,
                    style: GoogleFonts.poppins(fontSize: 12),
                  ),
                ),
                const SizedBox(height: 12),
                PrimaryButton(label: l10n.signIn, onPressed: _submit),
                const SizedBox(height: 24),
                const OrDivider(),
                const SizedBox(height: 20),
                const SocialLoginRow(),
                const SizedBox(height: 32),
                Center(
                  child: GestureDetector(
                    onTap: () => context.goNamed('signUp'),
                    child: Text.rich(
                      TextSpan(
                        style: GoogleFonts.poppins(fontSize: 12),
                        children: [
                          TextSpan(text: l10n.dontHaveAccount),
                          TextSpan(
                            text: l10n.signUp,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: AppColors.accent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
