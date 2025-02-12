// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_firebase_pdf_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ModelFirebasePdfConfigImpl _$$ModelFirebasePdfConfigImplFromJson(Map<String, dynamic> json) =>
    _$ModelFirebasePdfConfigImpl(
      categories: (json['categories'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, MajorCategory.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$$ModelFirebasePdfConfigImplToJson(_$ModelFirebasePdfConfigImpl instance) => <String, dynamic>{
      'categories': instance.categories,
    };

_$MajorCategoryImpl _$$MajorCategoryImplFromJson(Map<String, dynamic> json) => _$MajorCategoryImpl(
      majorKey: json['majorKey'] as String? ?? '',
      majorTitle: json['majorTitle'] as String? ?? '',
      majorSummary: json['majorSummary'] as String? ?? '',
      subs: (json['subs'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, SubCategory.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$$MajorCategoryImplToJson(_$MajorCategoryImpl instance) => <String, dynamic>{
      'majorKey': instance.majorKey,
      'majorTitle': instance.majorTitle,
      'majorSummary': instance.majorSummary,
      'subs': instance.subs,
    };

_$SubCategoryImpl _$$SubCategoryImplFromJson(Map<String, dynamic> json) => _$SubCategoryImpl(
      subKey: json['subKey'] as String? ?? '',
      subTitle: json['subTitle'] as String? ?? '',
      subSummary: json['subSummary'] as String? ?? '',
      minors: (json['minors'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, MinorCategory.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$$SubCategoryImplToJson(_$SubCategoryImpl instance) => <String, dynamic>{
      'subKey': instance.subKey,
      'subTitle': instance.subTitle,
      'subSummary': instance.subSummary,
      'minors': instance.minors,
    };

_$MinorCategoryImpl _$$MinorCategoryImplFromJson(Map<String, dynamic> json) => _$MinorCategoryImpl(
      minorKey: json['minorKey'] as String? ?? '',
      minorTitle: json['minorTitle'] as String? ?? '',
      minorSummary: json['minorSummary'] as String? ?? '',
      details: (json['details'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, DetailCategory.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$$MinorCategoryImplToJson(_$MinorCategoryImpl instance) => <String, dynamic>{
      'minorKey': instance.minorKey,
      'minorTitle': instance.minorTitle,
      'minorSummary': instance.minorSummary,
      'details': instance.details,
    };

_$DeteilCategoryImpl _$$DeteilCategoryImplFromJson(Map<String, dynamic> json) => _$DeteilCategoryImpl(
      detailKey: json['detailKey'] as String? ?? '',
      detailTitle: json['detailTitle'] as String? ?? '',
      detailSummary: json['detailSummary'] as String? ?? '',
      contents: (json['contents'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, Content.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$$DeteilCategoryImplToJson(_$DeteilCategoryImpl instance) => <String, dynamic>{
      'detailKey': instance.detailKey,
      'detailTitle': instance.detailTitle,
      'detailSummary': instance.detailSummary,
      'contents': instance.contents,
    };

_$ContentImpl _$$ContentImplFromJson(Map<String, dynamic> json) => _$ContentImpl(
      contentKey: json['contentKey'] as String? ?? '',
      contentTitle: json['contentTitle'] as String? ?? '',
      settions: (json['settions'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, Settion.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$$ContentImplToJson(_$ContentImpl instance) => <String, dynamic>{
      'contentKey': instance.contentKey,
      'contentTitle': instance.contentTitle,
      'settions': instance.settions,
    };

_$SettionImpl _$$SettionImplFromJson(Map<String, dynamic> json) => _$SettionImpl(
      settionTitle: json['settionTitle'] as String? ?? '',
      pdfId: json['pdfId'] as String? ?? '',
      searchWord: json['searchWord'] as String? ?? '',
      markdown: json['markdown'] as String? ?? '',
      searchKeywords: (json['searchKeywords'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
    );

Map<String, dynamic> _$$SettionImplToJson(_$SettionImpl instance) => <String, dynamic>{
      'settionTitle': instance.settionTitle,
      'pdfId': instance.pdfId,
      'searchWord': instance.searchWord,
      'markdown': instance.markdown,
      'searchKeywords': instance.searchKeywords,
    };
