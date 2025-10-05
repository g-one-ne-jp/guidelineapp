// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_firebase_pdf_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ModelFirebasePdfConfig _$ModelFirebasePdfConfigFromJson(
        Map<String, dynamic> json) =>
    _ModelFirebasePdfConfig(
      categories: (json['categories'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, MajorCategory.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$ModelFirebasePdfConfigToJson(
        _ModelFirebasePdfConfig instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };

_MajorCategory _$MajorCategoryFromJson(Map<String, dynamic> json) =>
    _MajorCategory(
      majorKey: json['majorKey'] as String? ?? '',
      majorTitle: json['majorTitle'] as String? ?? '',
      majorSummary: json['majorSummary'] as String? ?? '',
      subs: (json['subs'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, SubCategory.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$MajorCategoryToJson(_MajorCategory instance) =>
    <String, dynamic>{
      'majorKey': instance.majorKey,
      'majorTitle': instance.majorTitle,
      'majorSummary': instance.majorSummary,
      'subs': instance.subs,
    };

_SubCategory _$SubCategoryFromJson(Map<String, dynamic> json) => _SubCategory(
      subKey: json['subKey'] as String? ?? '',
      subTitle: json['subTitle'] as String? ?? '',
      subSummary: json['subSummary'] as String? ?? '',
      minors: (json['minors'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, MinorCategory.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$SubCategoryToJson(_SubCategory instance) =>
    <String, dynamic>{
      'subKey': instance.subKey,
      'subTitle': instance.subTitle,
      'subSummary': instance.subSummary,
      'minors': instance.minors,
    };

_MinorCategory _$MinorCategoryFromJson(Map<String, dynamic> json) =>
    _MinorCategory(
      minorKey: json['minorKey'] as String? ?? '',
      minorTitle: json['minorTitle'] as String? ?? '',
      minorSummary: json['minorSummary'] as String? ?? '',
      details: (json['details'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, DetailCategory.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$MinorCategoryToJson(_MinorCategory instance) =>
    <String, dynamic>{
      'minorKey': instance.minorKey,
      'minorTitle': instance.minorTitle,
      'minorSummary': instance.minorSummary,
      'details': instance.details,
    };

_DeteilCategory _$DeteilCategoryFromJson(Map<String, dynamic> json) =>
    _DeteilCategory(
      detailKey: json['detailKey'] as String? ?? '',
      detailTitle: json['detailTitle'] as String? ?? '',
      detailSummary: json['detailSummary'] as String? ?? '',
      contents: (json['contents'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, Content.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$DeteilCategoryToJson(_DeteilCategory instance) =>
    <String, dynamic>{
      'detailKey': instance.detailKey,
      'detailTitle': instance.detailTitle,
      'detailSummary': instance.detailSummary,
      'contents': instance.contents,
    };

_Content _$ContentFromJson(Map<String, dynamic> json) => _Content(
      contentKey: json['contentKey'] as String? ?? '',
      contentTitle: json['contentTitle'] as String? ?? '',
      settions: (json['settions'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, Settion.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$ContentToJson(_Content instance) => <String, dynamic>{
      'contentKey': instance.contentKey,
      'contentTitle': instance.contentTitle,
      'settions': instance.settions,
    };

_Settion _$SettionFromJson(Map<String, dynamic> json) => _Settion(
      settionTitle: json['settionTitle'] as String? ?? '',
      pdfId: json['pdfId'] as String? ?? '',
      searchWord: json['searchWord'] as String? ?? '',
      markdown: json['markdown'] as String? ?? '',
      searchKeywords: (json['searchKeywords'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SettionToJson(_Settion instance) => <String, dynamic>{
      'settionTitle': instance.settionTitle,
      'pdfId': instance.pdfId,
      'searchWord': instance.searchWord,
      'markdown': instance.markdown,
      'searchKeywords': instance.searchKeywords,
    };
