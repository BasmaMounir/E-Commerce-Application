import 'package:e_commerce_application/UI/Home/CategoriesAppBar/BrandsItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandsSection extends StatelessWidget {
  const BrandsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => BrandsItem(
          index: index,
        ),
      ),
    );
  }
}
