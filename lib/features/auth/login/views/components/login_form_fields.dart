import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reco_restaurant/core/components/custom_button.dart';
import 'package:reco_restaurant/core/components/custom_text_form_field.dart';
import 'package:reco_restaurant/core/routing/named_router.dart';
import 'package:reco_restaurant/core/validators/validator.dart';
import 'package:reco_restaurant/features/auth/login/views/components/auth_switch_text.dart';
import 'package:reco_restaurant/core/helper/extensions.dart';

class LoginFormFields extends StatefulWidget {
  const LoginFormFields({super.key});

  @override
  State<LoginFormFields> createState() => _LoginFormFieldsState();
}

class _LoginFormFieldsState extends State<LoginFormFields> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      if (!mounted) return;
      context.pushReplacementNamed(Routes.home);
    } on FirebaseAuthException catch (e) {
      String message;

      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Incorrect password. Please try again.';
      } else if (e.code == 'invalid-email') {
        message = 'The email address is badly formatted.';
      } else if (e.code == 'user-disabled') {
        message = 'This user account has been disabled.';
      } else if (e.code == 'too-many-requests') {
        message = 'Too many login attempts. Try again later.';
      } else if (e.code == 'invalid-credential' ||
          (e.message?.toLowerCase().contains('no user record') ?? false)) {
        message = 'Invalid email or password.';
      } else {
        message = 'Login failed. Please check your credentials.';
      }

      _showError(message);
    }
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text("Login Error"),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextForm(
            label: "Email",
            hintText: "Enter your email",
            controller: _emailController,
            validator: AppValidators.email,
            keyboardType: TextInputType.emailAddress,
          ),
          20.h.pH,
          CustomTextForm(
            label: "Password",
            hintText: "Enter your password",
            controller: _passwordController,
            isPassword: true,
            validator: AppValidators.password,
            keyboardType: TextInputType.visiblePassword,
          ),
          40.h.pH,
          AppButton(title: "Login", onTap: _login, height: 40.h),
          20.h.pH,
          AuthSwitchText(
            firstText: "Don't have an account?",
            actionText: "Sign Up",
            onTap: () => context.pushReplacementNamed(Routes.signup),
          ),
        ],
      ),
    );
  }
}
