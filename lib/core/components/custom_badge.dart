import 'package:employme/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomBadge extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;
  final double? borderRadius;
  final Color? textColor;
  final Color? borderColor;
  final Color? selectedColor;
  final Color? unselectedColor;
  final double? opacity;
  final bool? isSelected;

  const CustomBadge({
    super.key,
    required this.text,
    this.textStyle,
    this.borderRadius = 20,
    this.textColor = AppColors.primaryBlue,
    this.borderColor = AppColors.primaryBlue,
    this.selectedColor = AppColors.primaryBlue,
    this.unselectedColor = AppColors.baseColor,
    this.opacity = 0.2,
    this.isSelected = false,
  });

  @override
  State<CustomBadge> createState() => _CustomBadgeState();
}

class _CustomBadgeState extends State<CustomBadge> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.isSelected!
            ? widget.selectedColor!
            : widget.unselectedColor!.withValues(alpha: widget.opacity!),
        border: Border.all(color: widget.borderColor!),
        borderRadius: BorderRadius.circular(widget.borderRadius!),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        child: Text(
          widget.text,
          style: TextStyle(
              color: widget.isSelected!
                  ? widget.unselectedColor!
                  : widget.textColor!),
        ),
      ),
    );
  }
}
