import 'package:employme/core/components/custom_badge.dart';
import 'package:employme/core/constants/colors.dart';
import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  final double? borderRadius;
  final String? image;
  final String name;
  final String? message;
  final String? time;
  final int? amount;
  final bool? isRead;

  const ChatCard({
    super.key,
    this.borderRadius = 20,
    this.image = '',
    required this.name,
    this.message = '',
    this.time = '',
    this.amount = 0,
    this.isRead = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.baseColor,
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        child: Row(
          spacing: 16,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                image!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Text(
                          name,
                          maxLines: 1,
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Text(
                          time!,
                          maxLines: 1,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Text(
                          message!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.darkGrey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      if (!isRead!)
                        Flexible(
                            flex: 1,
                            child: CustomBadge(
                              text: amount!.toString(),
                              verticalPadding: 2,
                              horizontalPadding: 8,
                              fontSize: 11,
                              isSelected: true,
                            )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
