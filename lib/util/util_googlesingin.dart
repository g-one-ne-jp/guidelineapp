// Flutter imports:
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
      return ': ${user.email}';
    } else {
      //ログイン失敗
      return 'ログインに失敗しました。';
    }
  } catch (e) {
    uiUtilhideProgress(context);
    return _errorCoce(e: e as FirebaseAuthException);
  }
}

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
