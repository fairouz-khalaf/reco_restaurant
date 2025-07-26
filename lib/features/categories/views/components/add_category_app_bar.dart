import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCategoryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isEdit;
  final String addTitle;
  final String editTitle;
  final List<Widget>? actions;

  const AddCategoryAppBar({
    super.key,
    required this.isEdit,
    this.addTitle = "Add Category",
    this.editTitle = "Edit Category",
    this.actions,
  });

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: EdgeInsets.only(top: 20.h, left: 16.w, right: 16.w),
        child: Text(
          isEdit ? editTitle : addTitle,
          style: TextStyle(fontSize: 20.sp),
        ),
      ),
      actions: actions,
    );
  }
}
