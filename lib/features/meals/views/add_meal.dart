import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reco_restaurant/core/components/custom_button.dart';
import 'package:reco_restaurant/core/components/custom_text_form_field.dart';
import 'package:reco_restaurant/core/helper/extensions.dart';
import 'package:reco_restaurant/core/theme/app_theme.dart';
import 'package:reco_restaurant/core/validators/validator.dart';
import 'package:reco_restaurant/features/meals/views/components/add_meal_app_bar.dart';

class AddMealView extends StatefulWidget {
  final bool isEdit;
  final String categoryId;
  final DocumentSnapshot? mealData;

  const AddMealView({
    super.key,
    required this.isEdit,
    required this.categoryId,
    this.mealData,
  });

  @override
  State<AddMealView> createState() => _AddMealViewState();
}

class _AddMealViewState extends State<AddMealView> {
  late TextEditingController mealNameController;
  late TextEditingController priceController;

  @override
  void initState() {
    super.initState();
    mealNameController = TextEditingController(
      text: widget.isEdit ? widget.mealData!['mealName'] : '',
    );
    priceController = TextEditingController(
      text: widget.isEdit ? widget.mealData!['price'].toString() : '',
    );
  }

  @override
  void dispose() {
    mealNameController.dispose();
    priceController.dispose();
    super.dispose();
  }

  Future<void> onSubmit() async {
    final name = mealNameController.text.trim();
    final price = double.tryParse(priceController.text.trim()) ?? 0.0;

    final mealCollection = FirebaseFirestore.instance
        .collection('categories')
        .doc(widget.categoryId)
        .collection('meals');

    if (widget.isEdit && widget.mealData != null) {
      await mealCollection.doc(widget.mealData!.id).update({
        'mealName': name,
        'price': price,
      });
    } else {
      await mealCollection.add({'mealName': name, 'price': price});
    }

    if (!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddMealAppBar(isEdit: widget.isEdit),
      body: Column(
        children: [
          CustomTextForm(
            label: "Meal Name",
            hintText: "Enter meal name",
            controller: mealNameController,
            validator: AppValidators.mealNameValidator,
            keyboardType: TextInputType.text,
          ),
          20.h.pH,

          CustomTextForm(
            label: "Price",
            hintText: "Enter meal price",
            controller: priceController,
            validator: AppValidators.mealPriceValidator,
            keyboardType: TextInputType.number,
          ),
          40.h.pH,
          AppButton(
            onTap: onSubmit,
            height: 40.h,
            title: widget.isEdit ? 'Update Meal' : 'Add Meal',
            textColor: AppColors.whiteColor,
          ),
        ],
      ).addAllPadding(16),
    );
  }
}
