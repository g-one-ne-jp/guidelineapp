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
class UiPageLogin extends HookConsumerWidget {
  const UiPageLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _emailController = useState(useTextEditingController());
    final _passwordController = useState(useTextEditingController());
    useEffect(() {}, []);

    return Scaffold(
      appBar: AppBar(title: const Text('ログイン')),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Email入力欄
                Padding(
                  padding: EdgeInsets.all(10.0.w),
                  child: TextField(
                    controller: _emailController.value,
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
                  ),
                ),
                //パスワード入力欄
                Padding(
                  padding: EdgeInsets.all(10.0.w),
                  child: TextField(
                    controller: _passwordController.value,
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
                  ),
                ),
                //
                SizedBox(
                  height: 16.0.h,
                ),
                //ログインボタン
                Container(
                  padding: EdgeInsets.all(10.0.w),
                  // 横幅いっぱいにする
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      //タップされたらプログレスを表示
                      uiUtilshowProgress(context);
                      //ログイン実行
                      if (await utilAuthLogin(
                          email: _emailController.value.text,
                          password: _passwordController.value.text)) {
                        // ignore: use_build_context_synchronously
                        context.router.popUntilRoot();
                        context.router.replaceNamed('/home');
                      } else {
                        await Fluttertoast.showToast(
                          msg: 'ログインに失敗しました。',
                        );
                      }
                      uiUtilhideProgress(context);
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
                    child: Text('ログイン'),
                  ),
                ),
                //
                SizedBox(
                  height: 16.0.h,
                ),
                //アカウント登録ボタン
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () async {
                    context.router.pushNamed('/singup');
                  },
                  child: Text('アカウント登録はこちら'),
                ),
                //パスワードをわすれた場合
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () async {
                    await uitlAuthEmeailPasswordReset(
                        email: _emailController.value.text);
                  },
                  child: Text('パスワードを忘れた方'),
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
                          context.router.popUntilRoot();
                          context.router.replaceNamed('/home');
                        } else {
                          await Fluttertoast.showToast(
                            msg: 'Googleログインに失敗しました',
                          );
                        }
                        //タップされたらプログレスを表示
                        uiUtilshowProgress(context);
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
