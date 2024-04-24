import 'package:e_commerce_application/Core/Utils/Routes.dart';
import 'package:e_commerce_application/UI/Auth/Login/LoginView.dart';
import 'package:e_commerce_application/UI/Auth/Register/RegisterView.dart';
import 'package:e_commerce_application/UI/Home/HomeView.dart';
import 'package:e_commerce_application/UI/Splash/SplashView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      child: MaterialApp(
        title: 'E-Commerce Application',
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.loginRouteName,
        routes: {
          Routes.splashRouteName: (context) => const SplashView(),
          Routes.registerRouteName: (context) => RegisterView(),
          Routes.loginRouteName: (context) => LoginView(),
          Routes.homeRouteName: (context) => HomeView(),
        },
      ),
    );
  }
}
