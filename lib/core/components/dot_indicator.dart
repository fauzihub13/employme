import 'package:employme/core/constants/colors.dart'; // Import your colors
import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final Color color;
  final double size;

  const DotIndicator({
    super.key,
    this.color = AppColors.primaryBlue, 
    this.size = 6.0, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
