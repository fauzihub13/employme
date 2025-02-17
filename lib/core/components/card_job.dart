import 'package:employme/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CardJob extends StatelessWidget {
  const CardJob({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        spacing: 16,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              'assets/images/avatar.jpg',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
              child: Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Text(
                      'Junior Mobile ',
                      maxLines: 1,
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Text(
                      '\$96,000/year',
                      maxLines: 1,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Text(
                      'Telkom Indonesia ',
                      maxLines: 1,
                      style: TextStyle(
                          color: AppColors.darkGrey,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Text(
                      'Jakarta Pusat ',
                      maxLines: 1,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: AppColors.darkGrey,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ],
          )),
        ],
      ),
    );
  }
}