class OnBoardModel {
  final String onboardingImage, title;

  OnBoardModel({
    required this.onboardingImage,
    required this.title,
  });
}

List<OnBoardModel> onBoards = [
  OnBoardModel(
    onboardingImage: 'assets/images/onboarding1.png',
    title: 'Figure out your top five priorities whether it is company culture, salary.',
  ),
  OnBoardModel(
    onboardingImage: 'assets/images/onboarding2.png',
    title: 'Our job list include several  industries, so you can find the best job for you.',
  ),
  OnBoardModel(
    onboardingImage: 'assets/images/onboarding2.png',
    title: 'You can apply to your desirable jobs very quickly and easily with ease.',
      ),
  OnBoardModel(
    onboardingImage: 'assets/images/onboarding3.png',
    title: 'We help you find your dream job based on your skillset, location, demand.',
  ),
];