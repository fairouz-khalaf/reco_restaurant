import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reco_restaurant/core/components/custom_button.dart';
import 'package:reco_restaurant/core/components/custom_text_form_field.dart';
import 'package:reco_restaurant/core/helper/extensions.dart';
import 'package:reco_restaurant/core/routing/named_router.dart';
import 'package:reco_restaurant/core/validators/validator.dart';
import 'package:reco_restaurant/features/auth/login/views/components/auth_switch_text.dart';

class SignUpFormFields extends StatefulWidget {
  const SignUpFormFields({super.key});

  @override
  State<SignUpFormFields> createState() => _SignUpFormFieldsState();
}

class _SignUpFormFieldsState extends State<SignUpFormFields> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _signUp() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      if (!mounted) return;
      context.pushReplacementNamed(Routes.home);
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'email-already-in-use':
          message = 'This email is already in use.';
          break;
        case 'invalid-email':
          message = 'The email address is not valid.';
          break;
        case 'operation-not-allowed':
          message = 'Email/password accounts are not enabled.';
          break;
        case 'weak-password':
          message = 'The password is too weak.';
          break;
        default:
          message = 'Sign up failed. Please try again.';
      }

      _showError(message);
    }
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text("Sign Up Error"),
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
          30.h.pH,
          AppButton(title: "Sign Up", onTap: _signUp, height: 40.h),
          20.h.pH,
          AuthSwitchText(
            firstText: "Already have an account?",
            actionText: "Login",
            onTap: () => context.pushReplacementNamed(Routes.login),
          ),
        ],
      ),
    );
  }
}
