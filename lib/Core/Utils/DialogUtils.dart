import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class DialogUtils {
  static void hideDialoge(BuildContext context) {
    Navigator.pop(context);
  }

  static void showLoadingAlertDialog(BuildContext context, String message) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.loading,
      title: 'Loading',
      text: message,
    );
  }

  static void showSuccessAlertDialog(BuildContext context, String message,
      {String confirmText = '', void Function()? onConfirm}) {
    QuickAlert.show(
      onConfirmBtnTap: onConfirm,
      confirmBtnText: confirmText,
      context: context,
      type: QuickAlertType.success,
      confirmBtnColor: MyColors.black,
      text: message,
    );
  }

  static void showConfirmAlertDialog(BuildContext context, String message) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      text: message,
      confirmBtnText: 'Yes',
      cancelBtnText: 'No',
      confirmBtnColor: Colors.green,
    );
  }

  static void showErrorAlertDialog(BuildContext context, String message) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      confirmBtnColor: MyColors.black,
      title: 'Oops...',
      text: message,
    );
  }
}
