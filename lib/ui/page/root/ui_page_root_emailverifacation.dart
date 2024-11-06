// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/debug/debug_print.dart';
import 'package:flutter_template/ui/util/uiUtilDialog.dart';
import 'package:flutter_template/util/util_googlesingin.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';

@RoutePage()
class UiPageEmailVerification extends HookConsumerWidget {
  const UiPageEmailVerification({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future<void>(() async {
        final user = FirebaseAuth.instance.currentUser!;
        //email認証が終わってる？
        if (user.emailVerified) {
          context.router.popUntilRoot();
          context.router.replaceNamed('/home');
        }
        //認証がまだ
        else {
          try {
            user.sendEmailVerification();
          } catch (e) {}
        }
      });
      return () => customDebugPrint('dispose!');
    }, []);

    return Scaffold(
      appBar: AppBar(title: const Text('メールアドレス確認')),
      body: Container(
        color: Colors.grey[400],
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'メールアドレスがまだ認証されておりません。　メールを確認してください。',
              style: TextStyle(fontSize: 16.0.sp),
            ),
            SizedBox(height: 70.h),
            ElevatedButton(
              onPressed: () async {
                final user = FirebaseAuth.instance.currentUser!;
                await user.reload();
                if (user.emailVerified) {
                  await Fluttertoast.showToast(msg: 'メールアドレスの認証を完了しました。');
                  final user = FirebaseAuth.instance.currentUser!;
                  context.router.popUntilRoot();
                  context.router.replaceNamed('/profileCreate');
                } else {
                  Fluttertoast.showToast(msg: 'まだメール認証が完了していません。メールを確認してください。');
                }
              },
              child: Text('メール認証を確認したらこちら'),
            ),
            SizedBox(height: 30.h),
            TextButton(
              onPressed: () async {
                try {
                  await Fluttertoast.showToast(msg: '認証メールを再送信します。');
                  final user = FirebaseAuth.instance.currentUser!;
                  await user.sendEmailVerification();
                  Fluttertoast.showToast(msg: '認証メールを再送信しました。');
                } catch (e) {
                  Fluttertoast.showToast(
                      msg: '認証メールの再送信に失敗しました。一定時間置いてから再度試してください');
                  return;
                }
              },
              child: Text('認証メールを再送信'),
            ),
          ],
        ),
      ),
    );
  }
}
