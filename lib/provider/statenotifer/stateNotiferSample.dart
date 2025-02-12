// @riverpod アノテーションは `riverpod_annotation` をインポートして使います

// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stateNotiferSample.g.dart';

@riverpod
class Count extends _$Count {
  @override
  int build() => 0;

  void increase() => state++;
}
