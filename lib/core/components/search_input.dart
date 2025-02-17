import 'package:employme/core/constants/colors.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(String value)? onChanged;
  final VoidCallback? onTap;
  final String hintText;
  final BorderRadius? borderRadius;
  final IconButton? suffixIcon;
  final FocusNode? focusNode;

  const SearchInput(
      {super.key,
      required this.controller,
      this.onChanged,
      this.onTap,
      this.hintText = 'Cari di sini',
      this.borderRadius,
      this.suffixIcon,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: borderRadius ?? BorderRadius.circular(16.0),
      ),
      child: TextFormField(
        focusNode: focusNode,
        onTap: onTap,
        readOnly: onTap != null,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColors.darkGrey, fontSize: 18),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.darkGrey,
          ),
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.all(16.0),
          border: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: AppColors.lightGrey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: AppColors.lightGrey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: AppColors.lightGrey),
          ),
        ),
      ),
    );
  }
}
