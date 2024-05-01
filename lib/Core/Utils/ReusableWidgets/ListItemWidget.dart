import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListItemWidget extends StatelessWidget {
  ListItemWidget(
      {super.key, required this.topButton, required this.bottomButton});

  Widget? bottomButton;
  Widget? topButton;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: MyColors.lightSeaGreen),
              color: MyColors.darkSlateGray,
              borderRadius: BorderRadius.circular(20.r)),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.circular(20.r)),
                child: Image.asset(
                  'assets/images/advertisement1.png',
                  height: 113.h,
                  width: 120.w,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 18.w),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(
                          fontSize: 15,
                          color: MyColors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text('EGP 3,500',
                        style: TextStyle(
                            fontSize: 15,
                            color: MyColors.white,
                            fontWeight: FontWeight.normal))
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 270.w,
          right: 15.w,
          top: 100.h,
          child: Align(alignment: Alignment.bottomRight, child: bottomButton),
        ),
        Positioned(
          left: 270.w,
          right: 25.w,
          bottom: 80.h,
          child: Align(alignment: Alignment.topRight, child: topButton),
        )
      ],
    );
  }
}
