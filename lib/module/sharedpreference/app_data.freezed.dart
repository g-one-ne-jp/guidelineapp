// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppData {
  bool get isAutoLogin;
  set isAutoLogin(bool value);
  String get selectDeviceId;
  set selectDeviceId(String value);

  /// Create a copy of AppData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppDataCopyWith<AppData> get copyWith =>
      _$AppDataCopyWithImpl<AppData>(this as AppData, _$identity);

  /// Serializes this AppData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  String toString() {
    return 'AppData(isAutoLogin: $isAutoLogin, selectDeviceId: $selectDeviceId)';
  }
}

/// @nodoc
abstract mixin class $AppDataCopyWith<$Res> {
  factory $AppDataCopyWith(AppData value, $Res Function(AppData) _then) =
      _$AppDataCopyWithImpl;
  @useResult
  $Res call({bool isAutoLogin, String selectDeviceId});
}

/// @nodoc
class _$AppDataCopyWithImpl<$Res> implements $AppDataCopyWith<$Res> {
  _$AppDataCopyWithImpl(this._self, this._then);

  final AppData _self;
  final $Res Function(AppData) _then;

  /// Create a copy of AppData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAutoLogin = null,
    Object? selectDeviceId = null,
  }) {
    return _then(_self.copyWith(
      isAutoLogin: null == isAutoLogin
          ? _self.isAutoLogin
          : isAutoLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      selectDeviceId: null == selectDeviceId
          ? _self.selectDeviceId
          : selectDeviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [AppData].
extension AppDataPatterns on AppData {
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
    TResult Function(_AppData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppData() when $default != null:
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
    TResult Function(_AppData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppData():
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
    TResult? Function(_AppData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppData() when $default != null:
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
    TResult Function(bool isAutoLogin, String selectDeviceId)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppData() when $default != null:
        return $default(_that.isAutoLogin, _that.selectDeviceId);
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
    TResult Function(bool isAutoLogin, String selectDeviceId) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppData():
        return $default(_that.isAutoLogin, _that.selectDeviceId);
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
    TResult? Function(bool isAutoLogin, String selectDeviceId)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppData() when $default != null:
        return $default(_that.isAutoLogin, _that.selectDeviceId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AppData implements AppData {
  _AppData({this.isAutoLogin = false, this.selectDeviceId = ''});
  factory _AppData.fromJson(Map<String, dynamic> json) =>
      _$AppDataFromJson(json);

  @override
  @JsonKey()
  bool isAutoLogin;
  @override
  @JsonKey()
  String selectDeviceId;

  /// Create a copy of AppData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppDataCopyWith<_AppData> get copyWith =>
      __$AppDataCopyWithImpl<_AppData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AppDataToJson(
      this,
    );
  }

  @override
  String toString() {
    return 'AppData(isAutoLogin: $isAutoLogin, selectDeviceId: $selectDeviceId)';
  }
}

/// @nodoc
abstract mixin class _$AppDataCopyWith<$Res> implements $AppDataCopyWith<$Res> {
  factory _$AppDataCopyWith(_AppData value, $Res Function(_AppData) _then) =
      __$AppDataCopyWithImpl;
  @override
  @useResult
  $Res call({bool isAutoLogin, String selectDeviceId});
}

/// @nodoc
class __$AppDataCopyWithImpl<$Res> implements _$AppDataCopyWith<$Res> {
  __$AppDataCopyWithImpl(this._self, this._then);

  final _AppData _self;
  final $Res Function(_AppData) _then;

  /// Create a copy of AppData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isAutoLogin = null,
    Object? selectDeviceId = null,
  }) {
    return _then(_AppData(
      isAutoLogin: null == isAutoLogin
          ? _self.isAutoLogin
          : isAutoLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      selectDeviceId: null == selectDeviceId
          ? _self.selectDeviceId
          : selectDeviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
