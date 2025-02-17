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
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(416),
                  bottomRight: Radius.circular(416),
                ),
              ),
            ),
            const SizedBox(height: 20),
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
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.asset(
                          onBoards[index].onboardingImage,
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.7,
                          fit: BoxFit.contain,
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
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: onBoards.length,
                effect: const WormEffect(
                  dotHeight: 6,
                  dotWidth: 24,
                  activeDotColor: AppColors.primaryBlue,
                  dotColor: AppColors.disabled,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 40, 40),
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
                      child: SizedBox(
                        width: 100,
                        height: 56,
                        child: Center(
                          child: Text(
                            'Skip',
                            style: const TextStyle(
                              color: Color(0xff95969D),
                              fontSize: 14,
                            ),
                          ),
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
      ),
    );
  }
}
