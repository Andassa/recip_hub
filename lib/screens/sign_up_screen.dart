import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../l10n/app_localizations.dart';
import '../theme/app_colors.dart';
import '../widgets/common/labeled_field.dart';
import '../widgets/common/or_divider.dart';
import '../widgets/common/social_login_row.dart';
import '../widgets/primary_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirm = TextEditingController();
  bool _accepted = false;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  void _submit() {
    final l10n = AppLocalizations.of(context);
    if (!(_formKey.currentState?.validate() ?? false)) return;
    if (!_accepted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.acceptTermsRequired)));
      return;
    }
    context.goNamed('home');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.createAccount,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  l10n.signUpSubtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: 20),
                LabeledField(
                  label: l10n.name,
                  hint: l10n.enterName,
                  controller: _name,
                  validator: (v) => (v == null || v.trim().length < 2)
                      ? l10n.nameRequired
                      : null,
                ),
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
                  label: l10n.password,
                  hint: l10n.enterPassword,
                  controller: _password,
                  obscure: true,
                  validator: (v) => (v == null || v.length < 6)
                      ? l10n.minSixCharacters
                      : null,
                ),
                LabeledField(
                  label: l10n.confirmPassword,
                  hint: l10n.retypePassword,
                  controller: _confirm,
                  obscure: true,
                  validator: (v) =>
                      v != _password.text ? l10n.passwordsDoNotMatch : null,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _accepted,
                      onChanged: (v) => setState(() => _accepted = v ?? false),
                      side: const BorderSide(color: AppColors.accent),
                      activeColor: AppColors.accent,
                    ),
                    Text(
                      l10n.acceptTerms,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: AppColors.accent,
                      ),
                    ),
                  ],
                ),
                PrimaryButton(label: l10n.signUpButton, onPressed: _submit),
                const SizedBox(height: 20),
                const OrDivider(),
                const SizedBox(height: 16),
                const SocialLoginRow(),
                const SizedBox(height: 24),
                Center(
                  child: GestureDetector(
                    onTap: () => context.goNamed('signIn'),
                    child: Text.rich(
                      TextSpan(
                        style: GoogleFonts.poppins(fontSize: 12),
                        children: [
                          TextSpan(text: l10n.alreadyMember),
                          TextSpan(
                            text: l10n.signIn,
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
