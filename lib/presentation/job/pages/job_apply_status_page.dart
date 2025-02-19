import 'package:employme/core/components/custom_button.dart';
import 'package:employme/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class JobApplyStatusPage extends StatefulWidget {
  const JobApplyStatusPage({super.key});

  @override
  State<JobApplyStatusPage> createState() => _JobApplyStatusPageState();
}

class _JobApplyStatusPageState extends State<JobApplyStatusPage> {
  @override
  Widget build(BuildContext context) {
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
              'You’ve successfully applied to Spotify ux intern role. You can see the job status from Application Tracking',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.disabled,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 60,
            ),
            CustomButton.filled(onPressed: () {}, label: 'Track Job'),
            const SizedBox(
              height: 20,
            ),
            CustomButton.outlined(onPressed: () {}, label: 'Browse Job'),
          ],
        ),
      )),
    );
  }
}
