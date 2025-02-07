// Dart imports:
import 'dart:async';
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';

mixin RepositoryFireStorage {
  // ファイルをダウンロードする
  Future<File> downLoadData({
    required String path,
    bool isNewUpdate = false,
  }) async {
    final user = FirebaseAuth.instance.currentUser!; // 認証済みユーザーを取得
    var islandRef = FirebaseStorage.instance.ref().child(path);
    final appDocDir = await getApplicationCacheDirectory();
    final fileDire = "${appDocDir.path}/${user.uid}/";
    final fileName = path.split('/').last;
    final filePath = "$fileDire$fileName";
    final file = File(filePath);

    //user/uid/ファイル名にファイルが存在する場合はそちらを使う
    if (await _fileExists(filePath) && await file.exists()) {
      debugPrint('編集済みファイルは既に存在します: ${_getLastTwoPartsOfPath(filePath)}');
      if (!isNewUpdate) {
        islandRef = FirebaseStorage.instance
            .ref()
            .child(_getLastTwoPartsOfPath(filePath));
      }
      final fileLastModified = await file.lastModified();
      final storageMetadata = await islandRef.getMetadata();
      final storageLastModified = storageMetadata.updated;

      // Storage 上のファイルが更新されている場合のみダウンロード
      if (storageLastModified!.isAfter(fileLastModified)) {
        debugPrint('ファイルが更新されています: $filePath');
        await islandRef.writeToFile(file);
      }
    }
    if (isNewUpdate && await file.exists()) {
      debugPrint('ファイルが更新されています: $filePath');
      await islandRef.writeToFile(file);
    }
    // ローカルにファイルが存在する場合は、ダウンロードせずに true を返す
    if (await file.exists()) {
      debugPrint('新規ファイルは既に存在します: $filePath');
      return file;
    }
    try {
      // ディレクトリが存在しない場合は作成
      await Directory(fileDire).create(recursive: true);
      await islandRef.writeToFile(file);
      debugPrint('ファイルのダウンロードが完了しました: $filePath');
      return file;
    } on FirebaseException catch (e) {
      debugPrint('ファイルのダウンロード中にエラーが発生しました: ${e.message}');
      Fluttertoast.showToast(
        msg: 'ファイルのダウンロード中にエラーが発生しました  path:$path',
      );
      rethrow;
    }
  }
/*
  Future<File> downLoadData({
    required String path,
  }) async {
    final user = FirebaseAuth.instance.currentUser!; // 認証済みユーザーを取得
    var islandRef = FirebaseStorage.instance.ref().child(path);
    final appDocDir = await getApplicationCacheDirectory();
    final fileDire = "${appDocDir.path}/${user.uid}/";
    final fileName = path.split('/').last;
    final filePath = "$fileDire$fileName";
    final file = File(filePath);

    //user/uid/ファイル名にファイルが存在する場合はそちらを使う
    if (await _fileExists(filePath)) {
      debugPrint('編集済みファイルは既に存在します: ${_getLastTwoPartsOfPath(filePath)}');
      islandRef = FirebaseStorage.instance
          .ref()
          .child(_getLastTwoPartsOfPath(filePath));
      final fileLastModified = await file.lastModified();
      final storageMetadata = await islandRef.getMetadata();
      final storageLastModified = storageMetadata.updated;

      // Storage 上のファイルが更新されている場合のみダウンロード
      if (storageLastModified!.isAfter(fileLastModified)) {
        debugPrint('ファイルが更新されています: $filePath');
        await islandRef.writeToFile(file);
      }
    }
    // ローカルにファイルが存在する場合は、ダウンロードせずに true を返す
    if (await file.exists()) {
      debugPrint('新規ファイルは既に存在します: $filePath');
      return file;
    }

    try {
      // ディレクトリが存在しない場合は作成
      await Directory(fileDire).create(recursive: true);
      await islandRef.writeToFile(file);
      debugPrint('ファイルのダウンロードが完了しました: $filePath');
      return file;
    } on FirebaseException catch (e) {
      debugPrint('ファイルのダウンロード中にエラーが発生しました: ${e.message}');
      rethrow;
    }
  }
*/

  // ファイルをアップロードする
  Future<void> uploadData({
    required String path, // Storageに保存するパス
    required File file, // アップロードするファイル
  }) async {
    try {
      // 取り出した要素を/で結合して新しいパスを作成
      final storageRef =
          FirebaseStorage.instance.ref().child(_getLastTwoPartsOfPath(path));

      // ファイルをアップロード
      final uploadTask = storageRef.putFile(file);

      // アップロードの進捗状況を監視
      uploadTask.snapshotEvents.listen((taskSnapshot) {
        switch (taskSnapshot.state) {
          case TaskState.running:
            debugPrint('アップロード中...');
            final progress = 100.0 *
                (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
            debugPrint('進捗: $progress%');
            break;
          case TaskState.paused:
            debugPrint('アップロードが一時停止されました');
            break;
          case TaskState.success:
            debugPrint('アップロードが完了しました');
            break;
          case TaskState.canceled:
            debugPrint('アップロードがキャンセルされました');
            break;
          case TaskState.error:
            debugPrint('アップロード中にエラーが発生しました');
            break;
        }
      });

      // アップロードが完了するまで待つ
      await uploadTask;
      debugPrint('ファイルがアップロードされました: $path');
    } on FirebaseException catch (e) {
      debugPrint('ファイルのアップロードに失敗しました: ${e.message}');
    }
  }

  //
  Future<bool> _fileExists(String path) async {
    try {
      final storageRef =
          FirebaseStorage.instance.ref().child(_getLastTwoPartsOfPath(path));
      await storageRef.getMetadata();
      return true; // ファイルが存在する
    } on FirebaseException catch (e) {
      if (e.code == 'object-not-found') {
        return false; // ファイルが存在しない
      } else {
        rethrow; // その他のエラーは再スロー
      }
    }
  }

  String _getLastTwoPartsOfPath(String path) {
    // パスを / で分割してリストに変換
    final parts = path.split('/');
    // リストの末尾2つの要素を取り出す
    final lastTwoParts = parts.sublist(parts.length - 2);
    // 取り出した要素を / で結合して新しいパスを作成
    return 'user/${lastTwoParts.join('/')}';
  }
}
