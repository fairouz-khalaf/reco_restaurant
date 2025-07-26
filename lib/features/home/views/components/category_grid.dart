import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reco_restaurant/features/home/views/components/category_card.dart';

class CategoryGrid extends StatelessWidget {
  final List<QueryDocumentSnapshot> data;

  const CategoryGrid({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: data.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 210,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        final category = data[index];
        return CategoryCard(category: category);
      },
    );
  }
}
