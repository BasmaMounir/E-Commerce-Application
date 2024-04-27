import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddToFavoriteList extends StatelessWidget {
  const AddToFavoriteList({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
              color: MyColors.lightSeaGreen,
              borderRadius: BorderRadius.circular(20)),
          child: const Icon(
            Icons.favorite_border_rounded,
            color: MyColors.white,
          )),
    );
  }
}
