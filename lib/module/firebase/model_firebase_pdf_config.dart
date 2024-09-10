// ignore_for_file: file_names
import 'package:freezed_annotation/freezed_annotation.dart';

// ジェネレートされたクラスからUserクラスのprivateメンバ変数にアクセスするため
part 'model_firebase_pdf_config.freezed.dart';
part 'model_firebase_pdf_config.g.dart';

@freezed
abstract class ModelFirebasePdfConfig with _$ModelFirebasePdfConfig {
  factory ModelFirebasePdfConfig({
    @Default({}) Map<String, MajorCategory> categories,
  }) = _ModelFirebasePdfConfig;

  factory ModelFirebasePdfConfig.fromJson(Map<String, dynamic> json) =>
      _$ModelFirebasePdfConfigFromJson(json);
}

@freezed
abstract class MajorCategory with _$MajorCategory {
  factory MajorCategory({
    @Default('') String id,
    @Default('') String majorTitle,
    @Default('') String majorSummary,
    @Default({}) Map<String, SubCategory> subs,
  }) = _MajorCategory;

  factory MajorCategory.fromJson(Map<String, dynamic> json) =>
      _$MajorCategoryFromJson(json);
}

@freezed
abstract class SubCategory with _$SubCategory {
  factory SubCategory({
    @Default('') String id,
    @Default('') String subTitle,
    @Default('') String subSummary,
    @Default({}) Map<String, MinorCategory> minors,
  }) = _SubCategory;

  factory SubCategory.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryFromJson(json);
}

@freezed
abstract class MinorCategory with _$MinorCategory {
  factory MinorCategory({
    @Default('') String id,
    @Default('') String minorTitle,
    @Default('') String minorSummary,
    @Default('') String markdown,
    @Default('') String pdfId,
  }) = _MinorCategory;

  factory MinorCategory.fromJson(Map<String, dynamic> json) =>
      _$MinorCategoryFromJson(json);
}
