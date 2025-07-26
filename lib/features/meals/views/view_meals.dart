import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reco_restaurant/core/helper/extensions.dart';
import 'package:reco_restaurant/core/theme/app_theme.dart';
import 'package:reco_restaurant/features/meals/views/components/add_meal_button.dart';
import 'package:reco_restaurant/features/meals/views/components/meals_grid.dart';
import 'package:reco_restaurant/features/meals/views/components/order_summary.dart';

class ViewMealsByCategory extends StatefulWidget {
  final String categoryId;
  final String categoryName;
  final String price;

  const ViewMealsByCategory({
    super.key,
    required this.categoryId,
    required this.categoryName,
    required this.price,
  });

  @override
  State<ViewMealsByCategory> createState() => _ViewMealsByCategoryState();
}

class _ViewMealsByCategoryState extends State<ViewMealsByCategory> {
  final Map<String, Map<String, dynamic>> cart = {};
  late final Stream<QuerySnapshot> mealsStream;

  @override
  void initState() {
    super.initState();
    mealsStream =
        FirebaseFirestore.instance
            .collection("categories")
            .doc(widget.categoryId)
            .collection("meals")
            .snapshots();
  }

  void addToCart(String mealId, String mealName, double price) {
    setState(() {
      if (cart.containsKey(mealId)) {
        cart[mealId]!['quantity'] += 1;
      } else {
        cart[mealId] = {'name': mealName, 'price': price, 'quantity': 1};
      }
    });
  }

  void increaseQuantity(String mealId) {
    setState(() {
      cart[mealId]!['quantity'] += 1;
    });
  }

  void decreaseQuantity(String mealId) {
    setState(() {
      if (cart[mealId]!['quantity'] > 1) {
        cart[mealId]!['quantity'] -= 1;
      } else {
        cart.remove(mealId);
      }
    });
  }

  double getTotalPrice() {
    return cart.values.fold(
      0.0,
      (total, item) => total + (item['price'] * item['quantity']),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.categoryName,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            AddMealButton(
              categoryId: widget.categoryId,
              categoryName: widget.categoryName,
              price: widget.price,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: MealsGrid(
              mealsStream: mealsStream,
              onAddToCart: addToCart,
              categoryId: widget.categoryId,
              categoryName: widget.categoryName,
              price: widget.price,
            ),
          ),
          if (cart.isNotEmpty)
            OrderSummary(
              cart: cart,
              onIncrease: increaseQuantity,
              onDecrease: decreaseQuantity,
              totalPrice: getTotalPrice(),
            ),
        ],
      ).addAllPadding(16),
    );
  }
}
