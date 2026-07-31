import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';
import '../widgets/common/labeled_field.dart';
import '../widgets/common/or_divider.dart';
import '../widgets/common/social_login_row.dart';
import '../widgets/primary_button.dart';

/// Create account Figma.
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
    if (!(_formKey.currentState?.validate() ?? false)) return;
    if (!_accepted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please accept terms & conditions')),
      );
      return;
    }
    context.goNamed('home');
  }

  @override
  Widget build(BuildContext context) {
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
                  'Create an account',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Let's help you set up your account,\nit won't take long.",
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: 20),
                LabeledField(
                  label: 'Name',
                  hint: 'Enter Name',
                  controller: _name,
                  validator: (v) => (v == null || v.trim().length < 2)
                      ? 'Name required'
                      : null,
                ),
                LabeledField(
                  label: 'Email',
                  hint: 'Enter Email',
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return 'Email required';
                    if (!v.contains('@')) return 'Invalid email';
                    return null;
                  },
                ),
                LabeledField(
                  label: 'Password',
                  hint: 'Enter Password',
                  controller: _password,
                  obscure: true,
                  validator: (v) =>
                      (v == null || v.length < 6) ? 'Min 6 characters' : null,
                ),
                LabeledField(
                  label: 'Confirm Password',
                  hint: 'Retype Password',
                  controller: _confirm,
                  obscure: true,
                  validator: (v) =>
                      v != _password.text ? 'Passwords do not match' : null,
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
                      'Accept terms & Condition',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: AppColors.accent,
                      ),
                    ),
                  ],
                ),
                PrimaryButton(label: 'Sign Up', onPressed: _submit),
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
                          const TextSpan(text: 'Already a member? '),
                          TextSpan(
                            text: 'Sign In',
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
