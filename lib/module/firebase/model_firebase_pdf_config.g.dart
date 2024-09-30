// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_firebase_pdf_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ModelFirebasePdfConfigImpl _$$ModelFirebasePdfConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$ModelFirebasePdfConfigImpl(
      categories: (json['categories'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, MajorCategory.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$$ModelFirebasePdfConfigImplToJson(
        _$ModelFirebasePdfConfigImpl instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };

_$MajorCategoryImpl _$$MajorCategoryImplFromJson(Map<String, dynamic> json) =>
    _$MajorCategoryImpl(
      id: json['id'] as String? ?? '',
      majorTitle: json['majorTitle'] as String? ?? '',
      majorSummary: json['majorSummary'] as String? ?? '',
      subs: (json['subs'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, SubCategory.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$$MajorCategoryImplToJson(_$MajorCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'majorTitle': instance.majorTitle,
      'majorSummary': instance.majorSummary,
      'subs': instance.subs,
    };

_$SubCategoryImpl _$$SubCategoryImplFromJson(Map<String, dynamic> json) =>
    _$SubCategoryImpl(
      id: json['id'] as String? ?? '',
      subTitle: json['subTitle'] as String? ?? '',
      subSummary: json['subSummary'] as String? ?? '',
      minors: (json['minors'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, MinorCategory.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$$SubCategoryImplToJson(_$SubCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subTitle': instance.subTitle,
      'subSummary': instance.subSummary,
      'minors': instance.minors,
    };

_$MinorCategoryImpl _$$MinorCategoryImplFromJson(Map<String, dynamic> json) =>
    _$MinorCategoryImpl(
      id: json['id'] as String? ?? '',
      minorTitle: json['minorTitle'] as String? ?? '',
      minorSummary: json['minorSummary'] as String? ?? '',
      markdown: json['markdown'] as String? ?? '',
      deteils: (json['deteils'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, DeteilCategory.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$$MinorCategoryImplToJson(_$MinorCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'minorTitle': instance.minorTitle,
      'minorSummary': instance.minorSummary,
      'markdown': instance.markdown,
      'deteils': instance.deteils,
    };

_$DeteilCategoryImpl _$$DeteilCategoryImplFromJson(Map<String, dynamic> json) =>
    _$DeteilCategoryImpl(
      id: json['id'] as String? ?? '',
      detailTitle: json['detailTitle'] as String? ?? '',
      detailSummary: json['detailSummary'] as String? ?? '',
      markdown: json['markdown'] as String? ?? '',
    );

Map<String, dynamic> _$$DeteilCategoryImplToJson(
        _$DeteilCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'detailTitle': instance.detailTitle,
      'detailSummary': instance.detailSummary,
      'markdown': instance.markdown,
    };
