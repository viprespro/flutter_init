/**
 * @desc: 业务层方法
 */
import 'package:flutter/material.dart';

import 'dialog/loading.dart';

abstract class DemoDialog {
  // loading dialog
  static void showLoading(context, {String title = '加载中...'}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return LoadingDialog(
            text: title,
          );
        });
  }

  // hide loading dialog
  static void hideLoading(context) {
    Navigator.of(context).pop();
  }
}
