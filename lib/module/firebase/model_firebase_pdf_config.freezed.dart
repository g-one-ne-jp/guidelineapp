// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model_firebase_pdf_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ModelFirebasePdfConfig _$ModelFirebasePdfConfigFromJson(
    Map<String, dynamic> json) {
  return _ModelFirebasePdfConfig.fromJson(json);
}

/// @nodoc
mixin _$ModelFirebasePdfConfig {
  Map<String, MajorCategory> get categories =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModelFirebasePdfConfigCopyWith<ModelFirebasePdfConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelFirebasePdfConfigCopyWith<$Res> {
  factory $ModelFirebasePdfConfigCopyWith(ModelFirebasePdfConfig value,
          $Res Function(ModelFirebasePdfConfig) then) =
      _$ModelFirebasePdfConfigCopyWithImpl<$Res, ModelFirebasePdfConfig>;
  @useResult
  $Res call({Map<String, MajorCategory> categories});
}

/// @nodoc
class _$ModelFirebasePdfConfigCopyWithImpl<$Res,
        $Val extends ModelFirebasePdfConfig>
    implements $ModelFirebasePdfConfigCopyWith<$Res> {
  _$ModelFirebasePdfConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as Map<String, MajorCategory>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ModelFirebasePdfConfigImplCopyWith<$Res>
    implements $ModelFirebasePdfConfigCopyWith<$Res> {
  factory _$$ModelFirebasePdfConfigImplCopyWith(
          _$ModelFirebasePdfConfigImpl value,
          $Res Function(_$ModelFirebasePdfConfigImpl) then) =
      __$$ModelFirebasePdfConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, MajorCategory> categories});
}

/// @nodoc
class __$$ModelFirebasePdfConfigImplCopyWithImpl<$Res>
    extends _$ModelFirebasePdfConfigCopyWithImpl<$Res,
        _$ModelFirebasePdfConfigImpl>
    implements _$$ModelFirebasePdfConfigImplCopyWith<$Res> {
  __$$ModelFirebasePdfConfigImplCopyWithImpl(
      _$ModelFirebasePdfConfigImpl _value,
      $Res Function(_$ModelFirebasePdfConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_$ModelFirebasePdfConfigImpl(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as Map<String, MajorCategory>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ModelFirebasePdfConfigImpl implements _ModelFirebasePdfConfig {
  _$ModelFirebasePdfConfigImpl(
      {final Map<String, MajorCategory> categories = const {}})
      : _categories = categories;

  factory _$ModelFirebasePdfConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModelFirebasePdfConfigImplFromJson(json);

  final Map<String, MajorCategory> _categories;
  @override
  @JsonKey()
  Map<String, MajorCategory> get categories {
    if (_categories is EqualUnmodifiableMapView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categories);
  }

  @override
  String toString() {
    return 'ModelFirebasePdfConfig(categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModelFirebasePdfConfigImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ModelFirebasePdfConfigImplCopyWith<_$ModelFirebasePdfConfigImpl>
      get copyWith => __$$ModelFirebasePdfConfigImplCopyWithImpl<
          _$ModelFirebasePdfConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModelFirebasePdfConfigImplToJson(
      this,
    );
  }
}

abstract class _ModelFirebasePdfConfig implements ModelFirebasePdfConfig {
  factory _ModelFirebasePdfConfig(
          {final Map<String, MajorCategory> categories}) =
      _$ModelFirebasePdfConfigImpl;

  factory _ModelFirebasePdfConfig.fromJson(Map<String, dynamic> json) =
      _$ModelFirebasePdfConfigImpl.fromJson;

  @override
  Map<String, MajorCategory> get categories;
  @override
  @JsonKey(ignore: true)
  _$$ModelFirebasePdfConfigImplCopyWith<_$ModelFirebasePdfConfigImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MajorCategory _$MajorCategoryFromJson(Map<String, dynamic> json) {
  return _MajorCategory.fromJson(json);
}

/// @nodoc
mixin _$MajorCategory {
  String get majorKey => throw _privateConstructorUsedError;
  String get majorTitle => throw _privateConstructorUsedError;
  String get majorSummary => throw _privateConstructorUsedError;
  Map<String, SubCategory> get subs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MajorCategoryCopyWith<MajorCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MajorCategoryCopyWith<$Res> {
  factory $MajorCategoryCopyWith(
          MajorCategory value, $Res Function(MajorCategory) then) =
      _$MajorCategoryCopyWithImpl<$Res, MajorCategory>;
  @useResult
  $Res call(
      {String majorKey,
      String majorTitle,
      String majorSummary,
      Map<String, SubCategory> subs});
}

/// @nodoc
class _$MajorCategoryCopyWithImpl<$Res, $Val extends MajorCategory>
    implements $MajorCategoryCopyWith<$Res> {
  _$MajorCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? majorKey = null,
    Object? majorTitle = null,
    Object? majorSummary = null,
    Object? subs = null,
  }) {
    return _then(_value.copyWith(
      majorKey: null == majorKey
          ? _value.majorKey
          : majorKey // ignore: cast_nullable_to_non_nullable
              as String,
      majorTitle: null == majorTitle
          ? _value.majorTitle
          : majorTitle // ignore: cast_nullable_to_non_nullable
              as String,
      majorSummary: null == majorSummary
          ? _value.majorSummary
          : majorSummary // ignore: cast_nullable_to_non_nullable
              as String,
      subs: null == subs
          ? _value.subs
          : subs // ignore: cast_nullable_to_non_nullable
              as Map<String, SubCategory>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MajorCategoryImplCopyWith<$Res>
    implements $MajorCategoryCopyWith<$Res> {
  factory _$$MajorCategoryImplCopyWith(
          _$MajorCategoryImpl value, $Res Function(_$MajorCategoryImpl) then) =
      __$$MajorCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String majorKey,
      String majorTitle,
      String majorSummary,
      Map<String, SubCategory> subs});
}

/// @nodoc
class __$$MajorCategoryImplCopyWithImpl<$Res>
    extends _$MajorCategoryCopyWithImpl<$Res, _$MajorCategoryImpl>
    implements _$$MajorCategoryImplCopyWith<$Res> {
  __$$MajorCategoryImplCopyWithImpl(
      _$MajorCategoryImpl _value, $Res Function(_$MajorCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? majorKey = null,
    Object? majorTitle = null,
    Object? majorSummary = null,
    Object? subs = null,
  }) {
    return _then(_$MajorCategoryImpl(
      majorKey: null == majorKey
          ? _value.majorKey
          : majorKey // ignore: cast_nullable_to_non_nullable
              as String,
      majorTitle: null == majorTitle
          ? _value.majorTitle
          : majorTitle // ignore: cast_nullable_to_non_nullable
              as String,
      majorSummary: null == majorSummary
          ? _value.majorSummary
          : majorSummary // ignore: cast_nullable_to_non_nullable
              as String,
      subs: null == subs
          ? _value._subs
          : subs // ignore: cast_nullable_to_non_nullable
              as Map<String, SubCategory>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MajorCategoryImpl implements _MajorCategory {
  _$MajorCategoryImpl(
      {this.majorKey = '',
      this.majorTitle = '',
      this.majorSummary = '',
      final Map<String, SubCategory> subs = const {}})
      : _subs = subs;

  factory _$MajorCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$MajorCategoryImplFromJson(json);

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

  @override
  String toString() {
    return 'MajorCategory(majorKey: $majorKey, majorTitle: $majorTitle, majorSummary: $majorSummary, subs: $subs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MajorCategoryImpl &&
            (identical(other.majorKey, majorKey) ||
                other.majorKey == majorKey) &&
            (identical(other.majorTitle, majorTitle) ||
                other.majorTitle == majorTitle) &&
            (identical(other.majorSummary, majorSummary) ||
                other.majorSummary == majorSummary) &&
            const DeepCollectionEquality().equals(other._subs, _subs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, majorKey, majorTitle,
      majorSummary, const DeepCollectionEquality().hash(_subs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MajorCategoryImplCopyWith<_$MajorCategoryImpl> get copyWith =>
      __$$MajorCategoryImplCopyWithImpl<_$MajorCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MajorCategoryImplToJson(
      this,
    );
  }
}

abstract class _MajorCategory implements MajorCategory {
  factory _MajorCategory(
      {final String majorKey,
      final String majorTitle,
      final String majorSummary,
      final Map<String, SubCategory> subs}) = _$MajorCategoryImpl;

  factory _MajorCategory.fromJson(Map<String, dynamic> json) =
      _$MajorCategoryImpl.fromJson;

  @override
  String get majorKey;
  @override
  String get majorTitle;
  @override
  String get majorSummary;
  @override
  Map<String, SubCategory> get subs;
  @override
  @JsonKey(ignore: true)
  _$$MajorCategoryImplCopyWith<_$MajorCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubCategory _$SubCategoryFromJson(Map<String, dynamic> json) {
  return _SubCategory.fromJson(json);
}

/// @nodoc
mixin _$SubCategory {
  String get subKey => throw _privateConstructorUsedError;
  String get subTitle => throw _privateConstructorUsedError;
  String get subSummary => throw _privateConstructorUsedError;
  Map<String, MinorCategory> get minors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubCategoryCopyWith<SubCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubCategoryCopyWith<$Res> {
  factory $SubCategoryCopyWith(
          SubCategory value, $Res Function(SubCategory) then) =
      _$SubCategoryCopyWithImpl<$Res, SubCategory>;
  @useResult
  $Res call(
      {String subKey,
      String subTitle,
      String subSummary,
      Map<String, MinorCategory> minors});
}

/// @nodoc
class _$SubCategoryCopyWithImpl<$Res, $Val extends SubCategory>
    implements $SubCategoryCopyWith<$Res> {
  _$SubCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subKey = null,
    Object? subTitle = null,
    Object? subSummary = null,
    Object? minors = null,
  }) {
    return _then(_value.copyWith(
      subKey: null == subKey
          ? _value.subKey
          : subKey // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      subSummary: null == subSummary
          ? _value.subSummary
          : subSummary // ignore: cast_nullable_to_non_nullable
              as String,
      minors: null == minors
          ? _value.minors
          : minors // ignore: cast_nullable_to_non_nullable
              as Map<String, MinorCategory>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubCategoryImplCopyWith<$Res>
    implements $SubCategoryCopyWith<$Res> {
  factory _$$SubCategoryImplCopyWith(
          _$SubCategoryImpl value, $Res Function(_$SubCategoryImpl) then) =
      __$$SubCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String subKey,
      String subTitle,
      String subSummary,
      Map<String, MinorCategory> minors});
}

/// @nodoc
class __$$SubCategoryImplCopyWithImpl<$Res>
    extends _$SubCategoryCopyWithImpl<$Res, _$SubCategoryImpl>
    implements _$$SubCategoryImplCopyWith<$Res> {
  __$$SubCategoryImplCopyWithImpl(
      _$SubCategoryImpl _value, $Res Function(_$SubCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subKey = null,
    Object? subTitle = null,
    Object? subSummary = null,
    Object? minors = null,
  }) {
    return _then(_$SubCategoryImpl(
      subKey: null == subKey
          ? _value.subKey
          : subKey // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      subSummary: null == subSummary
          ? _value.subSummary
          : subSummary // ignore: cast_nullable_to_non_nullable
              as String,
      minors: null == minors
          ? _value._minors
          : minors // ignore: cast_nullable_to_non_nullable
              as Map<String, MinorCategory>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubCategoryImpl implements _SubCategory {
  _$SubCategoryImpl(
      {this.subKey = '',
      this.subTitle = '',
      this.subSummary = '',
      final Map<String, MinorCategory> minors = const {}})
      : _minors = minors;

  factory _$SubCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubCategoryImplFromJson(json);

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

  @override
  String toString() {
    return 'SubCategory(subKey: $subKey, subTitle: $subTitle, subSummary: $subSummary, minors: $minors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubCategoryImpl &&
            (identical(other.subKey, subKey) || other.subKey == subKey) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.subSummary, subSummary) ||
                other.subSummary == subSummary) &&
            const DeepCollectionEquality().equals(other._minors, _minors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, subKey, subTitle, subSummary,
      const DeepCollectionEquality().hash(_minors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubCategoryImplCopyWith<_$SubCategoryImpl> get copyWith =>
      __$$SubCategoryImplCopyWithImpl<_$SubCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubCategoryImplToJson(
      this,
    );
  }
}

abstract class _SubCategory implements SubCategory {
  factory _SubCategory(
      {final String subKey,
      final String subTitle,
      final String subSummary,
      final Map<String, MinorCategory> minors}) = _$SubCategoryImpl;

  factory _SubCategory.fromJson(Map<String, dynamic> json) =
      _$SubCategoryImpl.fromJson;

  @override
  String get subKey;
  @override
  String get subTitle;
  @override
  String get subSummary;
  @override
  Map<String, MinorCategory> get minors;
  @override
  @JsonKey(ignore: true)
  _$$SubCategoryImplCopyWith<_$SubCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MinorCategory _$MinorCategoryFromJson(Map<String, dynamic> json) {
  return _MinorCategory.fromJson(json);
}

/// @nodoc
mixin _$MinorCategory {
  String get mainorKey => throw _privateConstructorUsedError;
  String get minorTitle => throw _privateConstructorUsedError;
  String get minorSummary => throw _privateConstructorUsedError;
  Map<String, DetailCategory> get details => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MinorCategoryCopyWith<MinorCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MinorCategoryCopyWith<$Res> {
  factory $MinorCategoryCopyWith(
          MinorCategory value, $Res Function(MinorCategory) then) =
      _$MinorCategoryCopyWithImpl<$Res, MinorCategory>;
  @useResult
  $Res call(
      {String mainorKey,
      String minorTitle,
      String minorSummary,
      Map<String, DetailCategory> details});
}

/// @nodoc
class _$MinorCategoryCopyWithImpl<$Res, $Val extends MinorCategory>
    implements $MinorCategoryCopyWith<$Res> {
  _$MinorCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainorKey = null,
    Object? minorTitle = null,
    Object? minorSummary = null,
    Object? details = null,
  }) {
    return _then(_value.copyWith(
      mainorKey: null == mainorKey
          ? _value.mainorKey
          : mainorKey // ignore: cast_nullable_to_non_nullable
              as String,
      minorTitle: null == minorTitle
          ? _value.minorTitle
          : minorTitle // ignore: cast_nullable_to_non_nullable
              as String,
      minorSummary: null == minorSummary
          ? _value.minorSummary
          : minorSummary // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, DetailCategory>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MinorCategoryImplCopyWith<$Res>
    implements $MinorCategoryCopyWith<$Res> {
  factory _$$MinorCategoryImplCopyWith(
          _$MinorCategoryImpl value, $Res Function(_$MinorCategoryImpl) then) =
      __$$MinorCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String mainorKey,
      String minorTitle,
      String minorSummary,
      Map<String, DetailCategory> details});
}

/// @nodoc
class __$$MinorCategoryImplCopyWithImpl<$Res>
    extends _$MinorCategoryCopyWithImpl<$Res, _$MinorCategoryImpl>
    implements _$$MinorCategoryImplCopyWith<$Res> {
  __$$MinorCategoryImplCopyWithImpl(
      _$MinorCategoryImpl _value, $Res Function(_$MinorCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainorKey = null,
    Object? minorTitle = null,
    Object? minorSummary = null,
    Object? details = null,
  }) {
    return _then(_$MinorCategoryImpl(
      mainorKey: null == mainorKey
          ? _value.mainorKey
          : mainorKey // ignore: cast_nullable_to_non_nullable
              as String,
      minorTitle: null == minorTitle
          ? _value.minorTitle
          : minorTitle // ignore: cast_nullable_to_non_nullable
              as String,
      minorSummary: null == minorSummary
          ? _value.minorSummary
          : minorSummary // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, DetailCategory>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MinorCategoryImpl implements _MinorCategory {
  _$MinorCategoryImpl(
      {this.mainorKey = '',
      this.minorTitle = '',
      this.minorSummary = '',
      final Map<String, DetailCategory> details = const {}})
      : _details = details;

  factory _$MinorCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$MinorCategoryImplFromJson(json);

  @override
  @JsonKey()
  final String mainorKey;
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

  @override
  String toString() {
    return 'MinorCategory(mainorKey: $mainorKey, minorTitle: $minorTitle, minorSummary: $minorSummary, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MinorCategoryImpl &&
            (identical(other.mainorKey, mainorKey) ||
                other.mainorKey == mainorKey) &&
            (identical(other.minorTitle, minorTitle) ||
                other.minorTitle == minorTitle) &&
            (identical(other.minorSummary, minorSummary) ||
                other.minorSummary == minorSummary) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mainorKey, minorTitle,
      minorSummary, const DeepCollectionEquality().hash(_details));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MinorCategoryImplCopyWith<_$MinorCategoryImpl> get copyWith =>
      __$$MinorCategoryImplCopyWithImpl<_$MinorCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MinorCategoryImplToJson(
      this,
    );
  }
}

abstract class _MinorCategory implements MinorCategory {
  factory _MinorCategory(
      {final String mainorKey,
      final String minorTitle,
      final String minorSummary,
      final Map<String, DetailCategory> details}) = _$MinorCategoryImpl;

  factory _MinorCategory.fromJson(Map<String, dynamic> json) =
      _$MinorCategoryImpl.fromJson;

  @override
  String get mainorKey;
  @override
  String get minorTitle;
  @override
  String get minorSummary;
  @override
  Map<String, DetailCategory> get details;
  @override
  @JsonKey(ignore: true)
  _$$MinorCategoryImplCopyWith<_$MinorCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DetailCategory _$DetailCategoryFromJson(Map<String, dynamic> json) {
  return _DeteilCategory.fromJson(json);
}

/// @nodoc
mixin _$DetailCategory {
  String get detailKey => throw _privateConstructorUsedError;
  String get detailTitle => throw _privateConstructorUsedError;
  String get detailSummary => throw _privateConstructorUsedError;
  Map<String, Content> get contents => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailCategoryCopyWith<DetailCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailCategoryCopyWith<$Res> {
  factory $DetailCategoryCopyWith(
          DetailCategory value, $Res Function(DetailCategory) then) =
      _$DetailCategoryCopyWithImpl<$Res, DetailCategory>;
  @useResult
  $Res call(
      {String detailKey,
      String detailTitle,
      String detailSummary,
      Map<String, Content> contents});
}

/// @nodoc
class _$DetailCategoryCopyWithImpl<$Res, $Val extends DetailCategory>
    implements $DetailCategoryCopyWith<$Res> {
  _$DetailCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detailKey = null,
    Object? detailTitle = null,
    Object? detailSummary = null,
    Object? contents = null,
  }) {
    return _then(_value.copyWith(
      detailKey: null == detailKey
          ? _value.detailKey
          : detailKey // ignore: cast_nullable_to_non_nullable
              as String,
      detailTitle: null == detailTitle
          ? _value.detailTitle
          : detailTitle // ignore: cast_nullable_to_non_nullable
              as String,
      detailSummary: null == detailSummary
          ? _value.detailSummary
          : detailSummary // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as Map<String, Content>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeteilCategoryImplCopyWith<$Res>
    implements $DetailCategoryCopyWith<$Res> {
  factory _$$DeteilCategoryImplCopyWith(_$DeteilCategoryImpl value,
          $Res Function(_$DeteilCategoryImpl) then) =
      __$$DeteilCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String detailKey,
      String detailTitle,
      String detailSummary,
      Map<String, Content> contents});
}

/// @nodoc
class __$$DeteilCategoryImplCopyWithImpl<$Res>
    extends _$DetailCategoryCopyWithImpl<$Res, _$DeteilCategoryImpl>
    implements _$$DeteilCategoryImplCopyWith<$Res> {
  __$$DeteilCategoryImplCopyWithImpl(
      _$DeteilCategoryImpl _value, $Res Function(_$DeteilCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detailKey = null,
    Object? detailTitle = null,
    Object? detailSummary = null,
    Object? contents = null,
  }) {
    return _then(_$DeteilCategoryImpl(
      detailKey: null == detailKey
          ? _value.detailKey
          : detailKey // ignore: cast_nullable_to_non_nullable
              as String,
      detailTitle: null == detailTitle
          ? _value.detailTitle
          : detailTitle // ignore: cast_nullable_to_non_nullable
              as String,
      detailSummary: null == detailSummary
          ? _value.detailSummary
          : detailSummary // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value._contents
          : contents // ignore: cast_nullable_to_non_nullable
              as Map<String, Content>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeteilCategoryImpl implements _DeteilCategory {
  _$DeteilCategoryImpl(
      {this.detailKey = '',
      this.detailTitle = '',
      this.detailSummary = '',
      final Map<String, Content> contents = const {}})
      : _contents = contents;

  factory _$DeteilCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeteilCategoryImplFromJson(json);

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

  @override
  String toString() {
    return 'DetailCategory(detailKey: $detailKey, detailTitle: $detailTitle, detailSummary: $detailSummary, contents: $contents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeteilCategoryImpl &&
            (identical(other.detailKey, detailKey) ||
                other.detailKey == detailKey) &&
            (identical(other.detailTitle, detailTitle) ||
                other.detailTitle == detailTitle) &&
            (identical(other.detailSummary, detailSummary) ||
                other.detailSummary == detailSummary) &&
            const DeepCollectionEquality().equals(other._contents, _contents));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, detailKey, detailTitle,
      detailSummary, const DeepCollectionEquality().hash(_contents));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeteilCategoryImplCopyWith<_$DeteilCategoryImpl> get copyWith =>
      __$$DeteilCategoryImplCopyWithImpl<_$DeteilCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeteilCategoryImplToJson(
      this,
    );
  }
}

abstract class _DeteilCategory implements DetailCategory {
  factory _DeteilCategory(
      {final String detailKey,
      final String detailTitle,
      final String detailSummary,
      final Map<String, Content> contents}) = _$DeteilCategoryImpl;

  factory _DeteilCategory.fromJson(Map<String, dynamic> json) =
      _$DeteilCategoryImpl.fromJson;

  @override
  String get detailKey;
  @override
  String get detailTitle;
  @override
  String get detailSummary;
  @override
  Map<String, Content> get contents;
  @override
  @JsonKey(ignore: true)
  _$$DeteilCategoryImplCopyWith<_$DeteilCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Content _$ContentFromJson(Map<String, dynamic> json) {
  return _Content.fromJson(json);
}

/// @nodoc
mixin _$Content {
  String get contentKey => throw _privateConstructorUsedError;
  String get contentTitle => throw _privateConstructorUsedError;
  Map<String, Settion> get settions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentCopyWith<Content> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentCopyWith<$Res> {
  factory $ContentCopyWith(Content value, $Res Function(Content) then) =
      _$ContentCopyWithImpl<$Res, Content>;
  @useResult
  $Res call(
      {String contentKey, String contentTitle, Map<String, Settion> settions});
}

/// @nodoc
class _$ContentCopyWithImpl<$Res, $Val extends Content>
    implements $ContentCopyWith<$Res> {
  _$ContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentKey = null,
    Object? contentTitle = null,
    Object? settions = null,
  }) {
    return _then(_value.copyWith(
      contentKey: null == contentKey
          ? _value.contentKey
          : contentKey // ignore: cast_nullable_to_non_nullable
              as String,
      contentTitle: null == contentTitle
          ? _value.contentTitle
          : contentTitle // ignore: cast_nullable_to_non_nullable
              as String,
      settions: null == settions
          ? _value.settions
          : settions // ignore: cast_nullable_to_non_nullable
              as Map<String, Settion>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentImplCopyWith<$Res> implements $ContentCopyWith<$Res> {
  factory _$$ContentImplCopyWith(
          _$ContentImpl value, $Res Function(_$ContentImpl) then) =
      __$$ContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String contentKey, String contentTitle, Map<String, Settion> settions});
}

/// @nodoc
class __$$ContentImplCopyWithImpl<$Res>
    extends _$ContentCopyWithImpl<$Res, _$ContentImpl>
    implements _$$ContentImplCopyWith<$Res> {
  __$$ContentImplCopyWithImpl(
      _$ContentImpl _value, $Res Function(_$ContentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentKey = null,
    Object? contentTitle = null,
    Object? settions = null,
  }) {
    return _then(_$ContentImpl(
      contentKey: null == contentKey
          ? _value.contentKey
          : contentKey // ignore: cast_nullable_to_non_nullable
              as String,
      contentTitle: null == contentTitle
          ? _value.contentTitle
          : contentTitle // ignore: cast_nullable_to_non_nullable
              as String,
      settions: null == settions
          ? _value._settions
          : settions // ignore: cast_nullable_to_non_nullable
              as Map<String, Settion>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentImpl implements _Content {
  _$ContentImpl(
      {this.contentKey = '',
      this.contentTitle = '',
      final Map<String, Settion> settions = const {}})
      : _settions = settions;

  factory _$ContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentImplFromJson(json);

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

  @override
  String toString() {
    return 'Content(contentKey: $contentKey, contentTitle: $contentTitle, settions: $settions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentImpl &&
            (identical(other.contentKey, contentKey) ||
                other.contentKey == contentKey) &&
            (identical(other.contentTitle, contentTitle) ||
                other.contentTitle == contentTitle) &&
            const DeepCollectionEquality().equals(other._settions, _settions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, contentKey, contentTitle,
      const DeepCollectionEquality().hash(_settions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentImplCopyWith<_$ContentImpl> get copyWith =>
      __$$ContentImplCopyWithImpl<_$ContentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentImplToJson(
      this,
    );
  }
}

abstract class _Content implements Content {
  factory _Content(
      {final String contentKey,
      final String contentTitle,
      final Map<String, Settion> settions}) = _$ContentImpl;

  factory _Content.fromJson(Map<String, dynamic> json) = _$ContentImpl.fromJson;

  @override
  String get contentKey;
  @override
  String get contentTitle;
  @override
  Map<String, Settion> get settions;
  @override
  @JsonKey(ignore: true)
  _$$ContentImplCopyWith<_$ContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Settion _$SettionFromJson(Map<String, dynamic> json) {
  return _Settion.fromJson(json);
}

/// @nodoc
mixin _$Settion {
  String get settionTitle => throw _privateConstructorUsedError;
  String get pdfId => throw _privateConstructorUsedError;
  String get markdown => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettionCopyWith<Settion> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettionCopyWith<$Res> {
  factory $SettionCopyWith(Settion value, $Res Function(Settion) then) =
      _$SettionCopyWithImpl<$Res, Settion>;
  @useResult
  $Res call({String settionTitle, String pdfId, String markdown});
}

/// @nodoc
class _$SettionCopyWithImpl<$Res, $Val extends Settion>
    implements $SettionCopyWith<$Res> {
  _$SettionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settionTitle = null,
    Object? pdfId = null,
    Object? markdown = null,
  }) {
    return _then(_value.copyWith(
      settionTitle: null == settionTitle
          ? _value.settionTitle
          : settionTitle // ignore: cast_nullable_to_non_nullable
              as String,
      pdfId: null == pdfId
          ? _value.pdfId
          : pdfId // ignore: cast_nullable_to_non_nullable
              as String,
      markdown: null == markdown
          ? _value.markdown
          : markdown // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettionImplCopyWith<$Res> implements $SettionCopyWith<$Res> {
  factory _$$SettionImplCopyWith(
          _$SettionImpl value, $Res Function(_$SettionImpl) then) =
      __$$SettionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String settionTitle, String pdfId, String markdown});
}

/// @nodoc
class __$$SettionImplCopyWithImpl<$Res>
    extends _$SettionCopyWithImpl<$Res, _$SettionImpl>
    implements _$$SettionImplCopyWith<$Res> {
  __$$SettionImplCopyWithImpl(
      _$SettionImpl _value, $Res Function(_$SettionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settionTitle = null,
    Object? pdfId = null,
    Object? markdown = null,
  }) {
    return _then(_$SettionImpl(
      settionTitle: null == settionTitle
          ? _value.settionTitle
          : settionTitle // ignore: cast_nullable_to_non_nullable
              as String,
      pdfId: null == pdfId
          ? _value.pdfId
          : pdfId // ignore: cast_nullable_to_non_nullable
              as String,
      markdown: null == markdown
          ? _value.markdown
          : markdown // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SettionImpl implements _Settion {
  _$SettionImpl({this.settionTitle = '', this.pdfId = '', this.markdown = ''});

  factory _$SettionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettionImplFromJson(json);

  @override
  @JsonKey()
  final String settionTitle;
  @override
  @JsonKey()
  final String pdfId;
  @override
  @JsonKey()
  final String markdown;

  @override
  String toString() {
    return 'Settion(settionTitle: $settionTitle, pdfId: $pdfId, markdown: $markdown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettionImpl &&
            (identical(other.settionTitle, settionTitle) ||
                other.settionTitle == settionTitle) &&
            (identical(other.pdfId, pdfId) || other.pdfId == pdfId) &&
            (identical(other.markdown, markdown) ||
                other.markdown == markdown));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, settionTitle, pdfId, markdown);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettionImplCopyWith<_$SettionImpl> get copyWith =>
      __$$SettionImplCopyWithImpl<_$SettionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SettionImplToJson(
      this,
    );
  }
}

abstract class _Settion implements Settion {
  factory _Settion(
      {final String settionTitle,
      final String pdfId,
      final String markdown}) = _$SettionImpl;

  factory _Settion.fromJson(Map<String, dynamic> json) = _$SettionImpl.fromJson;

  @override
  String get settionTitle;
  @override
  String get pdfId;
  @override
  String get markdown;
  @override
  @JsonKey(ignore: true)
  _$$SettionImplCopyWith<_$SettionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
