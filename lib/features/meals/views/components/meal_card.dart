import 'package:flutter/material.dart';
import 'package:reco_restaurant/core/routing/named_router.dart';
import 'package:reco_restaurant/core/theme/app_theme.dart';

class MealCard extends StatelessWidget {
  final dynamic meal;
  final Function(String, String, double) onAddToCart;
  final String categoryId;
  final String categoryName;
  final String price;

  const MealCard({
    super.key,
    required this.meal,
    required this.onAddToCart,
    required this.categoryId,
    required this.categoryName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final mealId = meal.id;
    final mealName = meal['mealName'] ?? "Unnamed";
    final double mealPrice = double.tryParse(meal['price'].toString()) ?? 0.0;

    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(Icons.fastfood, size: 40, color: AppColors.primary),
            Text(
              mealName,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: '$mealPrice ', style: theme.bodyMedium),
                  const TextSpan(
                    text: '\$',
                    style: TextStyle(color: AppColors.primary),
                  ),
                ],
              ),
            ),

            TextButton.icon(
              onPressed: () => onAddToCart(mealId, mealName, mealPrice),
              icon: const Icon(Icons.shopping_cart_checkout),
              label: const Text(
                "Add to Cart",
                style: TextStyle(color: AppColors.textPrimary),
              ),
              style: TextButton.styleFrom(foregroundColor: AppColors.primary),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.green),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.addMeal,
                      arguments: {
                        'isEdit': true,
                        'categoryId': categoryId,
                        'categoryName': categoryName,
                        'price': price,
                        'mealData': meal,
                      },
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () async {
                    await meal.reference.delete();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
