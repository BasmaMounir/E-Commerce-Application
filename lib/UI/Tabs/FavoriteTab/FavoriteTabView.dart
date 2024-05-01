import 'package:e_commerce_application/Core/Utils/Assets.dart';
import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:e_commerce_application/Core/Utils/ReusableWidgets/ListItemWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoriteTabView extends StatelessWidget {
  const FavoriteTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return ListItemWidget(
            bottomButton: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
              decoration: BoxDecoration(
                  color: MyColors.white,
                  border: Border.all(color: MyColors.darkSlateGray, width: 1),
                  borderRadius: BorderRadius.circular(25.r)),
              child: Text(
                'Add to Cart',
                style: TextStyle(
                    fontSize: 18.sp,
                    color: MyColors.darkSlateGray,
                    fontWeight: FontWeight.bold),
              ),
            ),
            topButton: IconButton(
                onPressed: () {},
                icon: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: MyColors.white,
                        borderRadius: BorderRadius.circular(25.r)),
                    child: SvgPicture.asset(
                      Assets.favoriteIcon,
                      color: MyColors.darkSlateGray,
                    ))),
          );
        },
        itemCount: 20);
  }
}
