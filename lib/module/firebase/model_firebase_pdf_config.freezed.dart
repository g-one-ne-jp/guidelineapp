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
  String get id => throw _privateConstructorUsedError;
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
      {String id,
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
    Object? id = null,
    Object? majorTitle = null,
    Object? majorSummary = null,
    Object? subs = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      {String id,
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
    Object? id = null,
    Object? majorTitle = null,
    Object? majorSummary = null,
    Object? subs = null,
  }) {
    return _then(_$MajorCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      {this.id = '',
      this.majorTitle = '',
      this.majorSummary = '',
      final Map<String, SubCategory> subs = const {}})
      : _subs = subs;

  factory _$MajorCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$MajorCategoryImplFromJson(json);

  @override
  @JsonKey()
  final String id;
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
    return 'MajorCategory(id: $id, majorTitle: $majorTitle, majorSummary: $majorSummary, subs: $subs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MajorCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.majorTitle, majorTitle) ||
                other.majorTitle == majorTitle) &&
            (identical(other.majorSummary, majorSummary) ||
                other.majorSummary == majorSummary) &&
            const DeepCollectionEquality().equals(other._subs, _subs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, majorTitle, majorSummary,
      const DeepCollectionEquality().hash(_subs));

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
      {final String id,
      final String majorTitle,
      final String majorSummary,
      final Map<String, SubCategory> subs}) = _$MajorCategoryImpl;

  factory _MajorCategory.fromJson(Map<String, dynamic> json) =
      _$MajorCategoryImpl.fromJson;

  @override
  String get id;
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
  String get id => throw _privateConstructorUsedError;
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
      {String id,
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
    Object? id = null,
    Object? subTitle = null,
    Object? subSummary = null,
    Object? minors = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      {String id,
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
    Object? id = null,
    Object? subTitle = null,
    Object? subSummary = null,
    Object? minors = null,
  }) {
    return _then(_$SubCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      {this.id = '',
      this.subTitle = '',
      this.subSummary = '',
      final Map<String, MinorCategory> minors = const {}})
      : _minors = minors;

  factory _$SubCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubCategoryImplFromJson(json);

  @override
  @JsonKey()
  final String id;
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
    return 'SubCategory(id: $id, subTitle: $subTitle, subSummary: $subSummary, minors: $minors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.subSummary, subSummary) ||
                other.subSummary == subSummary) &&
            const DeepCollectionEquality().equals(other._minors, _minors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, subTitle, subSummary,
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
      {final String id,
      final String subTitle,
      final String subSummary,
      final Map<String, MinorCategory> minors}) = _$SubCategoryImpl;

  factory _SubCategory.fromJson(Map<String, dynamic> json) =
      _$SubCategoryImpl.fromJson;

  @override
  String get id;
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
  String get id => throw _privateConstructorUsedError;
  String get minorTitle => throw _privateConstructorUsedError;
  String get minorSummary => throw _privateConstructorUsedError;
  String get markdown => throw _privateConstructorUsedError;
  String get pdfId => throw _privateConstructorUsedError;

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
      {String id,
      String minorTitle,
      String minorSummary,
      String markdown,
      String pdfId});
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
    Object? id = null,
    Object? minorTitle = null,
    Object? minorSummary = null,
    Object? markdown = null,
    Object? pdfId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      minorTitle: null == minorTitle
          ? _value.minorTitle
          : minorTitle // ignore: cast_nullable_to_non_nullable
              as String,
      minorSummary: null == minorSummary
          ? _value.minorSummary
          : minorSummary // ignore: cast_nullable_to_non_nullable
              as String,
      markdown: null == markdown
          ? _value.markdown
          : markdown // ignore: cast_nullable_to_non_nullable
              as String,
      pdfId: null == pdfId
          ? _value.pdfId
          : pdfId // ignore: cast_nullable_to_non_nullable
              as String,
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
      {String id,
      String minorTitle,
      String minorSummary,
      String markdown,
      String pdfId});
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
    Object? id = null,
    Object? minorTitle = null,
    Object? minorSummary = null,
    Object? markdown = null,
    Object? pdfId = null,
  }) {
    return _then(_$MinorCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      minorTitle: null == minorTitle
          ? _value.minorTitle
          : minorTitle // ignore: cast_nullable_to_non_nullable
              as String,
      minorSummary: null == minorSummary
          ? _value.minorSummary
          : minorSummary // ignore: cast_nullable_to_non_nullable
              as String,
      markdown: null == markdown
          ? _value.markdown
          : markdown // ignore: cast_nullable_to_non_nullable
              as String,
      pdfId: null == pdfId
          ? _value.pdfId
          : pdfId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MinorCategoryImpl implements _MinorCategory {
  _$MinorCategoryImpl(
      {this.id = '',
      this.minorTitle = '',
      this.minorSummary = '',
      this.markdown = '',
      this.pdfId = ''});

  factory _$MinorCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$MinorCategoryImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String minorTitle;
  @override
  @JsonKey()
  final String minorSummary;
  @override
  @JsonKey()
  final String markdown;
  @override
  @JsonKey()
  final String pdfId;

  @override
  String toString() {
    return 'MinorCategory(id: $id, minorTitle: $minorTitle, minorSummary: $minorSummary, markdown: $markdown, pdfId: $pdfId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MinorCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.minorTitle, minorTitle) ||
                other.minorTitle == minorTitle) &&
            (identical(other.minorSummary, minorSummary) ||
                other.minorSummary == minorSummary) &&
            (identical(other.markdown, markdown) ||
                other.markdown == markdown) &&
            (identical(other.pdfId, pdfId) || other.pdfId == pdfId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, minorTitle, minorSummary, markdown, pdfId);

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
      {final String id,
      final String minorTitle,
      final String minorSummary,
      final String markdown,
      final String pdfId}) = _$MinorCategoryImpl;

  factory _MinorCategory.fromJson(Map<String, dynamic> json) =
      _$MinorCategoryImpl.fromJson;

  @override
  String get id;
  @override
  String get minorTitle;
  @override
  String get minorSummary;
  @override
  String get markdown;
  @override
  String get pdfId;
  @override
  @JsonKey(ignore: true)
  _$$MinorCategoryImplCopyWith<_$MinorCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
