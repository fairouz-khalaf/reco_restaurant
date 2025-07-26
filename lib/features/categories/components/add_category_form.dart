import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reco_restaurant/core/components/custom_button.dart';
import 'package:reco_restaurant/core/components/custom_text_form_field.dart';
import 'package:reco_restaurant/core/helper/extensions.dart';
import 'package:reco_restaurant/core/theme/app_theme.dart';
import 'package:reco_restaurant/core/validators/validator.dart';

class AddCategoryForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController categoryNameController;
  final VoidCallback onSubmit;
  final bool isEdit;

  const AddCategoryForm({
    super.key,
    required this.formKey,
    required this.categoryNameController,
    required this.onSubmit,
    required this.isEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        children: [
          CustomTextForm(
            label: "Category Name",
            hintText: "Enter category name",
            controller: categoryNameController,
            validator: AppValidators.categoryNameValidator,
            keyboardType: TextInputType.text,
          ),
          40.h.pH,
          AppButton(
            onTap: onSubmit,
            height: 40.h,
            title: isEdit ? "Update Category" : "Add Category",
            textColor: AppColors.whiteColor,
          ),
        ],
      ).addAllPadding(16),
    );
  }
}
