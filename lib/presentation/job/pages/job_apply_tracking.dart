import 'package:employme/core/components/card_job.dart';
import 'package:employme/core/components/custom_appbar.dart';
import 'package:employme/core/components/title_section.dart';
import 'package:employme/core/constants/colors.dart';
import 'package:employme/presentation/job/widgets/card_job_tracking.dart';
import 'package:flutter/material.dart';

class JobApplyTracking extends StatelessWidget {
  const JobApplyTracking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Applied Job Details', canBack: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color: AppColors.white,
            child: CardJob(
                image: 'assets/images/avatar.jpg',
                jobTitle: 'Mobile Programmer',
                jobCompany: 'Telkom Indonesia',
                jobSalary: '\$90.000/y',
                jobLocation: 'Jakarta Pusat'),
          ),
          const SizedBox(height: 22),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TitleSection(title: 'Track Application', canPress: false),
                CardJobTracking(
                  title: 'Application submited',
                  date: '17 January 2025',
                  isFirst: true,
                ),
                CardJobTracking(
                  title: 'Reviewed by HR',
                  date: '20 January 2025',
                ),
                CardJobTracking(
                  title: 'Screening interview',
                  date: '25 January 2025',
                ),
                CardJobTracking(
                  title: 'Technical interview',
                  date: '3 February 2025',
                ),
                CardJobTracking(
                  title: 'Final HR interview',
                  date: '6 February 2025',
                ),
                CardJobTracking(
                  title: 'Team matching',
                  date: '10 February 2025',
                  isFinish: false,
                ),
                CardJobTracking(
                  title: 'Offer letter',
                  date: 'Not Yet',
                  iLast: true,
                  isFinish: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
