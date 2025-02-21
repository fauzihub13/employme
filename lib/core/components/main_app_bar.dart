import 'package:employme/core/constants/colors.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0.0,
      backgroundColor: AppColors.baseColor,
      title: Container(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 40, bottom: 40),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Column(
              spacing: 2,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back!',
                  style: TextStyle(color: AppColors.darkGrey, fontSize: 16),
                ),
                Text(
                  'John Dae ',
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.w800),
                ),
              ],
            )),
            CircleAvatar(
              backgroundColor: AppColors.primaryBlue,
              radius: 30.0,
              backgroundImage: const AssetImage('assets/images/profile.jpeg')
                  as ImageProvider,
            ),
          ],
        ),
      ),
    );
  }
}
