import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reco_restaurant/core/theme/app_theme.dart';

class CustomTextForm extends StatefulWidget {
  final String? label;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isPassword;
  final TextInputType keyboardType;

  const CustomTextForm({
    super.key,
    this.label,
    required this.hintText,
    required this.controller,
    required this.validator,

    this.isPassword = false,
    required this.keyboardType,
  });

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final showPasswordToggle = widget.isPassword;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(
            widget.label!,
            style: TextStyle(fontSize: 14.sp, color: AppColors.textPrimary),
          ),
        SizedBox(height: 8.h),
        TextFormField(
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          validator: widget.validator,
          obscureText: showPasswordToggle ? _obscureText : false,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(color: AppColors.hintText, fontSize: 12.sp),
            suffixIcon:
                showPasswordToggle
                    ? IconButton(
                      onPressed: _togglePasswordVisibility,
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color:
                            _obscureText ? theme.hintColor : theme.primaryColor,
                      ),
                    )
                    : null,
          ),
        ),
      ],
    );
  }
}
