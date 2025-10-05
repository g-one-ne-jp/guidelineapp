// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model_firebase_pdf_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ModelFirebasePdfConfig {
  Map<String, MajorCategory> get categories;

  /// Create a copy of ModelFirebasePdfConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ModelFirebasePdfConfigCopyWith<ModelFirebasePdfConfig> get copyWith =>
      _$ModelFirebasePdfConfigCopyWithImpl<ModelFirebasePdfConfig>(
          this as ModelFirebasePdfConfig, _$identity);

  /// Serializes this ModelFirebasePdfConfig to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ModelFirebasePdfConfig &&
            const DeepCollectionEquality()
                .equals(other.categories, categories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(categories));

  @override
  String toString() {
    return 'ModelFirebasePdfConfig(categories: $categories)';
  }
}

/// @nodoc
abstract mixin class $ModelFirebasePdfConfigCopyWith<$Res> {
  factory $ModelFirebasePdfConfigCopyWith(ModelFirebasePdfConfig value,
          $Res Function(ModelFirebasePdfConfig) _then) =
      _$ModelFirebasePdfConfigCopyWithImpl;
  @useResult
  $Res call({Map<String, MajorCategory> categories});
}

/// @nodoc
class _$ModelFirebasePdfConfigCopyWithImpl<$Res>
    implements $ModelFirebasePdfConfigCopyWith<$Res> {
  _$ModelFirebasePdfConfigCopyWithImpl(this._self, this._then);

  final ModelFirebasePdfConfig _self;
  final $Res Function(ModelFirebasePdfConfig) _then;

  /// Create a copy of ModelFirebasePdfConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_self.copyWith(
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as Map<String, MajorCategory>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ModelFirebasePdfConfig].
extension ModelFirebasePdfConfigPatterns on ModelFirebasePdfConfig {
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
    TResult Function(_ModelFirebasePdfConfig value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ModelFirebasePdfConfig() when $default != null:
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
    TResult Function(_ModelFirebasePdfConfig value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModelFirebasePdfConfig():
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
    TResult? Function(_ModelFirebasePdfConfig value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModelFirebasePdfConfig() when $default != null:
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
    TResult Function(Map<String, MajorCategory> categories)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ModelFirebasePdfConfig() when $default != null:
        return $default(_that.categories);
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
    TResult Function(Map<String, MajorCategory> categories) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModelFirebasePdfConfig():
        return $default(_that.categories);
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
    TResult? Function(Map<String, MajorCategory> categories)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModelFirebasePdfConfig() when $default != null:
        return $default(_that.categories);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ModelFirebasePdfConfig implements ModelFirebasePdfConfig {
  _ModelFirebasePdfConfig(
      {final Map<String, MajorCategory> categories = const {}})
      : _categories = categories;
  factory _ModelFirebasePdfConfig.fromJson(Map<String, dynamic> json) =>
      _$ModelFirebasePdfConfigFromJson(json);

  final Map<String, MajorCategory> _categories;
  @override
  @JsonKey()
  Map<String, MajorCategory> get categories {
    if (_categories is EqualUnmodifiableMapView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categories);
  }

  /// Create a copy of ModelFirebasePdfConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ModelFirebasePdfConfigCopyWith<_ModelFirebasePdfConfig> get copyWith =>
      __$ModelFirebasePdfConfigCopyWithImpl<_ModelFirebasePdfConfig>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ModelFirebasePdfConfigToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ModelFirebasePdfConfig &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @override
  String toString() {
    return 'ModelFirebasePdfConfig(categories: $categories)';
  }
}

/// @nodoc
abstract mixin class _$ModelFirebasePdfConfigCopyWith<$Res>
    implements $ModelFirebasePdfConfigCopyWith<$Res> {
  factory _$ModelFirebasePdfConfigCopyWith(_ModelFirebasePdfConfig value,
          $Res Function(_ModelFirebasePdfConfig) _then) =
      __$ModelFirebasePdfConfigCopyWithImpl;
  @override
  @useResult
  $Res call({Map<String, MajorCategory> categories});
}

/// @nodoc
class __$ModelFirebasePdfConfigCopyWithImpl<$Res>
    implements _$ModelFirebasePdfConfigCopyWith<$Res> {
  __$ModelFirebasePdfConfigCopyWithImpl(this._self, this._then);

  final _ModelFirebasePdfConfig _self;
  final $Res Function(_ModelFirebasePdfConfig) _then;

  /// Create a copy of ModelFirebasePdfConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? categories = null,
  }) {
    return _then(_ModelFirebasePdfConfig(
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as Map<String, MajorCategory>,
    ));
  }
}

/// @nodoc
mixin _$MajorCategory {
  String get majorKey;
  String get majorTitle;
  String get majorSummary;
  Map<String, SubCategory> get subs;

  /// Create a copy of MajorCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MajorCategoryCopyWith<MajorCategory> get copyWith =>
      _$MajorCategoryCopyWithImpl<MajorCategory>(
          this as MajorCategory, _$identity);

  /// Serializes this MajorCategory to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MajorCategory &&
            (identical(other.majorKey, majorKey) ||
                other.majorKey == majorKey) &&
            (identical(other.majorTitle, majorTitle) ||
                other.majorTitle == majorTitle) &&
            (identical(other.majorSummary, majorSummary) ||
                other.majorSummary == majorSummary) &&
            const DeepCollectionEquality().equals(other.subs, subs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, majorKey, majorTitle,
      majorSummary, const DeepCollectionEquality().hash(subs));

  @override
  String toString() {
    return 'MajorCategory(majorKey: $majorKey, majorTitle: $majorTitle, majorSummary: $majorSummary, subs: $subs)';
  }
}

/// @nodoc
abstract mixin class $MajorCategoryCopyWith<$Res> {
  factory $MajorCategoryCopyWith(
          MajorCategory value, $Res Function(MajorCategory) _then) =
      _$MajorCategoryCopyWithImpl;
  @useResult
  $Res call(
      {String majorKey,
      String majorTitle,
      String majorSummary,
      Map<String, SubCategory> subs});
}

/// @nodoc
class _$MajorCategoryCopyWithImpl<$Res>
    implements $MajorCategoryCopyWith<$Res> {
  _$MajorCategoryCopyWithImpl(this._self, this._then);

  final MajorCategory _self;
  final $Res Function(MajorCategory) _then;

  /// Create a copy of MajorCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? majorKey = null,
    Object? majorTitle = null,
    Object? majorSummary = null,
    Object? subs = null,
  }) {
    return _then(_self.copyWith(
      majorKey: null == majorKey
          ? _self.majorKey
          : majorKey // ignore: cast_nullable_to_non_nullable
              as String,
      majorTitle: null == majorTitle
          ? _self.majorTitle
          : majorTitle // ignore: cast_nullable_to_non_nullable
              as String,
      majorSummary: null == majorSummary
          ? _self.majorSummary
          : majorSummary // ignore: cast_nullable_to_non_nullable
              as String,
      subs: null == subs
          ? _self.subs
          : subs // ignore: cast_nullable_to_non_nullable
              as Map<String, SubCategory>,
    ));
  }
}

/// Adds pattern-matching-related methods to [MajorCategory].
extension MajorCategoryPatterns on MajorCategory {
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
    TResult Function(_MajorCategory value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MajorCategory() when $default != null:
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
    TResult Function(_MajorCategory value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MajorCategory():
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
    TResult? Function(_MajorCategory value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MajorCategory() when $default != null:
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
    TResult Function(String majorKey, String majorTitle, String majorSummary,
            Map<String, SubCategory> subs)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MajorCategory() when $default != null:
        return $default(
            _that.majorKey, _that.majorTitle, _that.majorSummary, _that.subs);
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
    TResult Function(String majorKey, String majorTitle, String majorSummary,
            Map<String, SubCategory> subs)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MajorCategory():
        return $default(
            _that.majorKey, _that.majorTitle, _that.majorSummary, _that.subs);
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
    TResult? Function(String majorKey, String majorTitle, String majorSummary,
            Map<String, SubCategory> subs)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MajorCategory() when $default != null:
        return $default(
            _that.majorKey, _that.majorTitle, _that.majorSummary, _that.subs);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MajorCategory implements MajorCategory {
  _MajorCategory(
      {this.majorKey = '',
      this.majorTitle = '',
      this.majorSummary = '',
      final Map<String, SubCategory> subs = const {}})
      : _subs = subs;
  factory _MajorCategory.fromJson(Map<String, dynamic> json) =>
      _$MajorCategoryFromJson(json);

  @override
  @JsonKey()
  final String majorKey;
  @override
  @JsonKey()
  final String majorTitle;
  @override
  @JsonKey()
  final String majorSummary;
  final Map<String, SubCategory> _subs;
  @override
  @JsonKey()
  Map<String, SubCategory> get subs {
    if (_subs is EqualUnmodifiableMapView) return _subs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_subs);
  }

  /// Create a copy of MajorCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MajorCategoryCopyWith<_MajorCategory> get copyWith =>
      __$MajorCategoryCopyWithImpl<_MajorCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MajorCategoryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MajorCategory &&
            (identical(other.majorKey, majorKey) ||
                other.majorKey == majorKey) &&
            (identical(other.majorTitle, majorTitle) ||
                other.majorTitle == majorTitle) &&
            (identical(other.majorSummary, majorSummary) ||
                other.majorSummary == majorSummary) &&
            const DeepCollectionEquality().equals(other._subs, _subs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, majorKey, majorTitle,
      majorSummary, const DeepCollectionEquality().hash(_subs));

  @override
  String toString() {
    return 'MajorCategory(majorKey: $majorKey, majorTitle: $majorTitle, majorSummary: $majorSummary, subs: $subs)';
  }
}

/// @nodoc
abstract mixin class _$MajorCategoryCopyWith<$Res>
    implements $MajorCategoryCopyWith<$Res> {
  factory _$MajorCategoryCopyWith(
          _MajorCategory value, $Res Function(_MajorCategory) _then) =
      __$MajorCategoryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String majorKey,
      String majorTitle,
      String majorSummary,
      Map<String, SubCategory> subs});
}

/// @nodoc
class __$MajorCategoryCopyWithImpl<$Res>
    implements _$MajorCategoryCopyWith<$Res> {
  __$MajorCategoryCopyWithImpl(this._self, this._then);

  final _MajorCategory _self;
  final $Res Function(_MajorCategory) _then;

  /// Create a copy of MajorCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? majorKey = null,
    Object? majorTitle = null,
    Object? majorSummary = null,
    Object? subs = null,
  }) {
    return _then(_MajorCategory(
      majorKey: null == majorKey
          ? _self.majorKey
          : majorKey // ignore: cast_nullable_to_non_nullable
              as String,
      majorTitle: null == majorTitle
          ? _self.majorTitle
          : majorTitle // ignore: cast_nullable_to_non_nullable
              as String,
      majorSummary: null == majorSummary
          ? _self.majorSummary
          : majorSummary // ignore: cast_nullable_to_non_nullable
              as String,
      subs: null == subs
          ? _self._subs
          : subs // ignore: cast_nullable_to_non_nullable
              as Map<String, SubCategory>,
    ));
  }
}

/// @nodoc
mixin _$SubCategory {
  String get subKey;
  String get subTitle;
  String get subSummary;
  Map<String, MinorCategory> get minors;

  /// Create a copy of SubCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubCategoryCopyWith<SubCategory> get copyWith =>
      _$SubCategoryCopyWithImpl<SubCategory>(this as SubCategory, _$identity);

  /// Serializes this SubCategory to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubCategory &&
            (identical(other.subKey, subKey) || other.subKey == subKey) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.subSummary, subSummary) ||
                other.subSummary == subSummary) &&
            const DeepCollectionEquality().equals(other.minors, minors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, subKey, subTitle, subSummary,
      const DeepCollectionEquality().hash(minors));

  @override
  String toString() {
    return 'SubCategory(subKey: $subKey, subTitle: $subTitle, subSummary: $subSummary, minors: $minors)';
  }
}

/// @nodoc
abstract mixin class $SubCategoryCopyWith<$Res> {
  factory $SubCategoryCopyWith(
          SubCategory value, $Res Function(SubCategory) _then) =
      _$SubCategoryCopyWithImpl;
  @useResult
  $Res call(
      {String subKey,
      String subTitle,
      String subSummary,
      Map<String, MinorCategory> minors});
}

/// @nodoc
class _$SubCategoryCopyWithImpl<$Res> implements $SubCategoryCopyWith<$Res> {
  _$SubCategoryCopyWithImpl(this._self, this._then);

  final SubCategory _self;
  final $Res Function(SubCategory) _then;

  /// Create a copy of SubCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subKey = null,
    Object? subTitle = null,
    Object? subSummary = null,
    Object? minors = null,
  }) {
    return _then(_self.copyWith(
      subKey: null == subKey
          ? _self.subKey
          : subKey // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _self.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      subSummary: null == subSummary
          ? _self.subSummary
          : subSummary // ignore: cast_nullable_to_non_nullable
              as String,
      minors: null == minors
          ? _self.minors
          : minors // ignore: cast_nullable_to_non_nullable
              as Map<String, MinorCategory>,
    ));
  }
}

/// Adds pattern-matching-related methods to [SubCategory].
extension SubCategoryPatterns on SubCategory {
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
    TResult Function(_SubCategory value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubCategory() when $default != null:
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
    TResult Function(_SubCategory value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubCategory():
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
    TResult? Function(_SubCategory value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubCategory() when $default != null:
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
    TResult Function(String subKey, String subTitle, String subSummary,
            Map<String, MinorCategory> minors)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SubCategory() when $default != null:
        return $default(
            _that.subKey, _that.subTitle, _that.subSummary, _that.minors);
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
    TResult Function(String subKey, String subTitle, String subSummary,
            Map<String, MinorCategory> minors)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubCategory():
        return $default(
            _that.subKey, _that.subTitle, _that.subSummary, _that.minors);
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
    TResult? Function(String subKey, String subTitle, String subSummary,
            Map<String, MinorCategory> minors)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SubCategory() when $default != null:
        return $default(
            _that.subKey, _that.subTitle, _that.subSummary, _that.minors);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SubCategory implements SubCategory {
  _SubCategory(
      {this.subKey = '',
      this.subTitle = '',
      this.subSummary = '',
      final Map<String, MinorCategory> minors = const {}})
      : _minors = minors;
  factory _SubCategory.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryFromJson(json);

  @override
  @JsonKey()
  final String subKey;
  @override
  @JsonKey()
  final String subTitle;
  @override
  @JsonKey()
  final String subSummary;
  final Map<String, MinorCategory> _minors;
  @override
  @JsonKey()
  Map<String, MinorCategory> get minors {
    if (_minors is EqualUnmodifiableMapView) return _minors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_minors);
  }

  /// Create a copy of SubCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubCategoryCopyWith<_SubCategory> get copyWith =>
      __$SubCategoryCopyWithImpl<_SubCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SubCategoryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubCategory &&
            (identical(other.subKey, subKey) || other.subKey == subKey) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.subSummary, subSummary) ||
                other.subSummary == subSummary) &&
            const DeepCollectionEquality().equals(other._minors, _minors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, subKey, subTitle, subSummary,
      const DeepCollectionEquality().hash(_minors));

  @override
  String toString() {
    return 'SubCategory(subKey: $subKey, subTitle: $subTitle, subSummary: $subSummary, minors: $minors)';
  }
}

/// @nodoc
abstract mixin class _$SubCategoryCopyWith<$Res>
    implements $SubCategoryCopyWith<$Res> {
  factory _$SubCategoryCopyWith(
          _SubCategory value, $Res Function(_SubCategory) _then) =
      __$SubCategoryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String subKey,
      String subTitle,
      String subSummary,
      Map<String, MinorCategory> minors});
}

/// @nodoc
class __$SubCategoryCopyWithImpl<$Res> implements _$SubCategoryCopyWith<$Res> {
  __$SubCategoryCopyWithImpl(this._self, this._then);

  final _SubCategory _self;
  final $Res Function(_SubCategory) _then;

  /// Create a copy of SubCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? subKey = null,
    Object? subTitle = null,
    Object? subSummary = null,
    Object? minors = null,
  }) {
    return _then(_SubCategory(
      subKey: null == subKey
          ? _self.subKey
          : subKey // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _self.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      subSummary: null == subSummary
          ? _self.subSummary
          : subSummary // ignore: cast_nullable_to_non_nullable
              as String,
      minors: null == minors
          ? _self._minors
          : minors // ignore: cast_nullable_to_non_nullable
              as Map<String, MinorCategory>,
    ));
  }
}

/// @nodoc
mixin _$MinorCategory {
  String get minorKey;
  String get minorTitle;
  String get minorSummary;
  Map<String, DetailCategory> get details;

  /// Create a copy of MinorCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MinorCategoryCopyWith<MinorCategory> get copyWith =>
      _$MinorCategoryCopyWithImpl<MinorCategory>(
          this as MinorCategory, _$identity);

  /// Serializes this MinorCategory to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MinorCategory &&
            (identical(other.minorKey, minorKey) ||
                other.minorKey == minorKey) &&
            (identical(other.minorTitle, minorTitle) ||
                other.minorTitle == minorTitle) &&
            (identical(other.minorSummary, minorSummary) ||
                other.minorSummary == minorSummary) &&
            const DeepCollectionEquality().equals(other.details, details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, minorKey, minorTitle,
      minorSummary, const DeepCollectionEquality().hash(details));

  @override
  String toString() {
    return 'MinorCategory(minorKey: $minorKey, minorTitle: $minorTitle, minorSummary: $minorSummary, details: $details)';
  }
}

/// @nodoc
abstract mixin class $MinorCategoryCopyWith<$Res> {
  factory $MinorCategoryCopyWith(
          MinorCategory value, $Res Function(MinorCategory) _then) =
      _$MinorCategoryCopyWithImpl;
  @useResult
  $Res call(
      {String minorKey,
      String minorTitle,
      String minorSummary,
      Map<String, DetailCategory> details});
}

/// @nodoc
class _$MinorCategoryCopyWithImpl<$Res>
    implements $MinorCategoryCopyWith<$Res> {
  _$MinorCategoryCopyWithImpl(this._self, this._then);

  final MinorCategory _self;
  final $Res Function(MinorCategory) _then;

  /// Create a copy of MinorCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minorKey = null,
    Object? minorTitle = null,
    Object? minorSummary = null,
    Object? details = null,
  }) {
    return _then(_self.copyWith(
      minorKey: null == minorKey
          ? _self.minorKey
          : minorKey // ignore: cast_nullable_to_non_nullable
              as String,
      minorTitle: null == minorTitle
          ? _self.minorTitle
          : minorTitle // ignore: cast_nullable_to_non_nullable
              as String,
      minorSummary: null == minorSummary
          ? _self.minorSummary
          : minorSummary // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _self.details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, DetailCategory>,
    ));
  }
}

/// Adds pattern-matching-related methods to [MinorCategory].
extension MinorCategoryPatterns on MinorCategory {
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
    TResult Function(_MinorCategory value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MinorCategory() when $default != null:
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
    TResult Function(_MinorCategory value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MinorCategory():
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
    TResult? Function(_MinorCategory value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MinorCategory() when $default != null:
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
    TResult Function(String minorKey, String minorTitle, String minorSummary,
            Map<String, DetailCategory> details)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MinorCategory() when $default != null:
        return $default(_that.minorKey, _that.minorTitle, _that.minorSummary,
            _that.details);
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
    TResult Function(String minorKey, String minorTitle, String minorSummary,
            Map<String, DetailCategory> details)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MinorCategory():
        return $default(_that.minorKey, _that.minorTitle, _that.minorSummary,
            _that.details);
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
    TResult? Function(String minorKey, String minorTitle, String minorSummary,
            Map<String, DetailCategory> details)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MinorCategory() when $default != null:
        return $default(_that.minorKey, _that.minorTitle, _that.minorSummary,
            _that.details);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MinorCategory implements MinorCategory {
  _MinorCategory(
      {this.minorKey = '',
      this.minorTitle = '',
      this.minorSummary = '',
      final Map<String, DetailCategory> details = const {}})
      : _details = details;
  factory _MinorCategory.fromJson(Map<String, dynamic> json) =>
      _$MinorCategoryFromJson(json);

  @override
  @JsonKey()
  final String minorKey;
  @override
  @JsonKey()
  final String minorTitle;
  @override
  @JsonKey()
  final String minorSummary;
  final Map<String, DetailCategory> _details;
  @override
  @JsonKey()
  Map<String, DetailCategory> get details {
    if (_details is EqualUnmodifiableMapView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_details);
  }

  /// Create a copy of MinorCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MinorCategoryCopyWith<_MinorCategory> get copyWith =>
      __$MinorCategoryCopyWithImpl<_MinorCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MinorCategoryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MinorCategory &&
            (identical(other.minorKey, minorKey) ||
                other.minorKey == minorKey) &&
            (identical(other.minorTitle, minorTitle) ||
                other.minorTitle == minorTitle) &&
            (identical(other.minorSummary, minorSummary) ||
                other.minorSummary == minorSummary) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, minorKey, minorTitle,
      minorSummary, const DeepCollectionEquality().hash(_details));

  @override
  String toString() {
    return 'MinorCategory(minorKey: $minorKey, minorTitle: $minorTitle, minorSummary: $minorSummary, details: $details)';
  }
}

/// @nodoc
abstract mixin class _$MinorCategoryCopyWith<$Res>
    implements $MinorCategoryCopyWith<$Res> {
  factory _$MinorCategoryCopyWith(
          _MinorCategory value, $Res Function(_MinorCategory) _then) =
      __$MinorCategoryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String minorKey,
      String minorTitle,
      String minorSummary,
      Map<String, DetailCategory> details});
}

/// @nodoc
class __$MinorCategoryCopyWithImpl<$Res>
    implements _$MinorCategoryCopyWith<$Res> {
  __$MinorCategoryCopyWithImpl(this._self, this._then);

  final _MinorCategory _self;
  final $Res Function(_MinorCategory) _then;

  /// Create a copy of MinorCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? minorKey = null,
    Object? minorTitle = null,
    Object? minorSummary = null,
    Object? details = null,
  }) {
    return _then(_MinorCategory(
      minorKey: null == minorKey
          ? _self.minorKey
          : minorKey // ignore: cast_nullable_to_non_nullable
              as String,
      minorTitle: null == minorTitle
          ? _self.minorTitle
          : minorTitle // ignore: cast_nullable_to_non_nullable
              as String,
      minorSummary: null == minorSummary
          ? _self.minorSummary
          : minorSummary // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _self._details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, DetailCategory>,
    ));
  }
}

DetailCategory _$DetailCategoryFromJson(Map<String, dynamic> json) {
  return _DeteilCategory.fromJson(json);
}

/// @nodoc
mixin _$DetailCategory {
  String get detailKey;
  String get detailTitle;
  String get detailSummary;
  Map<String, Content> get contents;

  /// Create a copy of DetailCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DetailCategoryCopyWith<DetailCategory> get copyWith =>
      _$DetailCategoryCopyWithImpl<DetailCategory>(
          this as DetailCategory, _$identity);

  /// Serializes this DetailCategory to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DetailCategory &&
            (identical(other.detailKey, detailKey) ||
                other.detailKey == detailKey) &&
            (identical(other.detailTitle, detailTitle) ||
                other.detailTitle == detailTitle) &&
            (identical(other.detailSummary, detailSummary) ||
                other.detailSummary == detailSummary) &&
            const DeepCollectionEquality().equals(other.contents, contents));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, detailKey, detailTitle,
      detailSummary, const DeepCollectionEquality().hash(contents));

  @override
  String toString() {
    return 'DetailCategory(detailKey: $detailKey, detailTitle: $detailTitle, detailSummary: $detailSummary, contents: $contents)';
  }
}

/// @nodoc
abstract mixin class $DetailCategoryCopyWith<$Res> {
  factory $DetailCategoryCopyWith(
          DetailCategory value, $Res Function(DetailCategory) _then) =
      _$DetailCategoryCopyWithImpl;
  @useResult
  $Res call(
      {String detailKey,
      String detailTitle,
      String detailSummary,
      Map<String, Content> contents});
}

/// @nodoc
class _$DetailCategoryCopyWithImpl<$Res>
    implements $DetailCategoryCopyWith<$Res> {
  _$DetailCategoryCopyWithImpl(this._self, this._then);

  final DetailCategory _self;
  final $Res Function(DetailCategory) _then;

  /// Create a copy of DetailCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detailKey = null,
    Object? detailTitle = null,
    Object? detailSummary = null,
    Object? contents = null,
  }) {
    return _then(_self.copyWith(
      detailKey: null == detailKey
          ? _self.detailKey
          : detailKey // ignore: cast_nullable_to_non_nullable
              as String,
      detailTitle: null == detailTitle
          ? _self.detailTitle
          : detailTitle // ignore: cast_nullable_to_non_nullable
              as String,
      detailSummary: null == detailSummary
          ? _self.detailSummary
          : detailSummary // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _self.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as Map<String, Content>,
    ));
  }
}

/// Adds pattern-matching-related methods to [DetailCategory].
extension DetailCategoryPatterns on DetailCategory {
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
    TResult Function(_DeteilCategory value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeteilCategory() when $default != null:
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
    TResult Function(_DeteilCategory value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeteilCategory():
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
    TResult? Function(_DeteilCategory value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeteilCategory() when $default != null:
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
    TResult Function(String detailKey, String detailTitle, String detailSummary,
            Map<String, Content> contents)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeteilCategory() when $default != null:
        return $default(_that.detailKey, _that.detailTitle, _that.detailSummary,
            _that.contents);
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
    TResult Function(String detailKey, String detailTitle, String detailSummary,
            Map<String, Content> contents)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeteilCategory():
        return $default(_that.detailKey, _that.detailTitle, _that.detailSummary,
            _that.contents);
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
    TResult? Function(String detailKey, String detailTitle,
            String detailSummary, Map<String, Content> contents)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeteilCategory() when $default != null:
        return $default(_that.detailKey, _that.detailTitle, _that.detailSummary,
            _that.contents);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DeteilCategory implements DetailCategory {
  _DeteilCategory(
      {this.detailKey = '',
      this.detailTitle = '',
      this.detailSummary = '',
      final Map<String, Content> contents = const {}})
      : _contents = contents;
  factory _DeteilCategory.fromJson(Map<String, dynamic> json) =>
      _$DeteilCategoryFromJson(json);

  @override
  @JsonKey()
  final String detailKey;
  @override
  @JsonKey()
  final String detailTitle;
  @override
  @JsonKey()
  final String detailSummary;
  final Map<String, Content> _contents;
  @override
  @JsonKey()
  Map<String, Content> get contents {
    if (_contents is EqualUnmodifiableMapView) return _contents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_contents);
  }

  /// Create a copy of DetailCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeteilCategoryCopyWith<_DeteilCategory> get copyWith =>
      __$DeteilCategoryCopyWithImpl<_DeteilCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DeteilCategoryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeteilCategory &&
            (identical(other.detailKey, detailKey) ||
                other.detailKey == detailKey) &&
            (identical(other.detailTitle, detailTitle) ||
                other.detailTitle == detailTitle) &&
            (identical(other.detailSummary, detailSummary) ||
                other.detailSummary == detailSummary) &&
            const DeepCollectionEquality().equals(other._contents, _contents));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, detailKey, detailTitle,
      detailSummary, const DeepCollectionEquality().hash(_contents));

  @override
  String toString() {
    return 'DetailCategory(detailKey: $detailKey, detailTitle: $detailTitle, detailSummary: $detailSummary, contents: $contents)';
  }
}

/// @nodoc
abstract mixin class _$DeteilCategoryCopyWith<$Res>
    implements $DetailCategoryCopyWith<$Res> {
  factory _$DeteilCategoryCopyWith(
          _DeteilCategory value, $Res Function(_DeteilCategory) _then) =
      __$DeteilCategoryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String detailKey,
      String detailTitle,
      String detailSummary,
      Map<String, Content> contents});
}

/// @nodoc
class __$DeteilCategoryCopyWithImpl<$Res>
    implements _$DeteilCategoryCopyWith<$Res> {
  __$DeteilCategoryCopyWithImpl(this._self, this._then);

  final _DeteilCategory _self;
  final $Res Function(_DeteilCategory) _then;

  /// Create a copy of DetailCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? detailKey = null,
    Object? detailTitle = null,
    Object? detailSummary = null,
    Object? contents = null,
  }) {
    return _then(_DeteilCategory(
      detailKey: null == detailKey
          ? _self.detailKey
          : detailKey // ignore: cast_nullable_to_non_nullable
              as String,
      detailTitle: null == detailTitle
          ? _self.detailTitle
          : detailTitle // ignore: cast_nullable_to_non_nullable
              as String,
      detailSummary: null == detailSummary
          ? _self.detailSummary
          : detailSummary // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _self._contents
          : contents // ignore: cast_nullable_to_non_nullable
              as Map<String, Content>,
    ));
  }
}

/// @nodoc
mixin _$Content {
  String get contentKey;
  String get contentTitle;
  Map<String, Settion> get settions;

  /// Create a copy of Content
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContentCopyWith<Content> get copyWith =>
      _$ContentCopyWithImpl<Content>(this as Content, _$identity);

  /// Serializes this Content to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Content &&
            (identical(other.contentKey, contentKey) ||
                other.contentKey == contentKey) &&
            (identical(other.contentTitle, contentTitle) ||
                other.contentTitle == contentTitle) &&
            const DeepCollectionEquality().equals(other.settions, settions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, contentKey, contentTitle,
      const DeepCollectionEquality().hash(settions));

  @override
  String toString() {
    return 'Content(contentKey: $contentKey, contentTitle: $contentTitle, settions: $settions)';
  }
}

/// @nodoc
abstract mixin class $ContentCopyWith<$Res> {
  factory $ContentCopyWith(Content value, $Res Function(Content) _then) =
      _$ContentCopyWithImpl;
  @useResult
  $Res call(
      {String contentKey, String contentTitle, Map<String, Settion> settions});
}

/// @nodoc
class _$ContentCopyWithImpl<$Res> implements $ContentCopyWith<$Res> {
  _$ContentCopyWithImpl(this._self, this._then);

  final Content _self;
  final $Res Function(Content) _then;

  /// Create a copy of Content
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentKey = null,
    Object? contentTitle = null,
    Object? settions = null,
  }) {
    return _then(_self.copyWith(
      contentKey: null == contentKey
          ? _self.contentKey
          : contentKey // ignore: cast_nullable_to_non_nullable
              as String,
      contentTitle: null == contentTitle
          ? _self.contentTitle
          : contentTitle // ignore: cast_nullable_to_non_nullable
              as String,
      settions: null == settions
          ? _self.settions
          : settions // ignore: cast_nullable_to_non_nullable
              as Map<String, Settion>,
    ));
  }
}

/// Adds pattern-matching-related methods to [Content].
extension ContentPatterns on Content {
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
    TResult Function(_Content value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Content() when $default != null:
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
    TResult Function(_Content value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Content():
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
    TResult? Function(_Content value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Content() when $default != null:
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
    TResult Function(String contentKey, String contentTitle,
            Map<String, Settion> settions)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Content() when $default != null:
        return $default(_that.contentKey, _that.contentTitle, _that.settions);
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
    TResult Function(String contentKey, String contentTitle,
            Map<String, Settion> settions)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Content():
        return $default(_that.contentKey, _that.contentTitle, _that.settions);
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
    TResult? Function(String contentKey, String contentTitle,
            Map<String, Settion> settions)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Content() when $default != null:
        return $default(_that.contentKey, _that.contentTitle, _that.settions);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Content implements Content {
  _Content(
      {this.contentKey = '',
      this.contentTitle = '',
      final Map<String, Settion> settions = const {}})
      : _settions = settions;
  factory _Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  @override
  @JsonKey()
  final String contentKey;
  @override
  @JsonKey()
  final String contentTitle;
  final Map<String, Settion> _settions;
  @override
  @JsonKey()
  Map<String, Settion> get settions {
    if (_settions is EqualUnmodifiableMapView) return _settions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_settions);
  }

  /// Create a copy of Content
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ContentCopyWith<_Content> get copyWith =>
      __$ContentCopyWithImpl<_Content>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ContentToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Content &&
            (identical(other.contentKey, contentKey) ||
                other.contentKey == contentKey) &&
            (identical(other.contentTitle, contentTitle) ||
                other.contentTitle == contentTitle) &&
            const DeepCollectionEquality().equals(other._settions, _settions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, contentKey, contentTitle,
      const DeepCollectionEquality().hash(_settions));

  @override
  String toString() {
    return 'Content(contentKey: $contentKey, contentTitle: $contentTitle, settions: $settions)';
  }
}

/// @nodoc
abstract mixin class _$ContentCopyWith<$Res> implements $ContentCopyWith<$Res> {
  factory _$ContentCopyWith(_Content value, $Res Function(_Content) _then) =
      __$ContentCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String contentKey, String contentTitle, Map<String, Settion> settions});
}

/// @nodoc
class __$ContentCopyWithImpl<$Res> implements _$ContentCopyWith<$Res> {
  __$ContentCopyWithImpl(this._self, this._then);

  final _Content _self;
  final $Res Function(_Content) _then;

  /// Create a copy of Content
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? contentKey = null,
    Object? contentTitle = null,
    Object? settions = null,
  }) {
    return _then(_Content(
      contentKey: null == contentKey
          ? _self.contentKey
          : contentKey // ignore: cast_nullable_to_non_nullable
              as String,
      contentTitle: null == contentTitle
          ? _self.contentTitle
          : contentTitle // ignore: cast_nullable_to_non_nullable
              as String,
      settions: null == settions
          ? _self._settions
          : settions // ignore: cast_nullable_to_non_nullable
              as Map<String, Settion>,
    ));
  }
}

/// @nodoc
mixin _$Settion {
  String get settionTitle;
  String get pdfId;
  String get searchWord;
  String get markdown;
  List<String> get searchKeywords;

  /// Create a copy of Settion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SettionCopyWith<Settion> get copyWith =>
      _$SettionCopyWithImpl<Settion>(this as Settion, _$identity);

  /// Serializes this Settion to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Settion &&
            (identical(other.settionTitle, settionTitle) ||
                other.settionTitle == settionTitle) &&
            (identical(other.pdfId, pdfId) || other.pdfId == pdfId) &&
            (identical(other.searchWord, searchWord) ||
                other.searchWord == searchWord) &&
            (identical(other.markdown, markdown) ||
                other.markdown == markdown) &&
            const DeepCollectionEquality()
                .equals(other.searchKeywords, searchKeywords));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, settionTitle, pdfId, searchWord,
      markdown, const DeepCollectionEquality().hash(searchKeywords));

  @override
  String toString() {
    return 'Settion(settionTitle: $settionTitle, pdfId: $pdfId, searchWord: $searchWord, markdown: $markdown, searchKeywords: $searchKeywords)';
  }
}

/// @nodoc
abstract mixin class $SettionCopyWith<$Res> {
  factory $SettionCopyWith(Settion value, $Res Function(Settion) _then) =
      _$SettionCopyWithImpl;
  @useResult
  $Res call(
      {String settionTitle,
      String pdfId,
      String searchWord,
      String markdown,
      List<String> searchKeywords});
}

/// @nodoc
class _$SettionCopyWithImpl<$Res> implements $SettionCopyWith<$Res> {
  _$SettionCopyWithImpl(this._self, this._then);

  final Settion _self;
  final $Res Function(Settion) _then;

  /// Create a copy of Settion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settionTitle = null,
    Object? pdfId = null,
    Object? searchWord = null,
    Object? markdown = null,
    Object? searchKeywords = null,
  }) {
    return _then(_self.copyWith(
      settionTitle: null == settionTitle
          ? _self.settionTitle
          : settionTitle // ignore: cast_nullable_to_non_nullable
              as String,
      pdfId: null == pdfId
          ? _self.pdfId
          : pdfId // ignore: cast_nullable_to_non_nullable
              as String,
      searchWord: null == searchWord
          ? _self.searchWord
          : searchWord // ignore: cast_nullable_to_non_nullable
              as String,
      markdown: null == markdown
          ? _self.markdown
          : markdown // ignore: cast_nullable_to_non_nullable
              as String,
      searchKeywords: null == searchKeywords
          ? _self.searchKeywords
          : searchKeywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [Settion].
extension SettionPatterns on Settion {
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
    TResult Function(_Settion value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Settion() when $default != null:
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
    TResult Function(_Settion value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Settion():
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
    TResult? Function(_Settion value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Settion() when $default != null:
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
    TResult Function(String settionTitle, String pdfId, String searchWord,
            String markdown, List<String> searchKeywords)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Settion() when $default != null:
        return $default(_that.settionTitle, _that.pdfId, _that.searchWord,
            _that.markdown, _that.searchKeywords);
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
    TResult Function(String settionTitle, String pdfId, String searchWord,
            String markdown, List<String> searchKeywords)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Settion():
        return $default(_that.settionTitle, _that.pdfId, _that.searchWord,
            _that.markdown, _that.searchKeywords);
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
    TResult? Function(String settionTitle, String pdfId, String searchWord,
            String markdown, List<String> searchKeywords)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Settion() when $default != null:
        return $default(_that.settionTitle, _that.pdfId, _that.searchWord,
            _that.markdown, _that.searchKeywords);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Settion implements Settion {
  _Settion(
      {this.settionTitle = '',
      this.pdfId = '',
      this.searchWord = '',
      this.markdown = '',
      final List<String> searchKeywords = const []})
      : _searchKeywords = searchKeywords;
  factory _Settion.fromJson(Map<String, dynamic> json) =>
      _$SettionFromJson(json);

  @override
  @JsonKey()
  final String settionTitle;
  @override
  @JsonKey()
  final String pdfId;
  @override
  @JsonKey()
  final String searchWord;
  @override
  @JsonKey()
  final String markdown;
  final List<String> _searchKeywords;
  @override
  @JsonKey()
  List<String> get searchKeywords {
    if (_searchKeywords is EqualUnmodifiableListView) return _searchKeywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchKeywords);
  }

  /// Create a copy of Settion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SettionCopyWith<_Settion> get copyWith =>
      __$SettionCopyWithImpl<_Settion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SettionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Settion &&
            (identical(other.settionTitle, settionTitle) ||
                other.settionTitle == settionTitle) &&
            (identical(other.pdfId, pdfId) || other.pdfId == pdfId) &&
            (identical(other.searchWord, searchWord) ||
                other.searchWord == searchWord) &&
            (identical(other.markdown, markdown) ||
                other.markdown == markdown) &&
            const DeepCollectionEquality()
                .equals(other._searchKeywords, _searchKeywords));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, settionTitle, pdfId, searchWord,
      markdown, const DeepCollectionEquality().hash(_searchKeywords));

  @override
  String toString() {
    return 'Settion(settionTitle: $settionTitle, pdfId: $pdfId, searchWord: $searchWord, markdown: $markdown, searchKeywords: $searchKeywords)';
  }
}

/// @nodoc
abstract mixin class _$SettionCopyWith<$Res> implements $SettionCopyWith<$Res> {
  factory _$SettionCopyWith(_Settion value, $Res Function(_Settion) _then) =
      __$SettionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String settionTitle,
      String pdfId,
      String searchWord,
      String markdown,
      List<String> searchKeywords});
}

/// @nodoc
class __$SettionCopyWithImpl<$Res> implements _$SettionCopyWith<$Res> {
  __$SettionCopyWithImpl(this._self, this._then);

  final _Settion _self;
  final $Res Function(_Settion) _then;

  /// Create a copy of Settion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? settionTitle = null,
    Object? pdfId = null,
    Object? searchWord = null,
    Object? markdown = null,
    Object? searchKeywords = null,
  }) {
    return _then(_Settion(
      settionTitle: null == settionTitle
          ? _self.settionTitle
          : settionTitle // ignore: cast_nullable_to_non_nullable
              as String,
      pdfId: null == pdfId
          ? _self.pdfId
          : pdfId // ignore: cast_nullable_to_non_nullable
              as String,
      searchWord: null == searchWord
          ? _self.searchWord
          : searchWord // ignore: cast_nullable_to_non_nullable
              as String,
      markdown: null == markdown
          ? _self.markdown
          : markdown // ignore: cast_nullable_to_non_nullable
              as String,
      searchKeywords: null == searchKeywords
          ? _self._searchKeywords
          : searchKeywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
