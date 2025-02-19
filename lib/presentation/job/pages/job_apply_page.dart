import 'package:employme/core/components/card_job.dart';
import 'package:employme/core/components/card_profile_option.dart';
import 'package:employme/core/components/card_resume_option.dart';
import 'package:employme/core/components/custom_appbar.dart';
import 'package:employme/core/components/custom_button.dart';
import 'package:employme/core/components/custom_text_area.dart';
import 'package:employme/core/components/title_section.dart';
import 'package:employme/core/constants/colors.dart';
import 'package:flutter/material.dart';

class JobApplyPage extends StatefulWidget {
  const JobApplyPage({super.key});

  @override
  State<JobApplyPage> createState() => _JobApplyPageState();
}

class _JobApplyPageState extends State<JobApplyPage> {
  int profileSelected = 0;
  int resumeSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Apply', canBack: true),
      body: SafeArea(
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                color: AppColors.white,
                child: CardJob()),
            const SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  TitleSection(title: 'Select a profile', canPress: false),
                  const SizedBox(height: 10),
                  Row(
                    spacing: 16,
                    children: [
                      Flexible(
                        flex: 1,
                        child: CardProfileOption(
                            avatar: 'assets/images/avatar.jpg',
                            name: 'John Dae',
                            title: 'Programmer',
                            isSelected: profileSelected == 0,
                            onTap: () {
                              setState(() {
                                profileSelected = 0;
                              });
                            }),
                      ),
                      Flexible(
                        flex: 1,
                        child: CardProfileOption(
                            avatar: 'assets/images/avatar.jpg',
                            name: 'John Dae',
                            title: 'Designer',
                            isSelected: profileSelected == 1,
                            onTap: () {
                              setState(() {
                                profileSelected = 1;
                              });
                            }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  TitleSection(title: 'Select a resume', canPress: false),
                  const SizedBox(height: 10),
                  Row(
                    spacing: 16,
                    children: [
                      Flexible(
                        flex: 1,
                        child: CardResumeOption(
                            name: 'John Dae',
                            title: 'Programmer',
                            isSelected: resumeSelected == 0,
                            color: AppColors.green,
                            onTap: () {
                              setState(() {
                                resumeSelected = 0;
                              });
                            }),
                      ),
                      Flexible(
                        flex: 1,
                        child: CardResumeOption(
                            name: 'John Dae',
                            title: 'Designer',
                            isSelected: resumeSelected == 1,
                            onTap: () {
                              setState(() {
                                resumeSelected = 1;
                              });
                            }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  TitleSection(
                      title: 'Cover Later',
                      detailTitle: 'optional',
                      canPress: false),
                  const SizedBox(height: 10),
                  CustomTextArea(
                    controller: TextEditingController(),
                    maxLines: 7,
                    hintText: 'Write a cover letter...',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          child: CustomButton.filled(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return const JobApplyPage();
                // }));
              },
              label: 'Apply Now')),
    );
  }
}
