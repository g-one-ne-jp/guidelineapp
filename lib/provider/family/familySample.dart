// @riverpod アノテーションは `riverpod_annotation` をインポートして使います
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

// コード生成を実行するために、 `part '{ファイル名}.g.dart';` を忘れずに書きましょう
part 'familySample.g.dart';

@riverpod
Future<List<int>> test(
  TestRef ref, {
  // メソッド名+Refの引数型が必要です
  required String category, // 任意の数のパラメータを定義できます
  int limit = 50, // デフォルト値も使用可能
}) async {
  final dio = Dio(BaseOptions(baseUrl: 'https://api.example.com'));
  final response = await dio.get('/bookmarks?category=$category&limit=$limit');
  final json = response.data! as List;
  return [];
}
