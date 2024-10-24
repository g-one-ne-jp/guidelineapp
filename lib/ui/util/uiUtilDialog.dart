// プログレスを表示する関数
import 'package:flutter/material.dart';

void uiUtilshowProgress(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.5),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}

// プログレスを閉じる関数
void uiUtilhideProgress(BuildContext context) {
  Navigator.pop(context);
}
