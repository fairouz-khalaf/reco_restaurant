import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'meal_card.dart';

class MealsGrid extends StatelessWidget {
  final Stream<QuerySnapshot> mealsStream;
  final Function(String, String, double) onAddToCart;
  final String categoryId;
  final String categoryName;
  final String price;

  const MealsGrid({
    super.key,
    required this.mealsStream,
    required this.onAddToCart,
    required this.categoryId,
    required this.categoryName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: mealsStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text("No meals found."));
        }

        final meals = snapshot.data!.docs;

        return Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 220,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: meals.length,
            itemBuilder: (context, index) {
              final meal = meals[index];
              return MealCard(
                meal: meal,
                onAddToCart: onAddToCart,
                categoryId: categoryId,
                categoryName: categoryName,
                price: price,
              );
            },
          ),
        );
      },
    );
  }
}
