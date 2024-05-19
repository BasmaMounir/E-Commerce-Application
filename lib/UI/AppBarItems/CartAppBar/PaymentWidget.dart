import 'package:e_commerce_application/Core/Api/ApiEndPoints.dart';
import 'package:e_commerce_application/Core/DI.dart';
import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:e_commerce_application/Core/Utils/DialogUtils.dart';
import 'package:e_commerce_application/UI/AppBarItems/CartAppBar/paymentCubit/PaymentStates.dart';
import 'package:e_commerce_application/UI/AppBarItems/CartAppBar/paymentCubit/PaymentViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentWidget extends StatelessWidget {
  PaymentWidget({super.key});

  PaymentViewModel viewModel =
      PaymentViewModel(paymentUseCase: injectPaymentUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: viewModel..getToken(ApiEndPoints.API_KEY),
      builder: (context, state) {
        if (state is TokenSuccessPaymentState) {
          return Container(
            height: 350.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: const Color(0xffECECEC)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text('Payment options ',
                      style: TextStyle(
                          color: MyColors.paymentColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                ),
                InkWell(
                  onTap: () {
                    DialogUtils.hideDialoge(context);
                    //viewModel.getOrderId();
                    viewModel.getKiosk();
                    DialogUtils.showSuccessAlertDialog(
                      context,
                      'Your Code is #${viewModel.codeNumber}',
                      confirmText: 'OK',
                      onConfirm: () => DialogUtils.hideDialoge(context),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: MyColors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey),
                          child: const Icon(Icons.numbers_outlined,
                              color: MyColors.white),
                        ),
                        const Text(
                          'Pay by Code',
                          style: TextStyle(
                              color: MyColors.paymentColor, fontSize: 22),
                        ),
                        const Icon(Icons.arrow_forward_ios,
                            color: MyColors.paymentColor),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: MyColors.white,
                    ),
                    margin: const EdgeInsets.all(15),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey),
                          child:
                              const Icon(Icons.payment, color: MyColors.white),
                        ),
                        const Text('Pay by Card',
                            style: TextStyle(
                                color: MyColors.paymentColor, fontSize: 22)),
                        const Icon(Icons.arrow_forward_ios,
                            color: MyColors.paymentColor),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        } else if (state is ErrorPaymentState) {
          print('!!!!!!!${state.message}');
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
