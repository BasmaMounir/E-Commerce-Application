import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(
              color: MyColors.darkSlateGray, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      // body: ListView.builder(
      //     itemBuilder: (context, index) {
      //       return ListItemWidget(
      //         bottomButton: const CartItemsCounter(),
      //         topButton: IconButton(
      //             onPressed: () {},
      //             icon: Container(
      //                 padding: const EdgeInsets.all(10),
      //                 decoration: BoxDecoration(
      //                     color: MyColors.salmon,
      //                     borderRadius: BorderRadius.circular(20.r)),
      //                 child: SvgPicture.asset(
      //                   Assets.deleteIcon,
      //                   color: MyColors.white,
      //                 ))),
      //       );
      //     },
      //     itemCount: 20),
    );
  }
}
