import 'dart:math';

import 'package:employme/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import '../../data/datasource/auth_local_datasource.dart';
import '../home/pages/landing_page.dart';
import 'onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _authLocalDatasource = AuthLocalDatasource();

  @override
  void initState() {
    super.initState();

    // Delay for splash screen duration and navigate
    Future.delayed(const Duration(seconds: 3), () {
      _checkTokenAndNavigate();
    });
  }

  void _checkTokenAndNavigate() async {
    try {
      final token = await _authLocalDatasource.getToken();
      print(token ?? 'no token');
      if (mounted) {
        if (token != null) {
          SnackBar(
            content: Text(
              'Login successful',
              style: TextStyle(color: AppColors.white),
            ),
            backgroundColor: Colors.green,
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LandingPage(),
            ),
          );
        } else {
          SnackBar(
            content: Text(
              'Login failed',
              style: TextStyle(color: AppColors.white),
            ),
            backgroundColor: Colors.red,
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => OnboardingPage(),
            ),
          );
        }
      }
    } catch (e) {
      // Handle potential errors here (e.g., show a dialog)
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error loading token: $e, please login again'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primaryBlue, AppColors.darkBlue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: ClipRect(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.8,
              child: Center(
                child: Image.asset(
                  'assets/icons/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
