import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reco_restaurant/core/helper/extensions.dart';
import 'package:reco_restaurant/core/theme/app_theme.dart';
import 'order_summary_item.dart';

class OrderSummary extends StatelessWidget {
  final Map<String, Map<String, dynamic>> cart;
  final Function(String) onIncrease;
  final Function(String) onDecrease;
  final double totalPrice;

  const OrderSummary({
    super.key,
    required this.cart,
    required this.onIncrease,
    required this.onDecrease,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      color: Colors.grey.shade100,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Order Summary",
            style: theme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          12.h.pH,
          ...cart.entries.map(
            (entry) => OrderSummaryItem(
              mealId: entry.key,
              item: entry.value,
              onIncrease: onIncrease,
              onDecrease: onDecrease,
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'Total: ${totalPrice.toStringAsFixed(2)} \$',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
