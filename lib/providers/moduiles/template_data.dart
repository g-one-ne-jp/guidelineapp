// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// ジェネレートされたクラスからUserクラスのprivateメンバ変数にアクセスするため
part 'template_data.freezed.dart';
part 'template_data.g.dart';

@unfreezed
abstract class TemplateData with _$TemplateData {
  factory TemplateData([
    @Default(false) bool isTemplate,
  ]) = _TemplateData;

  factory TemplateData.fromJson(Map<String, dynamic> json) => _$TemplateDataFromJson(json);
}
