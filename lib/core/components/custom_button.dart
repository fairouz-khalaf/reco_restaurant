import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reco_restaurant/core/theme/app_theme.dart';

class AppButton extends StatelessWidget {
  final Widget? child;
  final Color? background, borderColor, textColor;
  final Function()? onTap;
  final double? elevation, fontSize, height, width, radius;
  final String? title;
  final FontWeight? fontWeight;
  final BorderRadius? borderOnly;

  const AppButton({
    super.key,
    this.onTap,
    this.child,
    this.fontWeight,
    this.textColor,
    this.width,
    this.height,
    this.background,
    this.borderColor,
    this.radius,
    this.elevation,
    this.fontSize,
    this.title,
    this.borderOnly,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: elevation ?? 0.0,
        minimumSize: Size(width ?? double.infinity, height ?? double.infinity),
        backgroundColor: background ?? AppColors.primary,
        disabledBackgroundColor: background ?? AppColors.primary,
        side: BorderSide(color: borderColor ?? Colors.transparent),
        shape: RoundedRectangleBorder(
          borderRadius: borderOnly ?? BorderRadius.circular(radius ?? 12.r),
        ),
      ),
      onPressed: onTap,
      child:
          child ??
          Text(
            title ?? '',
            style: TextStyle(
              fontSize: fontSize ?? 16.sp,
              color: textColor ?? AppColors.whiteColor,
              fontWeight: fontWeight ?? FontWeight.w500,
            ),
          ),
    );
  }
}
