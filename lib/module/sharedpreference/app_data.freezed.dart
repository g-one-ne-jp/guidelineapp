// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppData _$AppDataFromJson(Map<String, dynamic> json) {
  return _AppData.fromJson(json);
}

/// @nodoc
mixin _$AppData {
  bool get isAutoLogin => throw _privateConstructorUsedError;
  set isAutoLogin(bool value) => throw _privateConstructorUsedError;
  String get selectDeviceId => throw _privateConstructorUsedError;
  set selectDeviceId(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppDataCopyWith<AppData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppDataCopyWith<$Res> {
  factory $AppDataCopyWith(AppData value, $Res Function(AppData) then) =
      _$AppDataCopyWithImpl<$Res, AppData>;
  @useResult
  $Res call({bool isAutoLogin, String selectDeviceId});
}

/// @nodoc
class _$AppDataCopyWithImpl<$Res, $Val extends AppData>
    implements $AppDataCopyWith<$Res> {
  _$AppDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAutoLogin = null,
    Object? selectDeviceId = null,
  }) {
    return _then(_value.copyWith(
      isAutoLogin: null == isAutoLogin
          ? _value.isAutoLogin
          : isAutoLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      selectDeviceId: null == selectDeviceId
          ? _value.selectDeviceId
          : selectDeviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppDataImplCopyWith<$Res> implements $AppDataCopyWith<$Res> {
  factory _$$AppDataImplCopyWith(
          _$AppDataImpl value, $Res Function(_$AppDataImpl) then) =
      __$$AppDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isAutoLogin, String selectDeviceId});
}

/// @nodoc
class __$$AppDataImplCopyWithImpl<$Res>
    extends _$AppDataCopyWithImpl<$Res, _$AppDataImpl>
    implements _$$AppDataImplCopyWith<$Res> {
  __$$AppDataImplCopyWithImpl(
      _$AppDataImpl _value, $Res Function(_$AppDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAutoLogin = null,
    Object? selectDeviceId = null,
  }) {
    return _then(_$AppDataImpl(
      isAutoLogin: null == isAutoLogin
          ? _value.isAutoLogin
          : isAutoLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      selectDeviceId: null == selectDeviceId
          ? _value.selectDeviceId
          : selectDeviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppDataImpl implements _AppData {
  _$AppDataImpl({this.isAutoLogin = false, this.selectDeviceId = ''});

  factory _$AppDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppDataImplFromJson(json);

  @override
  @JsonKey()
  bool isAutoLogin;
  @override
  @JsonKey()
  String selectDeviceId;

  @override
  String toString() {
    return 'AppData(isAutoLogin: $isAutoLogin, selectDeviceId: $selectDeviceId)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppDataImplCopyWith<_$AppDataImpl> get copyWith =>
      __$$AppDataImplCopyWithImpl<_$AppDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppDataImplToJson(
      this,
    );
  }
}

abstract class _AppData implements AppData {
  factory _AppData({bool isAutoLogin, String selectDeviceId}) = _$AppDataImpl;

  factory _AppData.fromJson(Map<String, dynamic> json) = _$AppDataImpl.fromJson;

  @override
  bool get isAutoLogin;
  set isAutoLogin(bool value);
  @override
  String get selectDeviceId;
  set selectDeviceId(String value);
  @override
  @JsonKey(ignore: true)
  _$$AppDataImplCopyWith<_$AppDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
