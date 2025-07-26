import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reco_restaurant/core/helper/extensions.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Welcome to Reco Restaurant", style: theme.textTheme.bodyMedium),
        20.h.pH,
        Text(
          "Create Account",
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
      ],
    );
  }
}
