import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:e_commerce_application/Domain/Entity/Categories%20or%20Brands/CategoriesOrBrandsEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoryItem extends StatelessWidget {
  SubCategoryItem(
      {super.key, required this.index, required this.productsEntity});

  CategoriesOrBrandsEntity productsEntity;
  int index;
  List<Color> colors = [
    MyColors.honeydew,
    MyColors.lightYellow,
    MyColors.mistyRose,
    MyColors.lavender,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 191.w,
      height: 237.h,
      decoration: BoxDecoration(
          color: colors[index % 4],
          border: Border.all(width: 2, color: Colors.black26),
          borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: List.filled(
                            10,
                            const BoxShadow(
                                color: Colors.black12,
                                blurRadius: 2,
                                offset: Offset(2, 2))),
                        borderRadius: BorderRadius.circular(25.r),
                        color: MyColors.white),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25.r),
                      child: Image(
                        image: NetworkImage(
                            'https://tse1.mm.bing.net/th?id=OIP.8uBciaVnWPhj3BqjYmH7wgAAAA&pid=Api&P=0&h=220'),
                        height: 148.h,
                        width: 191.w,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productsEntity.name ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: MyColors.darkSlateGray),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
