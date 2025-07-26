import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reco_restaurant/core/helper/extensions.dart';
import 'package:reco_restaurant/features/auth/sign_up/views/components/sign_up_form.dart';
import 'package:reco_restaurant/features/auth/sign_up/views/components/sign_up_header.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          40.h.pH,
          const SignUpHeader(),
          30.h.pH,
          const SignUpFormFields(),
        ],
      ).addAllPadding(16),
    );
  }
}
