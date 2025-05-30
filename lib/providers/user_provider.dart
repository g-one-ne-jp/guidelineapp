// Dart imports:
import 'dart:async';
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:JCSGuidelines/module/firebase/model_firebase_pdf_config.dart';
import 'package:JCSGuidelines/module/firebase/model_firebase_user.dart';
import 'package:JCSGuidelines/repotitory/mixin_repository_file.dart';
import 'package:JCSGuidelines/repotitory/mixin_repository_firestorage.dart';
import 'package:JCSGuidelines/repotitory/mixin_repository_http.dart';

// StateNotifierクラスを外部ファイルで呼び出すプロバイダー.
final userProvider = StateNotifierProvider<ProviderUser, ModelFirebaseUser>(
    (ref) => ProviderUser());

class ProviderUser extends StateNotifier<ModelFirebaseUser>
    with RepositoryHttp, RepositoryFile, RepositoryFireStorage {
  // コンストラクタ内での初期状態を設定し、非同期にデータをロードします。
  ProviderUser() : super(ModelFirebaseUser()) {
    _initializeUserData();
  }

  var user = FirebaseAuth.instance.currentUser!; // 認証済みユーザーを取得
  final firestore = FirebaseFirestore.instance;
  var userData = ModelFirebaseUser();
  var selectedData = ModelFirebaseUser();

  Future<void> _initializeUserData() async {
    user = FirebaseAuth.instance.currentUser!;
    userData =
        await readUser<ModelFirebaseUser>(fromJson: ModelFirebaseUser.fromJson);

    state = userData;
  }

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
      user = FirebaseAuth.instance.currentUser!;

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

  Future<ModelFirebasePdfConfig> readTocsJson() async {
    try {
      final file = await downLoadData(
          path: 'gidline/json/gidline.json', isNewUpdate: true);
      // fileをMapに変換
      final json = jsonDecode(file!.readAsStringSync());
      final result = ModelFirebasePdfConfig.fromJson(json);
      return result;
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
      userData = updateData;
      state = userData;
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
      userData = updateData;
      state = userData;
      return true;
    } catch (e) {
      return false;
    }
  }

  // ブックマークの状態を取得
  bool getBookmarkState({required String key}) {
    return userData.bookmarks[key] ?? false;
  }

  // メモデータを更新する
  Future<bool> updateMemo({
    required String key,
    required String memo,
  }) async {
    //ユーザーデータ更新
    userData =
        await readUser<ModelFirebaseUser>(fromJson: ModelFirebaseUser.fromJson);
    //ユーザーデータの更新
    final updateData = userData.copyWith(
      memos: {
        ...userData.memos,
        key: memo,
      },
    );
    //更新実行
    try {
      await writeUser(data: updateData.toJson());
      userData = updateData;
      state = userData;
      return true;
    } catch (e) {
      return false;
    }
  }

// メモデータを取得する
  List<dynamic> getMemo({required String key}) {
    final txt = userData.memos[key] ?? '[]'; // デフォルト値を空のJSON配列に設定
    final json = jsonDecode(txt);
    final result = json as List<dynamic>;
    return result;
  }
}
