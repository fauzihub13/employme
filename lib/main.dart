import 'package:employme/core/constants/colors.dart';
import 'package:flutter/material.dart';

import 'presentation/auth/onboarding_page.dart';

// void main() async{
//   runApp(const MyApp());
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EmployMe',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.baseColor,
          onPrimary: AppColors.baseColor,
          secondary: AppColors.baseColor,
          onSecondary: AppColors.baseColor,
          surface: AppColors.baseColor,
          onSurface: AppColors.baseColor,
          error: AppColors.baseColor,
          onError: AppColors.baseColor,
        ),
        useMaterial3: true,
      ),
      home: const OnboardingPage(),
    );
  }
}
