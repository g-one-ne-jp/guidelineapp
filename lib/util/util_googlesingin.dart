// Flutter imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Project imports:
import 'package:JCSGuidelines/ui/util/uiUtilDialog.dart';

//Googleサインイン
Future<String> utilGoogleSignin({required BuildContext context}) async {
  //タップされたらプログレスを表示
  uiUtilshowProgress(context);

  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    //サインイン実行
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    uiUtilhideProgress(context);
    if (userCredential.additionalUserInfo!.isNewUser) {
      //新規ユーザーの場合の処理
      return '';
    } else {
      //既存ユーザーの場合の処理
      return '';
    }
  } catch (e) {
    uiUtilhideProgress(context);
    return _errorCoce(e: e as FirebaseAuthException);
  }
}

//メール/パスワードでアカウント作成aa
Future<String> utilAuthSignup(
    {required String email,
    required String password,
    required BuildContext context}) async {
  //タップされたらプログレスを表示
  uiUtilshowProgress(context);
  try {
    if (email.isEmpty) {
      uiUtilhideProgress(context);
      return 'メールアドレスを入力してください。';
    }
    if (password.isEmpty) {
      uiUtilhideProgress(context);
      return 'パスワードを入力してください。';
    }
    if (!RegExp(
            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#+^()-])[A-Za-z\d@$!%*?&#+^()-]{8,}$')
        .hasMatch(password)) {
      uiUtilhideProgress(context);
      return 'パスワードは大文字小文字英字、数字、記号の組み合わせで8文字以上にしてください。';
    }

    final result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    uiUtilhideProgress(context);
    if (result.user != null) {
      debugPrint("ログインしました　${result.user!.email} , ${result.user!.uid}");
      return '';
    } else {
      //ログイン失敗
      return '';
    }
  } catch (e) {
    uiUtilhideProgress(context);
    return _errorCoce(e: e as FirebaseAuthException);
  }
}

//メール/パスワードでログイン
Future<String> utilAuthLogin(
    {required String email,
    required String password,
    required BuildContext context}) async {
  //タップされたらプログレスを表示
  uiUtilshowProgress(context);
  if (email.isEmpty) {
    uiUtilhideProgress(context);
    return 'メールアドレスを入力してください。';
  }
  if (password.isEmpty) {
    uiUtilhideProgress(context);
    return 'パスワードを入力してください。';
  }
  if (!RegExp(
          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#+^()-])[A-Za-z\d@$!%*?&#+^()-]{8,}$')
      .hasMatch(password)) {
    uiUtilhideProgress(context);
    return 'パスワードは大文字小文字英字、数字、記号の組み合わせで8文字以上にしてください。';
  }
  try {
    // メール/パスワードでログイン
    final User? user = (await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password))
        .user;
    uiUtilhideProgress(context);
    //ログイン成功
    if (user != null) {
      debugPrint("ログインしました　${user.email} , ${user.uid}");
      return '';
    } else {
      //ログイン失敗
      return 'ログインに失敗しました。';
    }
  } catch (e) {
    uiUtilhideProgress(context);
    return _errorCoce(e: e as FirebaseAuthException);
  }
}

//
String _errorCoce({FirebaseAuthException? e}) {
  if (e != null) {
    switch (e.code) {
      case 'account-exists-with-different-credential':
        return 'このアカウントは既に存在します。';
      case 'invalid-credential':
        return 'アカウントが見つかりませんでした。アカウントをお持ちでない場合は、アカウントの登録をお願いします';
      case 'operation-not-allowed':
        return 'この操作は許可されていません。';
      case 'user-disabled':
        return 'このユーザーは無効になっています。';
      case 'user-not-found':
        return 'アカウントが見つかりませんでした。アカウントをお持ちでない場合は、アカウントの登録をお願いします。';
      case 'wrong-password':
        return 'パスワードが間違っています。';
      case 'email-already-in-use':
        return 'このメールアドレスは登録済みです。';
      case 'invalid-email':
        return '無効なメールアドレスです。';
      case 'weak-password':
        return 'パスワードは大文字小文字英字、数字、記号の組み合わせで8文字以上にしてください。';
      case 'unknown':
        if (e.message! ==
            '[Password must contain a non-alphanumeric character]') {
          return 'パスワードで使用できない特殊文字が含まれております。 使用できる特殊文字はこちらになります。" ^ \$ * . [ ] { } ( ) ? " ! @ # % & / \\ , > < \' : ; | _ ~ ` " ';
        }

        return '不明なエラーが発生しました。';
      default:
        return '不明なエラーが発生しました。';
    }
  } else {
    // その他の例外の場合の処理
    return 'エラーが発生しました。';
  }
}

//ログアウト
Future<bool> utilAuthLogout() async {
  try {
    await FirebaseAuth.instance.signOut();
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> utilAuthDeleteAccountWithReauth(BuildContext context) async {
  // テキストフィールドのコントローラ
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // 現在のユーザーを取得
  User? user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    print("ユーザーがログインしていません");
    return false;
  }

  // ユーザーがGoogleでログインしているかどうかを確認
  bool isGoogleUser =
      user.providerData.any((info) => info.providerId == 'google.com');

  if (isGoogleUser) {
    // Googleログインの場合の再認証と削除
    return await _handleGoogleReauthAndDelete(context, user);
  } else {
    // メール/パスワードの場合のダイアログ表示
    bool? dialogResult = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('アカウント削除'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 12),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'メールアドレス',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 12),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'パスワード',
                ),
                obscureText: true,
              ),
              SizedBox(height: 12),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // キャンセル
              },
              child: const Text('キャンセル'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // 確認
              },
              child: const Text('削除'),
            ),
          ],
        );
      },
    );

    // ダイアログがキャンセルされた場合
    if (dialogResult == null || !dialogResult) {
      print("削除がキャンセルされました");
      return false;
    }

    // ユーザー入力値を取得
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    try {
      // 再認証のためのクレデンシャルを作成
      AuthCredential credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );

      // 再認証を実行
      await user.reauthenticateWithCredential(credential);

      print("ユーザーデータを削除");
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .delete();
      // 再認証が成功したらアカウントを削除
      await user.delete();
      print("アカウントが正常に削除されました");
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      print("エラー: $e");
      await Fluttertoast.showToast(
        msg: 'メールアドレスまたはパスワードが正しくありません',
      );
      return false;
    } finally {
      // コントローラを破棄
      emailController.dispose();
      passwordController.dispose();
    }
  }
}

// Google再認証とアカウント削除の処理
Future<bool> _handleGoogleReauthAndDelete(
    BuildContext context, User user) async {
  try {
    // Google Sign-Inで再認証
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      print("Googleログインがキャンセルされました");
      return false;
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // 再認証を実行
    await user.reauthenticateWithCredential(credential);
    print("ユーザーデータを削除");
    await FirebaseFirestore.instance.collection('users').doc(user.uid).delete();
    // 再認証が成功したらアカウントを削除
    await user.delete();
    print("Googleアカウントが正常に削除されました");
    await FirebaseAuth.instance.signOut();
    return true;
  } catch (e) {
    print("Google再認証エラー: $e");
    return false;
  }
}

//パスワードリセット
Future<String> uitlAuthEmeailPasswordReset(
    {required String email, required BuildContext context}) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    return 'パスワードリセット確認メールを送信しました。';
  } catch (e) {
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'invalid-email':
          return '無効なメールアドレスです。';
        case 'user-not-found':
          return '入力したメールアドレスは登録されていません';
        default:
          return 'パスワードリセットに失敗しました: ${e.message}';
      }
    } else {
      return 'パスワードリセットに失敗しました: $e';
    }
  }
}

//パスワードリセット
Future<String> uitlAuthLoggedInPasswordReset(
    {required BuildContext context}) async {
  //タップされたらプログレスを表示
  uiUtilshowProgress(context);

  try {
    final email = FirebaseAuth.instance.currentUser?.email;
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email!);
    uiUtilhideProgress(context);
    return 'パスワードリセット確認メールを送信しました。';
  } catch (e) {
    uiUtilhideProgress(context);

    return _errorCoce(e: e as FirebaseAuthException);
  }
}

// アカウント登録されていないかを判定
Future<bool> utilAuthIsAccountNotRegistered(String email) async {
  var a = 0;
  try {
    final methods =
        await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
    return methods.isEmpty;
  } catch (e) {
    return false;
  }
}

//ログインタイプ(パスワードログインかどうか)
bool utilAuthIsLoginTypePassWord() {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    for (final provider in user.providerData) {
      if (provider.providerId == 'password') {
        return true;
      }
    }
  }
  // その他のSNSログインも同様
  return false;
}

//ログインタイプ(Goolgeかどうか)
bool utilAuthIsLoginTypeGoogle() {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    for (final provider in user.providerData) {
      if (provider.providerId == 'google.com') {
        return true;
      }
    }
  }
  // その他のSNSログインも同様
  return false;
}
