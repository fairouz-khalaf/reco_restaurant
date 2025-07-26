import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reco_restaurant/core/helper/extensions.dart';
import 'package:reco_restaurant/features/auth/login/views/components/login_form_fields.dart';
import 'package:reco_restaurant/features/auth/login/views/components/login_header.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [40.h.pH, LoginHeader(), 30.h.pH, const LoginFormFields()],
      ).addAllPadding(16),
    );
  }
}
