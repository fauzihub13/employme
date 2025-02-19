import 'package:employme/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool canBack;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomAppbar(
      {super.key,
      required this.title,
      required this.canBack,
      this.onTap,
      this.backgroundColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white, boxShadow: []),
      child: AppBar(
        toolbarHeight: 60,
        backgroundColor: backgroundColor ?? AppColors.white,
        scrolledUnderElevation: 0.0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              canBack
                  ? SizedBox(
                      width: 36,
                      height: 36,
                      child: IconButton(
                        icon: SvgPicture.asset(
                          'assets/icons/back.svg',
                          colorFilter: const ColorFilter.mode(
                              AppColors.black, BlendMode.srcIn),
                          width: 30,
                          height: 30,
                        ),
                        onPressed: () {
                          if (onTap != null) {
                            onTap!();
                          } else {
                            Navigator.pop(context);
                          }
                        },
                      ),
                    )
                  : const SizedBox(width: 40),
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor ?? AppColors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                  ),
                ),
              ),
              const SizedBox(width: 48),
            ],
          ),
        ),
      ),
    );
  }

  // Define preferedSizeWidget
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
