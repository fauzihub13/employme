import 'package:employme/core/constants/colors.dart';
import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final String? detailTitle;
  final VoidCallback? onPressed;
  final bool? canPress;

  const TitleSection(
      {super.key,
      required this.title,
      this.detailTitle = '',
      this.canPress = true,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.left,
          style: const TextStyle(
              fontSize: 18.0,
              color: AppColors.black,
              fontWeight: FontWeight.w600),
        ),
        if (detailTitle!.isNotEmpty)
          Text(
            ' (${detailTitle!})',
            textAlign: TextAlign.left,
            style: const TextStyle(
                fontSize: 18.0,
                color: AppColors.disabled,
                fontWeight: FontWeight.w400),
          ),
        const Spacer(),
        if (canPress!)
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
