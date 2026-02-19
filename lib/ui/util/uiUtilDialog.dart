// プログレスを表示する関数

// Flutter imports:
import 'package:auto_route/auto_route.dart';
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

// ログインを促すダイアログを表示する関数を追加
void showLoginDialog(BuildContext context, {required String content}) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: const Text('ログイン'),
        content: Text(content), // 引数のcontentを表示
        actions: <Widget>[
          TextButton(
            child: const Text('いいえ'),
            onPressed: () {
              Navigator.of(dialogContext).pop();
            },
          ),
          TextButton(
            child: const Text('はい'),
            onPressed: () {
              Navigator.of(dialogContext).pop();
              AutoRouter.of(context).pushNamed('/login'); // contextは元の画面のものを利用
            },
          ),
        ],
      );
    },
  );
}
