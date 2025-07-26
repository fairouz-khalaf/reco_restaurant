import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reco_restaurant/core/theme/app_theme.dart';
import 'package:reco_restaurant/features/categories/views/components/add_category_form.dart';

class AddCategoryView extends StatefulWidget {
  final bool isEdit;
  final String? categoryId;
  final String? initialCategoryName;

  const AddCategoryView({
    super.key,
    this.isEdit = false,
    this.categoryId,
    this.initialCategoryName,
  });

  @override
  State<AddCategoryView> createState() => _AddCategoryViewState();
}

class _AddCategoryViewState extends State<AddCategoryView> {
  final formKey = GlobalKey<FormState>();
  final categoryNameController = TextEditingController();
  final categoryDescriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.isEdit) {
      categoryNameController.text = widget.initialCategoryName ?? '';
    }
  }

  Future<void> _submit() async {
    if (!formKey.currentState!.validate()) return;

    if (widget.isEdit && widget.categoryId != null) {
      await FirebaseFirestore.instance
          .collection('categories')
          .doc(widget.categoryId)
          .update({
            'categoryName': categoryNameController.text,
            'categoryDescription': categoryDescriptionController.text,
          });

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppColors.success,
          content: Text(
            "Category updated successfully",
            style: TextStyle(color: AppColors.whiteColor),
          ),
        ),
      );
    } else {
      await FirebaseFirestore.instance.collection('categories').add({
        'categoryName': categoryNameController.text,
        'id': FirebaseAuth.instance.currentUser!.uid,
      });

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppColors.success,
          content: Text(
            "Category added successfully",
            style: TextStyle(color: AppColors.whiteColor),
          ),
        ),
      );
    }

    Navigator.pop(context);
  }

  @override
  void dispose() {
    categoryNameController.dispose();
    categoryDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),

          child: Text(widget.isEdit ? "Edit Category" : "Add Category"),
        ),
      ),
      body: AddCategoryForm(
        formKey: formKey,
        categoryNameController: categoryNameController,
        onSubmit: _submit,
        isEdit: widget.isEdit,
      ),
    );
  }
}
