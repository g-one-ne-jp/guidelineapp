// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TemplateData {
  bool get isTemplate;
  set isTemplate(bool value);

  /// Create a copy of TemplateData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TemplateDataCopyWith<TemplateData> get copyWith =>
      _$TemplateDataCopyWithImpl<TemplateData>(
          this as TemplateData, _$identity);

  /// Serializes this TemplateData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  String toString() {
    return 'TemplateData(isTemplate: $isTemplate)';
  }
}

/// @nodoc
abstract mixin class $TemplateDataCopyWith<$Res> {
  factory $TemplateDataCopyWith(
          TemplateData value, $Res Function(TemplateData) _then) =
      _$TemplateDataCopyWithImpl;
  @useResult
  $Res call({bool isTemplate});
}

/// @nodoc
class _$TemplateDataCopyWithImpl<$Res> implements $TemplateDataCopyWith<$Res> {
  _$TemplateDataCopyWithImpl(this._self, this._then);

  final TemplateData _self;
  final $Res Function(TemplateData) _then;

  /// Create a copy of TemplateData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isTemplate = null,
  }) {
    return _then(_self.copyWith(
      isTemplate: null == isTemplate
          ? _self.isTemplate
          : isTemplate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [TemplateData].
extension TemplateDataPatterns on TemplateData {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TemplateData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TemplateData() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TemplateData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TemplateData():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TemplateData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TemplateData() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool isTemplate)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TemplateData() when $default != null:
        return $default(_that.isTemplate);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool isTemplate) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TemplateData():
        return $default(_that.isTemplate);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(bool isTemplate)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TemplateData() when $default != null:
        return $default(_that.isTemplate);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TemplateData implements TemplateData {
  _TemplateData([this.isTemplate = false]);
  factory _TemplateData.fromJson(Map<String, dynamic> json) =>
      _$TemplateDataFromJson(json);

  @override
  @JsonKey()
  bool isTemplate;

  /// Create a copy of TemplateData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TemplateDataCopyWith<_TemplateData> get copyWith =>
      __$TemplateDataCopyWithImpl<_TemplateData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TemplateDataToJson(
      this,
    );
  }

  @override
  String toString() {
    return 'TemplateData(isTemplate: $isTemplate)';
  }
}

/// @nodoc
abstract mixin class _$TemplateDataCopyWith<$Res>
    implements $TemplateDataCopyWith<$Res> {
  factory _$TemplateDataCopyWith(
          _TemplateData value, $Res Function(_TemplateData) _then) =
      __$TemplateDataCopyWithImpl;
  @override
  @useResult
  $Res call({bool isTemplate});
}

/// @nodoc
class __$TemplateDataCopyWithImpl<$Res>
    implements _$TemplateDataCopyWith<$Res> {
  __$TemplateDataCopyWithImpl(this._self, this._then);

  final _TemplateData _self;
  final $Res Function(_TemplateData) _then;

  /// Create a copy of TemplateData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isTemplate = null,
  }) {
    return _then(_TemplateData(
      null == isTemplate
          ? _self.isTemplate
          : isTemplate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
