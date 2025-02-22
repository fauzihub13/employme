import 'dart:math';

import 'package:employme/core/components/banner_job.dart';
import 'package:employme/core/components/card_job.dart';
import 'package:employme/core/components/main_app_bar.dart';
import 'package:employme/core/components/search_input.dart';
import 'package:employme/core/components/title_section.dart';
import 'package:employme/core/constants/colors.dart';
import 'package:employme/data/models/respone/job_response_model.dart';
import 'package:employme/presentation/job/bloc/bloc/job_bloc.dart';
import 'package:employme/presentation/job/bloc/bloc/job_state.dart';
import 'package:employme/presentation/job/pages/job_detail_page.dart';
import 'package:employme/presentation/job/pages/job_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController pageController = PageController(initialPage: 0);

  List<Job> jobs = [];

  final Job job = fakeJobData.data!.first;

  @override
  void initState() {
    super.initState();
    context.read<JobBloc>().add(GetJobList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainAppBar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: SearchInput(
                          controller: TextEditingController(),
                          hintText: 'Search a job or position',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return JobListPage();
                          }));
                        },
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: AppColors.lightGrey,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: SvgPicture.asset(
                              'assets/icons/search.svg',
                              colorFilter: const ColorFilter.mode(
                                  AppColors.darkGrey, BlendMode.srcIn),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  TitleSection(
                    title: 'Featured Jobs',
                    canPress: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocConsumer<JobBloc, JobState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is JobLoading) {
                        return Skeletonizer(
                          enabled: true,
                          effect: ShimmerEffect(
                              baseColor: AppColors.white.withValues(alpha: 0.2),
                              highlightColor:
                                  AppColors.primaryBlue.withValues(alpha: 0.2),
                              duration: const Duration(milliseconds: 1500)),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                                onTap: () {},
                                child: BannerJob(
                                  job: job,
                                )),
                          ),
                        );
                      } else if (state is JobLoaded) {
                        jobs = state.jobList;
                        return SizedBox(
                          height: 176,
                          width: double.infinity,
                          child: PageView.builder(
                            controller: pageController,
                            itemCount: min(3, jobs.length).toInt(),
                            itemBuilder: (context, index) {
                              final job = jobs[jobs.length.toInt() -
                                  min(3, jobs.length).toInt() +
                                  index];
                              return Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return JobDetailPage(job: job);
                                      }));
                                    },
                                    child: BannerJob(
                                      job: job,
                                    )),
                              );
                            },
                          ),
                        );
                      }

                      return Center(
                          child:
                              Text('Something went wrong. Please try again.'));
                    },
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  TitleSection(
                      title: 'Popular Jobs',
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const JobListPage();
                        }));
                      }),
                  const SizedBox(height: 10),
                  BlocConsumer<JobBloc, JobState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is JobLoading) {
                        return Skeletonizer(
                          enabled: true,
                          effect: ShimmerEffect(
                              baseColor: AppColors.lightGrey,
                              highlightColor:
                                  AppColors.darkGrey.withValues(alpha: 0.5),
                              duration: const Duration(milliseconds: 1500)),
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.all(0),
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: CardJob(
                                    image:
                                        'assets/images/company/company_1.jpeg',
                                    jobTitle: 'Programmer',
                                    jobCompany: 'Dathusion Company',
                                    jobSalary: '120000',
                                    jobLocation: 'Jakarta',
                                    onTap: () {},
                                  ),
                                );
                              }),
                        );
                      } else if (state is JobLoaded) {
                        jobs = state.jobList;
                        return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.all(0),
                            itemCount: min(3, jobs.length),
                            itemBuilder: (context, index) {
                              final job = jobs[index];
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: CardJob(
                                  image: job.company!.logoPath!,
                                  jobTitle: job.title!,
                                  jobCompany: job.company!.name!,
                                  jobSalary: job.salary!.max!.substring(
                                      0, job.salary!.max!.length - 3),
                                  jobLocation: job.company!.location!,
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return JobDetailPage(
                                        job: job,
                                      );
                                    }));
                                  },
                                ),
                              );
                            });
                      } else if (state is JobError) {
                        return Center(
                          child: Text(
                            'Failed to load jobs.',
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      }
                      return Center(
                          child:
                              Text('Something went wrong. Please try again.'));
                    },
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
