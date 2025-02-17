import 'package:employme/core/constants/colors.dart';
import 'package:employme/presentation/home/pages/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'presentation/auth/onboarding_page.dart';

void main() async{
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.baseColor),
        useMaterial3: true,
      ),
      home: const OnboardingPage(),
    );
  }
}
