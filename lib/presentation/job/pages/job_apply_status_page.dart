import 'package:employme/core/components/custom_button.dart';
import 'package:employme/core/constants/colors.dart';
import 'package:employme/data/models/respone/job_response_model.dart';
import 'package:employme/presentation/job/pages/job_apply_tracking.dart';
import 'package:employme/presentation/job/pages/job_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class JobApplyStatusPage extends StatefulWidget {
  final Job job;
  const JobApplyStatusPage({super.key, required this.job});

  @override
  State<JobApplyStatusPage> createState() => _JobApplyStatusPageState();
}

class _JobApplyStatusPageState extends State<JobApplyStatusPage> {
  @override
  Widget build(BuildContext context) {
    final Job job = widget.job;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset('assets/images/success.svg'),
            ),
            Text(
              'Successful',
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'You’ve successfully applied to ${job.company!.name!} ${job.title!}  role. You can see the job status from Application Tracking',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.disabled,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 60,
            ),
            CustomButton.filled(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return  JobApplyTracking(job: job,);
                  }), (route) => route.isFirst);
                },
                label: 'Track Job'),
            const SizedBox(
              height: 20,
            ),
            CustomButton.outlined(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return JobListPage();
                  }), (route) => route.isFirst);
                },
                label: 'Browse Job'),
          ],
        ),
      )),
    );
  }
}
