import 'package:e_commerce_application/Core/Utils/Assets.dart';
import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:e_commerce_application/Core/Utils/ReusableWidgets/CustomButton.dart';
import 'package:e_commerce_application/Core/Utils/ReusableWidgets/CustomTextField.dart';
import 'package:e_commerce_application/Core/Utils/Routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      child: Stack(
        children: [
          Image.asset(
            Assets.background,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 80.h,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text('Wonders',
                        style: TextStyle(
                          color: MyColors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 10, bottom: 10),
                    child: const Text(
                        'Welcome Back!\n        Please sign in with your mail',
                        style: TextStyle(
                          color: MyColors.white,
                          fontSize: 20,
                        )),
                  ),
                  CustomTextField(
                    title: 'User Name',
                    hintTitle: 'enter your name',
                    validator: (newValue) {
                      return newValue;
                    },
                    controller: emailController,
                  ),
                  CustomTextField(
                    title: 'Password',
                    hintTitle: 'enter your password',
                    validator: (newValue) {
                      return newValue;
                    },
                    controller: passwordController,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot password',
                        style: TextStyle(color: MyColors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  CustomButton(
                    buttonTitle: 'Login',
                    onPressed: () => Navigator.pushReplacementNamed(
                        context, Routes.homeRouteName),
                  ),
                  TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, Routes.registerRouteName),
                    child: const Text(
                      'Don’t have an account? Create Account',
                      style: TextStyle(color: MyColors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
