import 'package:e_commerce_application/Core/Utils/Assets.dart';
import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BrandsItem extends StatelessWidget {
  BrandsItem({super.key, required this.index});

  int index;
  List<Color> colors = [
    MyColors.honeydew,
    MyColors.lightYellow,
    MyColors.mistyRose,
    MyColors.lavender,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 200.h,
        width: 170.w,
        decoration: BoxDecoration(
            border: Border.all(color: MyColors.darkSlateGray, width: 1),
            color: colors[index % 4],
            borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image(
                    image: AssetImage(
                        'assets/images/soin-volumateur-anti-gravité-serie-expert-200ml 1.png'),
                    height: 100.h,
                  ),
                  Text(
                    'L' 'OREAL\nPROFESSIONNEL',
                    style: TextStyle(
                        fontSize: 12.sp, color: MyColors.darkSlateGray),
                  ),
                  Text(
                    '6,900 DT',
                    style: TextStyle(fontSize: 16.sp, color: MyColors.salmon),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  height: 32.h,
                  width: 56.w,
                  decoration: const BoxDecoration(
                    color: MyColors.lightSeaGreen,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: SvgPicture.asset(
                    Assets.cartIcon,
                    color: MyColors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
