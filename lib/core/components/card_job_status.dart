import 'package:employme/core/components/custom_badge.dart';
import 'package:employme/core/constants/colors.dart';
import 'package:employme/presentation/job/widgets/job_status.dart';
import 'package:flutter/material.dart';

class CardJobStatus extends StatelessWidget {
  final double? borderRadius;
  final String image;
  final String? jobTitle;
  final String? jobCompany;
  final String? jobSalary;
  final String? jobLocation;
  final String? jobStatus;
  final String? jobPosition;
  final VoidCallback? onTap;

  const CardJobStatus({
    super.key,
    this.borderRadius = 24,
    required this.image,
    this.jobTitle = '',
    this.jobCompany = '',
    this.jobSalary = '',
    this.jobLocation = '',
    this.jobStatus = '',
    this.jobPosition = '',
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
        child: Column(
          spacing: 20,
          children: [
            Row(
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
                              jobTitle!,
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
                              jobSalary!,
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
                              jobCompany!,
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
                              jobLocation!,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBadge(
                  text: getJobStatusLabel(parseJobStatus(jobStatus!)),
                  unselectedColor:
                      getJobStatusBackgroundColor(parseJobStatus(jobStatus!)),
                  opacity: 1,
                  textColor: getJobStatusTextColor(parseJobStatus(jobStatus!)),
                  borderColor: Colors.transparent,
                ),
                Text(jobPosition!)
              ],
            )
          ],
        ),
      ),
    );
  }
}
