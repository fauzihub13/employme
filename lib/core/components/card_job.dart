import 'package:employme/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CardJob extends StatelessWidget {
  final double? borderRadius;
  final String image;
  final String? jobTitle;
  final String? jobCompany;
  final String? jobSalary;
  final String? jobLocation;

  final String? experienceTitle;
  final String? experiencecompany;
  final String? experienceLocation;
  final String? experienceDate;

  final VoidCallback? onTap;

  const CardJob({
    super.key,
    this.borderRadius = 24,
    required this.image,
    this.jobTitle = '',
    this.jobCompany = '',
    this.jobSalary = '',
    this.jobLocation = '',
    this.experienceTitle = '',
    this.experiencecompany = '',
    this.experienceLocation = '',
    this.experienceDate = '',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        child: Row(
          spacing: 16,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                image,
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
                        flex: 2,
                        child: Text(
                          jobTitle!.isNotEmpty ? jobTitle! : experienceTitle!,
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
                          jobSalary!.isNotEmpty
                              ? jobSalary!
                              : experienceLocation!,
                          maxLines: 1,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
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
                          jobCompany!.isNotEmpty
                              ? jobCompany!
                              : experiencecompany!,
                          maxLines: 1,
                          style: TextStyle(
                            color: AppColors.darkGrey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Text(
                          jobLocation!.isNotEmpty
                              ? jobLocation!
                              : experienceDate!,
                          maxLines: 1,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: AppColors.darkGrey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
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
