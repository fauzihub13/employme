import 'package:employme/core/constants/colors.dart';
import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const TitleSection({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.left,
          style: const TextStyle(
              fontSize: 18.0,
              color: AppColors.black,
              fontWeight: FontWeight.w600),
        ),
        TextButton(
          style: ButtonStyle(
            padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
            minimumSize: WidgetStateProperty.all<Size>(Size.zero),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: onPressed,
          child: const Text(
            'See all',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 16.0,
                color: AppColors.darkGrey,
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
