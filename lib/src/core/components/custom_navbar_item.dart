import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:employme/src/core/constants/colors.dart';

class CustomNavbarItem {
  static BottomNavigationBarItem create(
      {required String icon, required String label}) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon,
        colorFilter:
            const ColorFilter.mode(AppColors.disabled, BlendMode.srcIn),
      ),
      activeIcon: SvgPicture.asset(
        icon, 
        colorFilter:
            const ColorFilter.mode(AppColors.primaryBlue, BlendMode.srcIn),
      ),
      label: label,
    );
  }
}
