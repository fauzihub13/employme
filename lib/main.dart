import 'package:employme/core/constants/colors.dart';
import 'package:employme/presentation/auth/bloc/login/login_bloc.dart';
import 'package:employme/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/datasource/auth_local_datasource.dart';
import 'data/datasource/auth_remote_datasource.dart';
import 'presentation/auth/pages/presentation/Splash_page.dart';
import 'presentation/auth/pages/presentation/onboarding_page.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(
            authRemoteDatasource: AuthRemoteDatasource(),
            authLocalDatasource: AuthLocalDatasource(),
          ),
        ),
        BlocProvider(
          create: (context) =>
              LogoutBloc(authLocalDatasource: AuthLocalDatasource()),
        ),
      ],
      child: MaterialApp(
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
            onSurface: AppColors.black,
            error: AppColors.baseColor,
            onError: AppColors.baseColor,
          ),
          useMaterial3: true,
        ),
        home: const SplashPage(),
      ),
    );
  }
}
