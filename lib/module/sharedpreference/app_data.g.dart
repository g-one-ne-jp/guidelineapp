// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppData _$AppDataFromJson(Map<String, dynamic> json) => _AppData(
      isAutoLogin: json['isAutoLogin'] as bool? ?? false,
      selectDeviceId: json['selectDeviceId'] as String? ?? '',
    );

Map<String, dynamic> _$AppDataToJson(_AppData instance) => <String, dynamic>{
      'isAutoLogin': instance.isAutoLogin,
      'selectDeviceId': instance.selectDeviceId,
    };
