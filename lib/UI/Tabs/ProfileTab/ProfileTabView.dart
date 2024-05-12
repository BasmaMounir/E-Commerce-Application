import 'package:e_commerce_application/Core/PrefsHelper.dart';
import 'package:e_commerce_application/Core/Utils/Assets.dart';
import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:e_commerce_application/Core/Utils/ReusableWidgets/CustomButton.dart';
import 'package:e_commerce_application/Core/Utils/ReusableWidgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTabView extends StatelessWidget {
  const ProfileTabView({super.key});

  @override
  Widget build(BuildContext context) {
    var email = PrefsHelper.getData(key: 'email');
    var name = PrefsHelper.getData(key: 'name');
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome,Basma Mounir Mohamed \n basmaMounir@gmail.com',
              style: TextStyle(fontSize: 18, color: MyColors.darkSlateGray),
            ),
            SizedBox(
              height: 10.h,
            ),
            Center(child: Image.asset(Assets.profileImage)),
            CustomTextField(
              textFieldColor: MyColors.darkSlateGray,
              titleColor: MyColors.darkSlateGray,
              title: 'Your full name',
              hintTitle: '$name',
              controller: TextEditingController(),
              validator: (p0) => p0,
            ),
            CustomTextField(
              textFieldColor: MyColors.darkSlateGray,
              titleColor: MyColors.darkSlateGray,
              title: 'Your E-mail',
              hintTitle: '$email',
              controller: TextEditingController(),
              validator: (p0) => p0,
            ),
            CustomTextField(
              textFieldColor: MyColors.darkSlateGray,
              titleColor: MyColors.darkSlateGray,
              title: 'Your password',
              hintTitle: 'beso5620',
              controller: TextEditingController(),
              validator: (p0) => p0,
            ),
            CustomTextField(
              inputType: TextInputType.number,
              textFieldColor: MyColors.darkSlateGray,
              titleColor: MyColors.darkSlateGray,
              title: 'Your mobile number',
              hintTitle: '01122060186',
              controller: TextEditingController(),
              validator: (p0) => p0,
            ),
            Center(
                child: CustomButton(
                    buttonTitle: 'Update Profile', onPressed: () {})),
            SizedBox(
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }
}
