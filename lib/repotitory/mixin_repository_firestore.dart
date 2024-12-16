// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Project imports:
import 'package:JCSGuidelines/module/firebase/model_firebase_pdf_config.dart';
import 'package:JCSGuidelines/module/firebase/model_firebase_user.dart';

mixin RepositoryFireStore2 {
  final user = FirebaseAuth.instance.currentUser!; // 認証済みユーザーを取得
  final firestore = FirebaseFirestore.instance;
  var userData = ModelFirebaseUser();
  var selectedData = MajorCategory();

  Future<bool> writeUser({
    required Map<String, dynamic> data,
  }) async {
    try {
      await firestore.collection('users').doc(user.uid).set(data);
      return true;
    } catch (e) {
      debugPrint('Firestoreへの書き込みエラー: $e');
      return false;
    }
  }

  Future<T> readUser<T extends Object>({
    required T Function(Map<String, dynamic> json) fromJson,
  }) async {
    try {
      final doc = await firestore.collection('users').doc(user.uid).get();
      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        return fromJson(data);
      } else {
        debugPrint('ドキュメントが存在しない場合:');
        return fromJson({}); // ドキュメントが存在しない場合
      }
    } catch (e) {
      debugPrint('Firestoreからの読み込みエラー: $e');
      return fromJson({});
    }
  }

  Future<ModelFirebasePdfConfig> readTocs() async {
    try {
      final collectionRef = firestore.collection('guideline_data');
      final querySnapshot = await collectionRef.get();
      final documentsMap = querySnapshot.docs.fold<Map<String, dynamic>>(
        {},
        (map, doc) => map..[doc.id] = doc.data(),
      );
      return ModelFirebasePdfConfig.fromJson({'categories': documentsMap});
    } catch (e) {
      print('Firestoreからの読み込みエラー: $e');
      return ModelFirebasePdfConfig.fromJson({});
    }
  }

  Future<bool> updateUserProfile({
    required String gender,
    required String age,
    required String occupation,
    required String specialty,
    required String number,
    required bool ismailmagazine,
  }) async {
    //ユーザーデータ更新
    userData =
        await readUser<ModelFirebaseUser>(fromJson: ModelFirebaseUser.fromJson);
    //ユーザーデータの更新
    final updateData = userData.copyWith(
      gender: gender,
      age: age,
      occupation: occupation,
      specialty: specialty,
      number: number,
      ismailmagazine: ismailmagazine,
    );
    //更新実行
    try {
      await writeUser(data: updateData.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  // ブックマークの状態を更新
  Future<bool> updateBookmark({
    required String key,
    required bool isBookmark,
  }) async {
    //ユーザーデータ更新
    userData =
        await readUser<ModelFirebaseUser>(fromJson: ModelFirebaseUser.fromJson);
    //ユーザーデータの更新
    final updateData = userData.copyWith(
      bookmarks: {
        ...userData.bookmarks,
        key: isBookmark,
      },
    );
    //更新実行
    try {
      await writeUser(data: updateData.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  // ブックマークの状態を取得
  bool getBookmarkState(String key) {
    return userData.bookmarks[key] ?? false;
  }
}
