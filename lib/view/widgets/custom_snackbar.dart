import 'package:flutter/material.dart';

import '../../constant.dart';

class CustomSnackbar {
  static void showSnack(BuildContext context, String message, Color color) {
    final snackbar = SnackBar(
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.horizontal,
      duration: const Duration(seconds: 2),
      elevation: 3.0,
      // width: MediaQuery.of(context).size.width * 0.2,
      backgroundColor: color,
      content: Text(
        message,
        style: AppTextStyle.normalText(color: ColorConstant.primaryColor),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
