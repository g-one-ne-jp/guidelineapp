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
class UiPageSingup extends HookConsumerWidget {
  const UiPageSingup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _email = useState('');
    final _password = useState('');

    useEffect(() {}, []);

    return Scaffold(
      appBar: AppBar(title: const Text('JCSガイドラインアプリ')),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //
                const Center(
                  child: Text(
                    'ご利用にはアカウント登録が必要です',
                  ),
                ),
                //Email入力欄
                Padding(
                  padding: EdgeInsets.all(10.0.w),
                  child: TextField(
                    controller: TextEditingController(text: _email.value),
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: const TextStyle(
                          color: Colors.grey), // hintの文字色をグレーに設定
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0.r), // 角丸の半径を指定
                      ),
                      filled: true,
                      fillColor: Colors.grey[100], // 背景色を指定
                    ),
                    onSubmitted: (String value) {
                      _email.value = value;
                    },
                  ),
                ),
                //パスワード入力欄
                Padding(
                  padding: EdgeInsets.all(10.0.w),
                  child: TextField(
                    controller: TextEditingController(text: _password.value),
                    decoration: InputDecoration(
                      hintText: 'パスワード',
                      hintStyle: const TextStyle(
                          color: Colors.grey), // hintの文字色をグレーに設定
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0.r), // 角丸の半径を指定
                      ),

                      filled: true,
                      fillColor: Colors.grey[100], // 背景色を指定
                    ),
                    obscureText: true,
                    onSubmitted: (String value) {
                      _password.value;
                    },
                  ),
                ),
                //
                SizedBox(
                  height: 16.0.h,
                ),
                //アカウント作成
                Container(
                  padding: EdgeInsets.all(10.0.w),
                  // 横幅いっぱいにする
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        //タップされたらプログレスを表示
                        uiUtilshowProgress(context);

                        //アカウント作成
                        if (await utilAuthSingup(
                            email: _email.value, password: _password.value)) {
                          // ignore: use_build_context_synchronously
                          context.router.pushNamed('/profileCreate');
                        }
                        //ログイン失敗
                        else {
                          await Fluttertoast.showToast(
                            msg: 'すでにアカウントがあるのかもしれません。',
                          );
                        }
                        uiUtilhideProgress(context);
                      } catch (e) {
                        uiUtilhideProgress(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0.r),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 15.h),
                    ),
                    child: Text('アカウント作成'),
                  ),
                ),
                //
                SizedBox(
                  height: 16.0.h,
                ),
                //アカウントを持ってるボタン
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () async {
                    context.router.popUntilRoot();
                  },
                  child: const Text('アカウントをお持ちの方はこちら'),
                ),

                // Goolgwサインインボタン
                Container(
                  padding: EdgeInsets.all(10.0.w),
                  // 横幅いっぱいにする
                  width: double.infinity,
                  child: FittedBox(
                    child: SignInButton(
                      Buttons.Google,
                      text: "Googleでログイン",
                      onPressed: () async {
                        //タップされたらプログレスを表示
                        uiUtilshowProgress(context);
                        if (await utilGoogleSignin()) {
                          // ignore: use_build_context_synchronously
                          context.router.pushNamed('/profileCreate');
                        } else {
                          await Fluttertoast.showToast(
                            msg: 'Googleサインインに失敗しました',
                          );
                        }
                        uiUtilhideProgress(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
