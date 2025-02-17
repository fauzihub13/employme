<<<<<<< HEAD
import '/core/constants/colors.dart'; // Import your colors
=======
import 'package:employme/core/constants/colors.dart'; // Import your colors
>>>>>>> 7ce04ade7932b3fbcc9de63b6159fe097679d680
import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final Color color;
  final double size;

  const DotIndicator({
    super.key,
    this.color = AppColors.primaryBlue, // Default color if not provided
    this.size = 6.0, // Default size
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
