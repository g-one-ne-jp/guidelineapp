// Dart imports:
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

// Package imports:
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin RepositoryFile {
  /// プリファレンスをロードするためのメソッドです。
  ///
  /// [fileName]にはロードするプリファレンスのファイル名を指定します。
  /// [isSecure]はセキュアなプリファレンスを使用するかどうかを指定します。デフォルトはtrueです。
  ///
  /// ロードしたプリファレンスの内容をMap<String, dynamic>の形式で返します。
  Future<Map<String, dynamic>> loadPreferences({
    required String fileName,
    bool isSecure = true,
  }) async {
    if (isSecure) {
      const storage = FlutterSecureStorage(
          aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ));
      final jsonText = await storage.read(key: fileName);
      if (jsonText == null || jsonText.isEmpty) {
        return {};
      }
      var result = json.decode(jsonText) as Map<String, dynamic>;
      return result;
    } else {
      final pref = await SharedPreferences.getInstance();
      final jsonText = pref.getString(fileName);
      if (jsonText == null || jsonText.isEmpty) {
        return {};
      }
      var result = json.decode(jsonText) as Map<String, dynamic>;
      return result;
    }
  }

  /// プリファレンスを保存するメソッドです。
  ///
  /// [fileName] は保存するファイル名です。
  /// [jsonMap] は保存するデータのJSONマップです。
  /// [isSecure] はデータを安全に保存するかどうかを示すフラグです。デフォルト値はtrueです。
  ///
  /// 安全な保存を行う場合、[FlutterSecureStorage]を使用してデータを暗号化して保存します。
  /// 安全な保存を行わない場合、[SharedPreferences]を使用してデータを保存します。
  Future<void> savePreferences({
    required String fileName,
    required dynamic jsonMap,
    bool isSecure = true,
  }) async {
    if (isSecure) {
      const storage = FlutterSecureStorage(
          aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ));
      await storage.write(key: fileName, value: json.encode(jsonMap));
    } else {
      final pref = await SharedPreferences.getInstance();
      pref.setString(fileName, json.encode(jsonMap));
    }
  }

  /// プリファレンスを削除するメソッドです。
  ///
  /// [fileName]には削除するプリファレンスのファイル名を指定します。
  /// [isSecure]がtrueの場合、セキュアな削除が行われます。
  /// セキュアな削除にはFlutterSecureStorageが使用されます。
  /// [isSecure]がfalseの場合、SharedPreferencesが使用されます。
  ///
  /// 例外が発生しない場合、処理が完了するまで非同期に実行されます。
  Future<void> removePreferences({
    required String fileName,
    bool isSecure = true,
  }) async {
    if (isSecure) {
      const storage = FlutterSecureStorage(
          aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ));
      await storage.delete(key: fileName);
      return;
    } else {
      final pref = await SharedPreferences.getInstance();
      pref.setString(fileName, '');
    }
  }

  /// バイナリデータを指定されたファイル名で保存します。
  ///
  /// [bytes] は保存するバイナリデータです。
  /// [fileName] は保存するファイルの名前です。
  ///
  /// 保存されたファイルのパスを返します。
  Future<String> saveRawFile({
    required Uint8List bytes,
    required String fileName,
  }) async {
    String path = await getFilePath(fileName: fileName);
    File file = File(path);
    await file.writeAsBytes(bytes);
    return path;
  }

  /// JSONマップを指定されたファイル名で保存します。
  ///
  /// [jsonMap] - 保存するJSONマップ
  /// [fileName] - 保存するファイルの名前
  ///
  /// 保存されたファイルのパスを返します。
  Future<String> saveJsonFile({
    required dynamic jsonMap,
    required String fileName,
  }) async {
    String path = await getFilePath(fileName: fileName); // ファイルパスの取得
    File file = File(path);
    await file.writeAsString(json.encode(jsonMap)); // 文字列としてファイルに書き込む
    return path; // ファイルパスを返す
  }

  /// ファイルパスを取得するための非同期関数です。
  ///
  /// [fileName]には取得したいファイルの名前を指定します。
  /// ファイルパスは一時ディレクトリ内に作成され、そのパスが返されます。
  Future<String> getFilePath({
    required String fileName,
  }) async {
    Directory appDocumentsDirectory = await getTemporaryDirectory();
    String appDocumentsPath = appDocumentsDirectory.path;
    String filePath = '$appDocumentsPath/$fileName';
    return filePath;
  }

  /// 指定されたファイル名の生のファイルを読み込みます。
  ///
  /// [fileName] - 読み込むファイルの名前
  ///
  /// 返り値 - 読み込まれたファイルのバイトデータ
  Future<Uint8List> loadRawFile({
    required String fileName,
  }) async {
    String path = await getFilePath(fileName: fileName);
    File file = File(path);
    Uint8List contents = await file.readAsBytes();
    return contents;
  }

  /// 指定されたファイル名の JSON ファイルを読み込み、Map<String, dynamic> 形式で返します。
  ///
  /// [fileName] - 読み込むファイルの名前
  ///
  /// ファイルが存在しない場合や内容が空の場合は、空の Map を返します。
  Future<Map<String, dynamic>> loadJsonFile({
    required String fileName,
  }) async {
    String path = await getFilePath(fileName: fileName); // ファイルパスの取得
    File file = File(path);
    if (!await file.exists()) {
      return {};
    }
    String contents = await file.readAsString(); // 文字列としてファイルを読み込む
    if (contents.isEmpty) {
      return {};
    }
    Map<String, dynamic> json = jsonDecode(contents); // JSON 文字列を Map に変換
    return json; // 変換した Map を返す
  }

  /// 指定されたファイル名のファイルを削除します。
  ///
  /// [fileName] - 削除するファイルの名前
  ///
  /// 例外:
  /// - [FileSystemException] - ファイルの削除に失敗した場合にスローされます。
  Future<void> removeRawFile({required String fileName}) async {
    String path = await getFilePath(fileName: fileName);
    File file = File(path);

    await file.delete();
  }
}
