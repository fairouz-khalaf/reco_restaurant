import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:reco_restaurant/core/theme/app_theme.dart';

class AuthSwitchText extends StatelessWidget {
  final String firstText;
  final String actionText;
  final VoidCallback onTap;

  const AuthSwitchText({
    super.key,
    required this.firstText,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: firstText,
          style: Theme.of(context).textTheme.bodyMedium,
          children: [
            TextSpan(
              text: " $actionText",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
