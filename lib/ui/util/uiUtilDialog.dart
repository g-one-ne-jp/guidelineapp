// プログレスを表示する関数

// Flutter imports:
import 'package:flutter/material.dart';

void uiUtilshowProgress(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.5),
    pageBuilder: (context, animation, secondaryAnimation) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}

// プログレスを閉じる関数
void uiUtilhideProgress(BuildContext context) {
  Navigator.pop(context);
}
