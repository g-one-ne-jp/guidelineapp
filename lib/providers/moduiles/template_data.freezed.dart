// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TemplateData _$TemplateDataFromJson(Map<String, dynamic> json) {
  return _TemplateData.fromJson(json);
}

/// @nodoc
mixin _$TemplateData {
  bool get isTemplate => throw _privateConstructorUsedError;
  set isTemplate(bool value) => throw _privateConstructorUsedError;

  /// Serializes this TemplateData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TemplateData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TemplateDataCopyWith<TemplateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateDataCopyWith<$Res> {
  factory $TemplateDataCopyWith(
          TemplateData value, $Res Function(TemplateData) then) =
      _$TemplateDataCopyWithImpl<$Res, TemplateData>;
  @useResult
  $Res call({bool isTemplate});
}

/// @nodoc
class _$TemplateDataCopyWithImpl<$Res, $Val extends TemplateData>
    implements $TemplateDataCopyWith<$Res> {
  _$TemplateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TemplateData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isTemplate = null,
  }) {
    return _then(_value.copyWith(
      isTemplate: null == isTemplate
          ? _value.isTemplate
          : isTemplate // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TemplateDataImplCopyWith<$Res>
    implements $TemplateDataCopyWith<$Res> {
  factory _$$TemplateDataImplCopyWith(
          _$TemplateDataImpl value, $Res Function(_$TemplateDataImpl) then) =
      __$$TemplateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isTemplate});
}

/// @nodoc
class __$$TemplateDataImplCopyWithImpl<$Res>
    extends _$TemplateDataCopyWithImpl<$Res, _$TemplateDataImpl>
    implements _$$TemplateDataImplCopyWith<$Res> {
  __$$TemplateDataImplCopyWithImpl(
      _$TemplateDataImpl _value, $Res Function(_$TemplateDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of TemplateData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isTemplate = null,
  }) {
    return _then(_$TemplateDataImpl(
      null == isTemplate
          ? _value.isTemplate
          : isTemplate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TemplateDataImpl implements _TemplateData {
  _$TemplateDataImpl([this.isTemplate = false]);

  factory _$TemplateDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TemplateDataImplFromJson(json);

  @override
  @JsonKey()
  bool isTemplate;

  @override
  String toString() {
    return 'TemplateData(isTemplate: $isTemplate)';
  }

  /// Create a copy of TemplateData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TemplateDataImplCopyWith<_$TemplateDataImpl> get copyWith =>
      __$$TemplateDataImplCopyWithImpl<_$TemplateDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TemplateDataImplToJson(
      this,
    );
  }
}

abstract class _TemplateData implements TemplateData {
  factory _TemplateData([bool isTemplate]) = _$TemplateDataImpl;

  factory _TemplateData.fromJson(Map<String, dynamic> json) =
      _$TemplateDataImpl.fromJson;

  @override
  bool get isTemplate;
  set isTemplate(bool value);

  /// Create a copy of TemplateData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TemplateDataImplCopyWith<_$TemplateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
