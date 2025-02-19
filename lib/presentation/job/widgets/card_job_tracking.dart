import 'package:employme/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CardJobTracking extends StatelessWidget {
  final String title;
  final String date;
  final bool? isFirst;
  final bool? iLast;
  final bool? isFinish;

  const CardJobTracking(
      {super.key,
      required this.title,
      required this.date,
      this.isFirst = false,
      this.iLast = false,
      this.isFinish = true});

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst!,
      isLast: iLast!,
      beforeLineStyle: LineStyle(
          color: isFinish! ? AppColors.primaryBlue : AppColors.darkGrey,
          thickness: 2),
      afterLineStyle: LineStyle(
          color: isFinish! ? AppColors.primaryBlue : AppColors.darkGrey,
          thickness: 2),
      indicatorStyle: IndicatorStyle(
        indicator: Container(
          alignment: Alignment.center,
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isFinish! ? AppColors.primaryBlue : AppColors.disabled,
            border: isFinish!
                ? null
                : Border.all(width: 1, color: AppColors.disabled),
          ),
          child: Icon(
            Icons.done,
            size: 14,
            color: isFinish! ? AppColors.white : AppColors.disabled,
          ),
        ),
      ),
      endChild: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
            color: AppColors.baseColor,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          spacing: 6,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black),
            ),
            Text(
              date,
              style: TextStyle(fontSize: 14, color: AppColors.darkGrey),
            ),
          ],
        ),
      ),
    );
  }
}
