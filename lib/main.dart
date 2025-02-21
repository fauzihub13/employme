import 'package:employme/core/constants/colors.dart';
import 'package:employme/data/datasource/job_remote_datasources.dart';
import 'package:employme/presentation/auth/bloc/login/login_bloc.dart';
import 'package:employme/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:employme/presentation/job/bloc/bloc/job_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/datasource/auth_local_datasource.dart';
import 'data/datasource/auth_remote_datasource.dart';
import 'presentation/auth/pages/presentation/splash_page.dart';

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
        BlocProvider(
          create: (context) =>
              JobBloc(jobRemoteDatasources: JobRemoteDatasources()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'EmployMe',
        theme: ThemeData(
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: AppColors.black,
            onPrimary: AppColors.black,
            secondary: AppColors.black,
            onSecondary: AppColors.black,
            surface: AppColors.baseColor,
            onSurface: AppColors.black,
            error: AppColors.darkRed,
            onError: AppColors.darkRed,
          ),
          useMaterial3: true,
        ),
        home: const SplashPage(),
      ),
    );
  }
}
