import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reco_restaurant/core/routing/named_router.dart';
import 'package:reco_restaurant/features/home/views/components/edit_delete_buttons.dart';
import 'package:reco_restaurant/core/helper/extensions.dart';

class CategoryCard extends StatelessWidget {
  final QueryDocumentSnapshot category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          Routes.viewMealsByCategory,
          arguments: {
            'categoryId': category.id,
            'categoryName': category['categoryName'],
          },
        );
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                "assets/images/food.png",
                height: 80.h,
                width: 80.w,
                fit: BoxFit.cover,
              ),
              Text(
                category['categoryName'],
                style:  TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              EditDeleteButtons(category: category),
            ],
          ),
        ),
      ),
    );
  }
}
