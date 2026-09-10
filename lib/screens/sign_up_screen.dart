import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../l10n/app_localizations.dart';
import '../theme/app_colors.dart';
import '../widgets/common/labeled_field.dart';
import '../widgets/common/or_divider.dart';
import '../widgets/common/social_login_row.dart';
import '../widgets/primary_button.dart';

class SignUpScreen extends HookWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final name = useTextEditingController();
    final email = useTextEditingController();
    final password = useTextEditingController();
    final confirm = useTextEditingController();
    final accepted = useState(false);
    final l10n = AppLocalizations.of(context);

    void submit() {
      if (!(formKey.currentState?.validate() ?? false)) return;
      if (!accepted.value) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.acceptTermsRequired)));
        return;
      }
      context.goNamed('home');
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Form(
            key: formKey,
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
                  controller: name,
                  validator: (v) => (v == null || v.trim().length < 2)
                      ? l10n.nameRequired
                      : null,
                ),
                LabeledField(
                  label: l10n.email,
                  hint: l10n.enterEmail,
                  controller: email,
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
                  controller: password,
                  obscure: true,
                  validator: (v) => (v == null || v.length < 6)
                      ? l10n.minSixCharacters
                      : null,
                ),
                LabeledField(
                  label: l10n.confirmPassword,
                  hint: l10n.retypePassword,
                  controller: confirm,
                  obscure: true,
                  validator: (v) =>
                      v != password.text ? l10n.passwordsDoNotMatch : null,
                ),
                MergeSemantics(
                  child: Row(
                    children: [
                      Checkbox(
                        value: accepted.value,
                        onChanged: (v) => accepted.value = v ?? false,
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
                ),
                PrimaryButton(label: l10n.signUpButton, onPressed: submit),
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
