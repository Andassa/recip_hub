import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';
import '../widgets/common/labeled_field.dart';
import '../widgets/common/or_divider.dart';
import '../widgets/common/social_login_row.dart';
import '../widgets/primary_button.dart';

/// Sign In Figma.
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
                  'Hello,',
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text('Welcome Back!', style: GoogleFonts.poppins(fontSize: 20)),
                const SizedBox(height: 40),
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
                  label: 'Enter Password',
                  hint: 'Enter Password',
                  controller: _password,
                  obscure: true,
                  validator: (v) =>
                      (v == null || v.length < 6) ? 'Min 6 characters' : null,
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    foregroundColor: AppColors.accent,
                  ),
                  child: Text(
                    'Forgot Password?',
                    style: GoogleFonts.poppins(fontSize: 12),
                  ),
                ),
                const SizedBox(height: 12),
                PrimaryButton(label: 'Sign In', onPressed: _submit),
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
                          const TextSpan(text: "Don't have an account? "),
                          TextSpan(
                            text: 'Sign up',
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
