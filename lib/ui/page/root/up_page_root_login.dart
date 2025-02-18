// ignore_for_file: no_leading_underscores_for_local_identifiers

// Dart imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:JCSGuidelines/util/util_googlesingin.dart';

@RoutePage()
class UiPageLogin extends HookConsumerWidget {
  const UiPageLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _emailController = useState(useTextEditingController());
    final _passwordController = useState(useTextEditingController());
    final _isPasswordVisible = useState(false);

    useEffect(() {
      return null;
    }, []);

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
                    decoration: const InputDecoration(
                      hintText: 'Email',
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
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          _isPasswordVisible.value = !_isPasswordVisible.value;
                        },
                      ),
                    ),
                    obscureText: !_isPasswordVisible.value,
                    onSubmitted: (String value) {},
                  ),
                ),

                Container(
                  height: 180.0.h,
                ),
                //ログインボタン
                Container(
                  padding: EdgeInsets.all(10.0.w),
                  // 横幅いっぱいにする
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      //アカウント作成
                      utilAuthLogin(
                              email: _emailController.value.text,
                              password: _passwordController.value.text,
                              context: context)
                          .then((onValue) async {
                        if (onValue.isNotEmpty) {
                          // ignore: use_build_context_synchronously
                          context.router.popUntilRoot();
                          context.router.replaceNamed('/home');
                        } else {
                          // ignore: use_build_context_synchronously
                          context.router.pushNamed('/profileCreate');
                        }
                        FocusScope.of(context).unfocus();
                      });
                    },
                    child: const Text('ログイン'),
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
                  child: const Text('アカウント登録はこちら'),
                ),
                //パスワードをわすれた場合
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () async {
                    final emailController = TextEditingController();
                    final email = await showDialog<String>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('メールアドレスを入力してください'),
                          content: TextField(
                            controller: emailController,
                            decoration:
                                const InputDecoration(hintText: 'メールアドレス'),
                            autofocus: true, // AlertDialogが表示されたらすぐにfocusを当てる
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('キャンセル'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text('送信'),
                              onPressed: () {
                                Navigator.of(context).pop(emailController.text);
                              },
                            ),
                          ],
                        );
                      },
                    );
                    if (emailController.text.isEmpty) {
                      await Fluttertoast.showToast(
                        msg: 'メールアドレスを入力してください',
                      );
                      return;
                    }

                    const emailPattern = r'^[^@]+@[^@]+\.[^@]+';
                    final regExp = RegExp(emailPattern);

                    if (!regExp.hasMatch(emailController.text)) {
                      await Fluttertoast.showToast(
                        msg: '有効なメールアドレスを入力してください',
                      );
                      return;
                    }
                    if (email != null && email.isNotEmpty) {
                      uitlAuthEmeailPasswordReset(
                        email: email,
                        context: context,
                      ).then((onValue) async {
                        if (onValue.isNotEmpty) {
                          await Fluttertoast.showToast(
                            msg: onValue,
                          );
                        }
                      });
                    }
                  },
                  child: const Text('パスワードを忘れた方'),
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0.r),
                        side: const BorderSide(color: Colors.grey), // 枠線を追加
                      ),
                      elevation: 0, // 影をなくす
                      onPressed: () async {
                        utilGoogleSignin(context: context)
                            .then((onValue) async {
                          if (onValue.isNotEmpty) {
                            await Fluttertoast.showToast(
                              msg: onValue,
                            );
                          } else {
                            // ignore: use_build_context_synchronously
                            context.router.popUntilRoot();
                            context.router.replaceNamed('/home');
                          }
                        });
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
