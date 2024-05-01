import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemsCounter extends StatefulWidget {
  const CartItemsCounter({super.key});

  @override
  State<CartItemsCounter> createState() => _CartItemstState();
}

class _CartItemstState extends State<CartItemsCounter> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: MyColors.lightYellow,
            border: Border.all(color: MyColors.darkSlateGray, width: 1),
            borderRadius: BorderRadius.circular(25.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                counter++;
                setState(() {});
              },
              icon: const Icon(
                Icons.add_box_outlined,
                color: MyColors.darkSlateGray,
              ),
            ),
            Text(
              '${counter.toString()}',
              style: TextStyle(fontSize: 18.sp, color: MyColors.darkSlateGray),
            ),
            IconButton(
              onPressed: () {
                counter--;
                setState(() {});
              },
              icon: const Icon(
                Icons.indeterminate_check_box_outlined,
                color: MyColors.darkSlateGray,
              ),
            ),
          ],
        ));
  }
}
