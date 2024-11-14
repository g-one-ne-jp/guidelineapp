// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_firebase_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ModelFirebaseUserImpl _$$ModelFirebaseUserImplFromJson(
        Map<String, dynamic> json) =>
    _$ModelFirebaseUserImpl(
      gender: json['gender'] as String? ?? '',
      age: json['age'] as String? ?? '',
      occupation: json['occupation'] as String? ?? '',
      specialty: json['specialty'] as String? ?? '',
      number: json['number'] as String? ?? '',
      ismailmagazine: json['ismailmagazine'] as bool? ?? false,
      editItems: (json['editItems'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, EditItem.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
      memos: (json['memos'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      bookmarks: (json['bookmarks'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as bool),
          ) ??
          const {},
    );

Map<String, dynamic> _$$ModelFirebaseUserImplToJson(
        _$ModelFirebaseUserImpl instance) =>
    <String, dynamic>{
      'gender': instance.gender,
      'age': instance.age,
      'occupation': instance.occupation,
      'specialty': instance.specialty,
      'number': instance.number,
      'ismailmagazine': instance.ismailmagazine,
      'editItems': instance.editItems,
      'memos': instance.memos,
      'bookmarks': instance.bookmarks,
    };

_$EditItemImpl _$$EditItemImplFromJson(Map<String, dynamic> json) =>
    _$EditItemImpl(
      bookmark: json['bookmark'] as bool? ?? false,
      markdown: json['markdown'] as String? ?? '',
    );

Map<String, dynamic> _$$EditItemImplToJson(_$EditItemImpl instance) =>
    <String, dynamic>{
      'bookmark': instance.bookmark,
      'markdown': instance.markdown,
    };
