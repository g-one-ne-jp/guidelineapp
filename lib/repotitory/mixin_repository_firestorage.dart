import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/debug/debug_print.dart';
import 'package:flutter_template/module/firebase/model_firebase_pdf_config.dart';
import 'package:flutter_template/module/firebase/model_firebase_user.dart';
import 'package:path_provider/path_provider.dart';

mixin RepositoryFireStorage {
  // ファイルをダウンロードする
  Future<File> downLoadData({
    required String path,
  }) async {
    final islandRef = FirebaseStorage.instance.ref().child(path);

    final appDocDir = await getApplicationCacheDirectory();
    final fileDire = "${appDocDir.path}/pdf/";
    final fileName = path.split('/').last;
    final filePath = "$fileDire$fileName";
    final file = File(filePath);

    // ローカルにファイルが存在する場合は、ダウンロードせずに true を返す
    if (await file.exists()) {
      debugPrint('ファイルは既に存在します: $filePath');
      return file;
    }

    try {
      // ディレクトリが存在しない場合は作成
      await Directory(fileDire).create(recursive: true);

      final downloadTask = islandRef.writeToFile(file);

      debugPrint('ファイルのダウンロードが完了しました: $filePath');
      return file;
    } on FirebaseException catch (e) {
      debugPrint('ファイルのダウンロード中にエラーが発生しました: ${e.message}');
      rethrow;
    }
  }

  // ファイルをアップロードする
  Future<void> uploadData({
    required String path, // Storageに保存するパス
    required File file, // アップロードするファイル
  }) async {
    try {
      final storageRef = FirebaseStorage.instance.ref().child(path);

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
}
