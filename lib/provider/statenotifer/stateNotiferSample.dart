// @riverpod アノテーションは `riverpod_annotation` をインポートして使います
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

part 'stateNotiferSample.g.dart';

@riverpod
class Count extends _$Count {
  @override
  int build() => 0;

  void increase() => state++;
}
