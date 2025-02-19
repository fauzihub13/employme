import 'package:employme/core/components/banner_job.dart';
import 'package:employme/core/components/card_job.dart';
import 'package:employme/core/components/main_app_bar.dart';
import 'package:employme/core/components/search_input.dart';
import 'package:employme/core/constants/colors.dart';
import 'package:employme/core/components/title_section.dart';
import 'package:employme/presentation/job/pages/job_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController pageController = PageController(initialPage: 0);
  final _bannerJobList = [
    BannerJob(),
    BannerJob(),
    BannerJob(),
  ];

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
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: AppColors.lightGrey,
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: SvgPicture.asset(
                            'assets/icons/filter.svg',
                            colorFilter: const ColorFilter.mode(
                                AppColors.darkGrey, BlendMode.srcIn),
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
                      onPressed: () {
                        // print('KLIKKK');
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 176,
                    width: double.infinity,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: _bannerJobList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                              onTap: () {
                                // print('HOOOOOOO');
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return JobDetailPage();
                                }));
                              },
                              child: _bannerJobList[index]),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: _bannerJobList.length,
                      effect: const WormEffect(
                          dotHeight: 6,
                          dotWidth: 24,
                          activeDotColor: AppColors.primaryBlue,
                          dotColor: AppColors.disabled),
                    ),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  TitleSection(
                      title: 'Popular Jobs',
                      onPressed: () {
                        // print('KLIKKK');
                      }),
                  const SizedBox(height: 10),
                  Column(
                    spacing: 5,
                    children: [
                      CardJob(),
                      CardJob(),
                      CardJob(),
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
