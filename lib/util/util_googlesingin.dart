import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

//Googleサインイン
Future<bool> utilGoogleSignin() async {
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
    if (userCredential.additionalUserInfo!.isNewUser) {
      //新規ユーザーの場合の処理
      return true;
    } else {
      //既存ユーザーの場合の処理
      return true;
    }
  } catch (e) {
    return false;
  }
}

//メール/パスワードでアカウント作成
Future<bool> utilAuthSingup({
  required String email,
  required String password,
}) async {
  try {
    final result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    //ログイン成功
    if (result.user != null) {
      debugPrint("ログインしました　${result.user!.email} , ${result.user!.uid}");
      return true;
    }
    //ログイン失敗ws
    else {
      return false;
    }
  } catch (e) {
    return false;
  }
}

//メール/パスワードでログイン
Future<bool> utilAuthLogin({
  required String email,
  required String password,
}) async {
  try {
    // メール/パスワードでログイン
    final User? user = (await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password))
        .user;
    //ログイン成功
    if (user != null) {
      debugPrint("ログインしました　${user.email} , ${user.uid}");
      return true;
    }
    //ログイン失敗ws
    else {
      return false;
    }
  } catch (e) {
    return false;
  }
}

//パスワードリセット
Future<bool> uitlAuthPasswordReset({
  required String email,
}) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    return true;
  } catch (e) {
    return false;
  }
}
