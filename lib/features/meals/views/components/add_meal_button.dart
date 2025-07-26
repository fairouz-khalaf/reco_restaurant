import 'package:flutter/material.dart';
import 'package:reco_restaurant/core/helper/extensions.dart';
import 'package:reco_restaurant/core/routing/named_router.dart';
import 'package:reco_restaurant/core/theme/app_theme.dart';

class AddMealButton extends StatelessWidget {
  final String categoryId;
  final String categoryName;
  final String price;

  const AddMealButton({
    super.key,
    required this.categoryId,
    required this.categoryName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      icon: const Icon(Icons.add, color: AppColors.whiteColor),
      onPressed: () {
        context.pushNamed(
          Routes.addMeal,
          arguments: {
            'categoryId': categoryId,
            'categoryName': categoryName,
            'price': price,
          },
        );
      },
    );
  }
}
