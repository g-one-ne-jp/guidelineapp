import 'package:freezed_annotation/freezed_annotation.dart';

// ジェネレートされたクラスからUserクラスのprivateメンバ変数にアクセスするため
part 'app_data.freezed.dart';
part 'app_data.g.dart';

@unfreezed
abstract class AppData with _$AppData {
  factory AppData([
    @Default(false) bool isTemplate,
  ]) = _AppData;

  factory AppData.fromJson(Map<String, dynamic> json) =>
      _$AppDataFromJson(json);
}
