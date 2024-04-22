import 'package:e_commerce_application/Core/Utils/Routes.dart';
import 'package:e_commerce_application/UI/Home/HomeView.dart';
import 'package:e_commerce_application/UI/Splash/SplashView.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce Application',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashRouteName,
      routes: {
        Routes.splashRouteName: (context) => const SplashView(),
        Routes.homeRouteName: (context) => const HomeView(),
      },
    );
  }
}
