// ignore_for_file: file_names

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// ジェネレートされたクラスからUserクラスのprivateメンバ変数にアクセスするため
part 'model_firebase_pdf_config.freezed.dart';
part 'model_firebase_pdf_config.g.dart';

@freezed
abstract class ModelFirebasePdfConfig with _$ModelFirebasePdfConfig {
  factory ModelFirebasePdfConfig({
    @Default({}) Map<String, MajorCategory> categories,
  }) = _ModelFirebasePdfConfig;

  factory ModelFirebasePdfConfig.fromJson(Map<String, dynamic> json) => _$ModelFirebasePdfConfigFromJson(json);
}

@freezed
abstract class MajorCategory with _$MajorCategory {
  factory MajorCategory({
    @Default('') String majorKey,
    @Default('') String majorTitle,
    @Default('') String majorSummary,
    @Default({}) Map<String, SubCategory> subs,
  }) = _MajorCategory;

  factory MajorCategory.fromJson(Map<String, dynamic> json) => _$MajorCategoryFromJson(json);
}

@freezed
abstract class SubCategory with _$SubCategory {
  factory SubCategory({
    @Default('') String subKey,
    @Default('') String subTitle,
    @Default('') String subSummary,
    @Default({}) Map<String, MinorCategory> minors,
  }) = _SubCategory;

  factory SubCategory.fromJson(Map<String, dynamic> json) => _$SubCategoryFromJson(json);
}

@freezed
abstract class MinorCategory with _$MinorCategory {
  factory MinorCategory({
    @Default('') String minorKey,
    @Default('') String minorTitle,
    @Default('') String minorSummary,
    @Default({}) Map<String, DetailCategory> details,
  }) = _MinorCategory;

  factory MinorCategory.fromJson(Map<String, dynamic> json) => _$MinorCategoryFromJson(json);
}

@freezed
abstract class DetailCategory with _$DetailCategory {
  factory DetailCategory({
    @Default('') String detailKey,
    @Default('') String detailTitle,
    @Default('') String detailSummary,
    @Default({}) Map<String, Content> contents,
  }) = _DeteilCategory;

  factory DetailCategory.fromJson(Map<String, dynamic> json) => _$DetailCategoryFromJson(json);
}

@freezed
abstract class Content with _$Content {
  factory Content({
    @Default('') String contentKey,
    @Default('') String contentTitle,
    @Default({}) Map<String, Settion> settions,
  }) = _Content;

  factory Content.fromJson(Map<String, dynamic> json) => _$ContentFromJson(json);
}

@freezed
abstract class Settion with _$Settion {
  factory Settion({
    @Default('') String settionTitle,
    @Default('') String pdfId,
    @Default('') String searchWord,
    @Default('') String markdown,
    @Default([]) List<String> searchKeywords,
  }) = _Settion;

  factory Settion.fromJson(Map<String, dynamic> json) => _$SettionFromJson(json);
}
