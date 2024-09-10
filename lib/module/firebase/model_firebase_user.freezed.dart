// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model_firebase_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ModelFirebaseUser _$ModelFirebaseUserFromJson(Map<String, dynamic> json) {
  return _ModelFirebaseUser.fromJson(json);
}

/// @nodoc
mixin _$ModelFirebaseUser {
  String get name => throw _privateConstructorUsedError;
  String get affiliation => throw _privateConstructorUsedError;
  String get specialty => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  Map<String, EditItem> get editItems => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModelFirebaseUserCopyWith<ModelFirebaseUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelFirebaseUserCopyWith<$Res> {
  factory $ModelFirebaseUserCopyWith(
          ModelFirebaseUser value, $Res Function(ModelFirebaseUser) then) =
      _$ModelFirebaseUserCopyWithImpl<$Res, ModelFirebaseUser>;
  @useResult
  $Res call(
      {String name,
      String affiliation,
      String specialty,
      String address,
      Map<String, EditItem> editItems});
}

/// @nodoc
class _$ModelFirebaseUserCopyWithImpl<$Res, $Val extends ModelFirebaseUser>
    implements $ModelFirebaseUserCopyWith<$Res> {
  _$ModelFirebaseUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? affiliation = null,
    Object? specialty = null,
    Object? address = null,
    Object? editItems = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      affiliation: null == affiliation
          ? _value.affiliation
          : affiliation // ignore: cast_nullable_to_non_nullable
              as String,
      specialty: null == specialty
          ? _value.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      editItems: null == editItems
          ? _value.editItems
          : editItems // ignore: cast_nullable_to_non_nullable
              as Map<String, EditItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ModelFirebaseUserImplCopyWith<$Res>
    implements $ModelFirebaseUserCopyWith<$Res> {
  factory _$$ModelFirebaseUserImplCopyWith(_$ModelFirebaseUserImpl value,
          $Res Function(_$ModelFirebaseUserImpl) then) =
      __$$ModelFirebaseUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String affiliation,
      String specialty,
      String address,
      Map<String, EditItem> editItems});
}

/// @nodoc
class __$$ModelFirebaseUserImplCopyWithImpl<$Res>
    extends _$ModelFirebaseUserCopyWithImpl<$Res, _$ModelFirebaseUserImpl>
    implements _$$ModelFirebaseUserImplCopyWith<$Res> {
  __$$ModelFirebaseUserImplCopyWithImpl(_$ModelFirebaseUserImpl _value,
      $Res Function(_$ModelFirebaseUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? affiliation = null,
    Object? specialty = null,
    Object? address = null,
    Object? editItems = null,
  }) {
    return _then(_$ModelFirebaseUserImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      affiliation: null == affiliation
          ? _value.affiliation
          : affiliation // ignore: cast_nullable_to_non_nullable
              as String,
      specialty: null == specialty
          ? _value.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      editItems: null == editItems
          ? _value._editItems
          : editItems // ignore: cast_nullable_to_non_nullable
              as Map<String, EditItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ModelFirebaseUserImpl implements _ModelFirebaseUser {
  _$ModelFirebaseUserImpl(
      {this.name = '',
      this.affiliation = '',
      this.specialty = '',
      this.address = '',
      final Map<String, EditItem> editItems = const {}})
      : _editItems = editItems;

  factory _$ModelFirebaseUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModelFirebaseUserImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String affiliation;
  @override
  @JsonKey()
  final String specialty;
  @override
  @JsonKey()
  final String address;
  final Map<String, EditItem> _editItems;
  @override
  @JsonKey()
  Map<String, EditItem> get editItems {
    if (_editItems is EqualUnmodifiableMapView) return _editItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_editItems);
  }

  @override
  String toString() {
    return 'ModelFirebaseUser(name: $name, affiliation: $affiliation, specialty: $specialty, address: $address, editItems: $editItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModelFirebaseUserImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.affiliation, affiliation) ||
                other.affiliation == affiliation) &&
            (identical(other.specialty, specialty) ||
                other.specialty == specialty) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality()
                .equals(other._editItems, _editItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, affiliation, specialty,
      address, const DeepCollectionEquality().hash(_editItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ModelFirebaseUserImplCopyWith<_$ModelFirebaseUserImpl> get copyWith =>
      __$$ModelFirebaseUserImplCopyWithImpl<_$ModelFirebaseUserImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModelFirebaseUserImplToJson(
      this,
    );
  }
}

abstract class _ModelFirebaseUser implements ModelFirebaseUser {
  factory _ModelFirebaseUser(
      {final String name,
      final String affiliation,
      final String specialty,
      final String address,
      final Map<String, EditItem> editItems}) = _$ModelFirebaseUserImpl;

  factory _ModelFirebaseUser.fromJson(Map<String, dynamic> json) =
      _$ModelFirebaseUserImpl.fromJson;

  @override
  String get name;
  @override
  String get affiliation;
  @override
  String get specialty;
  @override
  String get address;
  @override
  Map<String, EditItem> get editItems;
  @override
  @JsonKey(ignore: true)
  _$$ModelFirebaseUserImplCopyWith<_$ModelFirebaseUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EditItem _$EditItemFromJson(Map<String, dynamic> json) {
  return _EditItem.fromJson(json);
}

/// @nodoc
mixin _$EditItem {
  bool get bookmark => throw _privateConstructorUsedError;
  set bookmark(bool value) => throw _privateConstructorUsedError;
  String get markdown => throw _privateConstructorUsedError;
  set markdown(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EditItemCopyWith<EditItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditItemCopyWith<$Res> {
  factory $EditItemCopyWith(EditItem value, $Res Function(EditItem) then) =
      _$EditItemCopyWithImpl<$Res, EditItem>;
  @useResult
  $Res call({bool bookmark, String markdown});
}

/// @nodoc
class _$EditItemCopyWithImpl<$Res, $Val extends EditItem>
    implements $EditItemCopyWith<$Res> {
  _$EditItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmark = null,
    Object? markdown = null,
  }) {
    return _then(_value.copyWith(
      bookmark: null == bookmark
          ? _value.bookmark
          : bookmark // ignore: cast_nullable_to_non_nullable
              as bool,
      markdown: null == markdown
          ? _value.markdown
          : markdown // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditItemImplCopyWith<$Res>
    implements $EditItemCopyWith<$Res> {
  factory _$$EditItemImplCopyWith(
          _$EditItemImpl value, $Res Function(_$EditItemImpl) then) =
      __$$EditItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool bookmark, String markdown});
}

/// @nodoc
class __$$EditItemImplCopyWithImpl<$Res>
    extends _$EditItemCopyWithImpl<$Res, _$EditItemImpl>
    implements _$$EditItemImplCopyWith<$Res> {
  __$$EditItemImplCopyWithImpl(
      _$EditItemImpl _value, $Res Function(_$EditItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmark = null,
    Object? markdown = null,
  }) {
    return _then(_$EditItemImpl(
      bookmark: null == bookmark
          ? _value.bookmark
          : bookmark // ignore: cast_nullable_to_non_nullable
              as bool,
      markdown: null == markdown
          ? _value.markdown
          : markdown // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EditItemImpl implements _EditItem {
  _$EditItemImpl({this.bookmark = false, this.markdown = ''});

  factory _$EditItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$EditItemImplFromJson(json);

  @override
  @JsonKey()
  bool bookmark;
  @override
  @JsonKey()
  String markdown;

  @override
  String toString() {
    return 'EditItem(bookmark: $bookmark, markdown: $markdown)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditItemImplCopyWith<_$EditItemImpl> get copyWith =>
      __$$EditItemImplCopyWithImpl<_$EditItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EditItemImplToJson(
      this,
    );
  }
}

abstract class _EditItem implements EditItem {
  factory _EditItem({bool bookmark, String markdown}) = _$EditItemImpl;

  factory _EditItem.fromJson(Map<String, dynamic> json) =
      _$EditItemImpl.fromJson;

  @override
  bool get bookmark;
  set bookmark(bool value);
  @override
  String get markdown;
  set markdown(String value);
  @override
  @JsonKey(ignore: true)
  _$$EditItemImplCopyWith<_$EditItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
