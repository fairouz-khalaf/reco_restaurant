import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reco_restaurant/core/theme/app_theme.dart';

class OrderSummaryItem extends StatelessWidget {
  final String mealId;
  final Map<String, dynamic> item;
  final Function(String) onIncrease;
  final Function(String) onDecrease;

  const OrderSummaryItem({
    super.key,
    required this.mealId,
    required this.item,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary),
          borderRadius: BorderRadius.circular(10),
          color: AppColors.whiteColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['name'], style: theme.bodyMedium),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${item['price']} ',
                          style: theme.bodySmall,
                        ),
                        const TextSpan(
                          text: '\$',

                          style: TextStyle(color: AppColors.primary),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () => onDecrease(mealId),
                ),
                Text(
                  item['quantity'].toString(),
                  style: TextStyle(fontSize: 8.sp),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () => onIncrease(mealId),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
