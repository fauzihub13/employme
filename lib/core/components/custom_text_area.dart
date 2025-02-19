import 'package:employme/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextArea extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Widget? prefixIcon;
  final bool enabled;
  final bool readOnly;
  final double borderRadius;
  final int maxLines;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;

  const CustomTextArea({
    super.key,
    required this.controller,
    this.hintText,
    this.prefixIcon,
    this.enabled = true,
    this.readOnly = false,
    this.borderRadius = 16.0,
    this.maxLines = 1,
    this.textInputType = TextInputType.text,
    this.validator,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      enabled: enabled,
      readOnly: readOnly,
      maxLines: maxLines,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUnfocus,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: AppColors.white,
        hintStyle: TextStyle(
          color: AppColors.darkGrey,
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(width: 0),
            borderRadius: BorderRadius.circular(borderRadius)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
