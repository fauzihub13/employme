import '/core/constants/colors.dart';
import '/data/models/onboarsing_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../home/pages/landing_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baseColor,
      body: Column(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              color: AppColors.grey.withValues(alpha: 0.2),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(416),
                bottomRight: Radius.circular(416),
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemCount: onBoards.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(
                      onBoards[index].onboardingImage,
                      height: 284,
                      width: 284,
                    ),
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        onBoards[index].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff95969D),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: onBoards.length,
              effect: const ExpandingDotsEffect(
                dotColor: AppColors.disabled,
                activeDotColor: AppColors.primaryBlue,
                dotHeight: 10,
                dotWidth: 10,
                offset: 8,
                spacing: 8,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            child: Row(
              children: [
                if (currentPage > 0)
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LandingPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Skip',
                      style: const TextStyle(
                        color: Color(0xff95969D),
                        fontSize: 14,
                      ),
                    ),
                  ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    if (currentPage < onBoards.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LandingPage(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: 158,
                    height: 56,
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        currentPage == onBoards.length - 1
                            ? 'Get Started'
                            : 'Next',
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
