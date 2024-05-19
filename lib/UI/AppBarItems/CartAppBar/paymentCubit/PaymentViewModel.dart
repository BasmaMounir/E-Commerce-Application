import 'package:e_commerce_application/Core/Utils/ToastMessage.dart';
import 'package:e_commerce_application/Domain/UseCase/PaymentUseCase.dart';
import 'package:e_commerce_application/UI/AppBarItems/CartAppBar/paymentCubit/PaymentStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/Utils/Colors.dart';

class PaymentViewModel extends Cubit<PaymentStates> {
  PaymentViewModel({required this.paymentUseCase})
      : super(InitialPaymentState());
  PaymentUseCase paymentUseCase;
  String authToken = '';
  String id = '';
  String paymentToken = '';
  int codeNumber = 0;

  void getToken(String apiKey) async {
    emit(LoadingPaymentState());
    var either = await paymentUseCase.invokeGetToken(apiKey);
    either.fold((error) {
      print('Error getting token: ${error.errorMessage}');
      emit(ErrorPaymentState(message: error.errorMessage));
    }, (response) {
      emit(TokenSuccessPaymentState(getTokenEntity: response));
      authToken = response.token!;
    });
  }

  Future<void> getOrderId() async {
    emit(LoadingPaymentState());
    var either = await paymentUseCase.invokeGetOrderId(authToken);
    either.fold((error) {
      print('Error getting order ID: ${error.errorMessage}');
      emit(ErrorPaymentState(message: error.errorMessage));
      ToastMessage.showToastMessage(
          message: error.errorMessage, toastColor: MyColors.salmon);
    }, (response) {
      emit(OrderIdSuccessPaymentState(getOrderIdEntity: response));
      id = response.id.toString();
    });
  }

  Future<void> getPaymentRequest(int integrationId) async {
    await getOrderId();
    if (id.isEmpty) {
      print('Order ID is empty, cannot proceed with payment request.');
      return;
    }

    emit(LoadingPaymentState());
    var either =
        await paymentUseCase.invokePaymentRequest(authToken, integrationId, id);
    either.fold((error) {
      print('Error making payment request: ${error.errorMessage}');
      emit(ErrorPaymentState(message: error.errorMessage));
      ToastMessage.showToastMessage(
          message: error.errorMessage, toastColor: MyColors.salmon);
    }, (response) {
      emit(RequestSuccessPaymentState(paymentRequestEntity: response));
      paymentToken = response.token!;
    });
  }

  Future<void> getKiosk() async {
    await getPaymentRequest(4577183);
    emit(LoadingPaymentState());
    var either = await paymentUseCase.invokeKioskResponse(paymentToken);
    either.fold((error) {
      print('Error making payment request: ${error.errorMessage}');
      emit(ErrorPaymentState(message: error.errorMessage));
      ToastMessage.showToastMessage(
          message: error.errorMessage, toastColor: MyColors.salmon);
    }, (response) {
      emit(KioskSuccessPaymentState(kioskResponseEntity: response));
      codeNumber = response.id!.toInt();
      print('Iam success*************** ${codeNumber}');
    });
  }
}
