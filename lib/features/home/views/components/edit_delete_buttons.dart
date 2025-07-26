import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reco_restaurant/core/helper/extensions.dart';
import 'package:reco_restaurant/core/routing/named_router.dart';
import 'package:reco_restaurant/core/theme/app_theme.dart';

class EditDeleteButtons extends StatelessWidget {
  final QueryDocumentSnapshot category;

  const EditDeleteButtons({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            context.pushNamed(
              Routes.addCategory,
              arguments: {
                'isEdit': true,
                'categoryId': category.id,
                'initialCategoryName': category['categoryName'],
              },
            );
          },
          child: const Icon(Icons.edit, color: AppColors.success),
        ),
        InkWell(
          onTap: () async {
            await FirebaseFirestore.instance
                .collection("categories")
                .doc(category.id)
                .delete();

            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Category deleted successfully")),
              );
            }
          },
          child: const Icon(Icons.delete, color: AppColors.error),
        ),
      ],
    );
  }
}
