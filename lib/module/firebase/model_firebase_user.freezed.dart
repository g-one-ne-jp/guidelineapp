// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model_firebase_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ModelFirebaseUser {
  String get gender;
  String get age;
  String get occupation;
  String get specialty;
  String get number;
  bool get ismailmagazine;
  Map<String, EditItem> get editItems;
  Map<String, String> get memos;
  Map<String, bool> get bookmarks;

  /// Create a copy of ModelFirebaseUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ModelFirebaseUserCopyWith<ModelFirebaseUser> get copyWith =>
      _$ModelFirebaseUserCopyWithImpl<ModelFirebaseUser>(
          this as ModelFirebaseUser, _$identity);

  /// Serializes this ModelFirebaseUser to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ModelFirebaseUser &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.occupation, occupation) ||
                other.occupation == occupation) &&
            (identical(other.specialty, specialty) ||
                other.specialty == specialty) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.ismailmagazine, ismailmagazine) ||
                other.ismailmagazine == ismailmagazine) &&
            const DeepCollectionEquality().equals(other.editItems, editItems) &&
            const DeepCollectionEquality().equals(other.memos, memos) &&
            const DeepCollectionEquality().equals(other.bookmarks, bookmarks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      gender,
      age,
      occupation,
      specialty,
      number,
      ismailmagazine,
      const DeepCollectionEquality().hash(editItems),
      const DeepCollectionEquality().hash(memos),
      const DeepCollectionEquality().hash(bookmarks));

  @override
  String toString() {
    return 'ModelFirebaseUser(gender: $gender, age: $age, occupation: $occupation, specialty: $specialty, number: $number, ismailmagazine: $ismailmagazine, editItems: $editItems, memos: $memos, bookmarks: $bookmarks)';
  }
}

/// @nodoc
abstract mixin class $ModelFirebaseUserCopyWith<$Res> {
  factory $ModelFirebaseUserCopyWith(
          ModelFirebaseUser value, $Res Function(ModelFirebaseUser) _then) =
      _$ModelFirebaseUserCopyWithImpl;
  @useResult
  $Res call(
      {String gender,
      String age,
      String occupation,
      String specialty,
      String number,
      bool ismailmagazine,
      Map<String, EditItem> editItems,
      Map<String, String> memos,
      Map<String, bool> bookmarks});
}

/// @nodoc
class _$ModelFirebaseUserCopyWithImpl<$Res>
    implements $ModelFirebaseUserCopyWith<$Res> {
  _$ModelFirebaseUserCopyWithImpl(this._self, this._then);

  final ModelFirebaseUser _self;
  final $Res Function(ModelFirebaseUser) _then;

  /// Create a copy of ModelFirebaseUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gender = null,
    Object? age = null,
    Object? occupation = null,
    Object? specialty = null,
    Object? number = null,
    Object? ismailmagazine = null,
    Object? editItems = null,
    Object? memos = null,
    Object? bookmarks = null,
  }) {
    return _then(_self.copyWith(
      gender: null == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      occupation: null == occupation
          ? _self.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as String,
      specialty: null == specialty
          ? _self.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      ismailmagazine: null == ismailmagazine
          ? _self.ismailmagazine
          : ismailmagazine // ignore: cast_nullable_to_non_nullable
              as bool,
      editItems: null == editItems
          ? _self.editItems
          : editItems // ignore: cast_nullable_to_non_nullable
              as Map<String, EditItem>,
      memos: null == memos
          ? _self.memos
          : memos // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      bookmarks: null == bookmarks
          ? _self.bookmarks
          : bookmarks // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ModelFirebaseUser].
extension ModelFirebaseUserPatterns on ModelFirebaseUser {
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
    TResult Function(_ModelFirebaseUser value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ModelFirebaseUser() when $default != null:
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
    TResult Function(_ModelFirebaseUser value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModelFirebaseUser():
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
    TResult? Function(_ModelFirebaseUser value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModelFirebaseUser() when $default != null:
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
    TResult Function(
            String gender,
            String age,
            String occupation,
            String specialty,
            String number,
            bool ismailmagazine,
            Map<String, EditItem> editItems,
            Map<String, String> memos,
            Map<String, bool> bookmarks)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ModelFirebaseUser() when $default != null:
        return $default(
            _that.gender,
            _that.age,
            _that.occupation,
            _that.specialty,
            _that.number,
            _that.ismailmagazine,
            _that.editItems,
            _that.memos,
            _that.bookmarks);
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
    TResult Function(
            String gender,
            String age,
            String occupation,
            String specialty,
            String number,
            bool ismailmagazine,
            Map<String, EditItem> editItems,
            Map<String, String> memos,
            Map<String, bool> bookmarks)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModelFirebaseUser():
        return $default(
            _that.gender,
            _that.age,
            _that.occupation,
            _that.specialty,
            _that.number,
            _that.ismailmagazine,
            _that.editItems,
            _that.memos,
            _that.bookmarks);
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
    TResult? Function(
            String gender,
            String age,
            String occupation,
            String specialty,
            String number,
            bool ismailmagazine,
            Map<String, EditItem> editItems,
            Map<String, String> memos,
            Map<String, bool> bookmarks)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModelFirebaseUser() when $default != null:
        return $default(
            _that.gender,
            _that.age,
            _that.occupation,
            _that.specialty,
            _that.number,
            _that.ismailmagazine,
            _that.editItems,
            _that.memos,
            _that.bookmarks);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ModelFirebaseUser implements ModelFirebaseUser {
  _ModelFirebaseUser(
      {this.gender = '',
      this.age = '',
      this.occupation = '',
      this.specialty = '',
      this.number = '',
      this.ismailmagazine = false,
      final Map<String, EditItem> editItems = const {},
      final Map<String, String> memos = const {},
      final Map<String, bool> bookmarks = const {}})
      : _editItems = editItems,
        _memos = memos,
        _bookmarks = bookmarks;
  factory _ModelFirebaseUser.fromJson(Map<String, dynamic> json) =>
      _$ModelFirebaseUserFromJson(json);

  @override
  @JsonKey()
  final String gender;
  @override
  @JsonKey()
  final String age;
  @override
  @JsonKey()
  final String occupation;
  @override
  @JsonKey()
  final String specialty;
  @override
  @JsonKey()
  final String number;
  @override
  @JsonKey()
  final bool ismailmagazine;
  final Map<String, EditItem> _editItems;
  @override
  @JsonKey()
  Map<String, EditItem> get editItems {
    if (_editItems is EqualUnmodifiableMapView) return _editItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_editItems);
  }

  final Map<String, String> _memos;
  @override
  @JsonKey()
  Map<String, String> get memos {
    if (_memos is EqualUnmodifiableMapView) return _memos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_memos);
  }

  final Map<String, bool> _bookmarks;
  @override
  @JsonKey()
  Map<String, bool> get bookmarks {
    if (_bookmarks is EqualUnmodifiableMapView) return _bookmarks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_bookmarks);
  }

  /// Create a copy of ModelFirebaseUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ModelFirebaseUserCopyWith<_ModelFirebaseUser> get copyWith =>
      __$ModelFirebaseUserCopyWithImpl<_ModelFirebaseUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ModelFirebaseUserToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ModelFirebaseUser &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.occupation, occupation) ||
                other.occupation == occupation) &&
            (identical(other.specialty, specialty) ||
                other.specialty == specialty) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.ismailmagazine, ismailmagazine) ||
                other.ismailmagazine == ismailmagazine) &&
            const DeepCollectionEquality()
                .equals(other._editItems, _editItems) &&
            const DeepCollectionEquality().equals(other._memos, _memos) &&
            const DeepCollectionEquality()
                .equals(other._bookmarks, _bookmarks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      gender,
      age,
      occupation,
      specialty,
      number,
      ismailmagazine,
      const DeepCollectionEquality().hash(_editItems),
      const DeepCollectionEquality().hash(_memos),
      const DeepCollectionEquality().hash(_bookmarks));

  @override
  String toString() {
    return 'ModelFirebaseUser(gender: $gender, age: $age, occupation: $occupation, specialty: $specialty, number: $number, ismailmagazine: $ismailmagazine, editItems: $editItems, memos: $memos, bookmarks: $bookmarks)';
  }
}

/// @nodoc
abstract mixin class _$ModelFirebaseUserCopyWith<$Res>
    implements $ModelFirebaseUserCopyWith<$Res> {
  factory _$ModelFirebaseUserCopyWith(
          _ModelFirebaseUser value, $Res Function(_ModelFirebaseUser) _then) =
      __$ModelFirebaseUserCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String gender,
      String age,
      String occupation,
      String specialty,
      String number,
      bool ismailmagazine,
      Map<String, EditItem> editItems,
      Map<String, String> memos,
      Map<String, bool> bookmarks});
}

/// @nodoc
class __$ModelFirebaseUserCopyWithImpl<$Res>
    implements _$ModelFirebaseUserCopyWith<$Res> {
  __$ModelFirebaseUserCopyWithImpl(this._self, this._then);

  final _ModelFirebaseUser _self;
  final $Res Function(_ModelFirebaseUser) _then;

  /// Create a copy of ModelFirebaseUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? gender = null,
    Object? age = null,
    Object? occupation = null,
    Object? specialty = null,
    Object? number = null,
    Object? ismailmagazine = null,
    Object? editItems = null,
    Object? memos = null,
    Object? bookmarks = null,
  }) {
    return _then(_ModelFirebaseUser(
      gender: null == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      occupation: null == occupation
          ? _self.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as String,
      specialty: null == specialty
          ? _self.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      ismailmagazine: null == ismailmagazine
          ? _self.ismailmagazine
          : ismailmagazine // ignore: cast_nullable_to_non_nullable
              as bool,
      editItems: null == editItems
          ? _self._editItems
          : editItems // ignore: cast_nullable_to_non_nullable
              as Map<String, EditItem>,
      memos: null == memos
          ? _self._memos
          : memos // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      bookmarks: null == bookmarks
          ? _self._bookmarks
          : bookmarks // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ));
  }
}

/// @nodoc
mixin _$EditItem {
  bool get bookmark;
  set bookmark(bool value);
  String get markdown;
  set markdown(String value);

  /// Create a copy of EditItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EditItemCopyWith<EditItem> get copyWith =>
      _$EditItemCopyWithImpl<EditItem>(this as EditItem, _$identity);

  /// Serializes this EditItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  String toString() {
    return 'EditItem(bookmark: $bookmark, markdown: $markdown)';
  }
}

/// @nodoc
abstract mixin class $EditItemCopyWith<$Res> {
  factory $EditItemCopyWith(EditItem value, $Res Function(EditItem) _then) =
      _$EditItemCopyWithImpl;
  @useResult
  $Res call({bool bookmark, String markdown});
}

/// @nodoc
class _$EditItemCopyWithImpl<$Res> implements $EditItemCopyWith<$Res> {
  _$EditItemCopyWithImpl(this._self, this._then);

  final EditItem _self;
  final $Res Function(EditItem) _then;

  /// Create a copy of EditItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmark = null,
    Object? markdown = null,
  }) {
    return _then(_self.copyWith(
      bookmark: null == bookmark
          ? _self.bookmark
          : bookmark // ignore: cast_nullable_to_non_nullable
              as bool,
      markdown: null == markdown
          ? _self.markdown
          : markdown // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [EditItem].
extension EditItemPatterns on EditItem {
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
    TResult Function(_EditItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EditItem() when $default != null:
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
    TResult Function(_EditItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EditItem():
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
    TResult? Function(_EditItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EditItem() when $default != null:
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
    TResult Function(bool bookmark, String markdown)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EditItem() when $default != null:
        return $default(_that.bookmark, _that.markdown);
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
    TResult Function(bool bookmark, String markdown) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EditItem():
        return $default(_that.bookmark, _that.markdown);
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
    TResult? Function(bool bookmark, String markdown)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EditItem() when $default != null:
        return $default(_that.bookmark, _that.markdown);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _EditItem implements EditItem {
  _EditItem({this.bookmark = false, this.markdown = ''});
  factory _EditItem.fromJson(Map<String, dynamic> json) =>
      _$EditItemFromJson(json);

  @override
  @JsonKey()
  bool bookmark;
  @override
  @JsonKey()
  String markdown;

  /// Create a copy of EditItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EditItemCopyWith<_EditItem> get copyWith =>
      __$EditItemCopyWithImpl<_EditItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EditItemToJson(
      this,
    );
  }

  @override
  String toString() {
    return 'EditItem(bookmark: $bookmark, markdown: $markdown)';
  }
}

/// @nodoc
abstract mixin class _$EditItemCopyWith<$Res>
    implements $EditItemCopyWith<$Res> {
  factory _$EditItemCopyWith(_EditItem value, $Res Function(_EditItem) _then) =
      __$EditItemCopyWithImpl;
  @override
  @useResult
  $Res call({bool bookmark, String markdown});
}

/// @nodoc
class __$EditItemCopyWithImpl<$Res> implements _$EditItemCopyWith<$Res> {
  __$EditItemCopyWithImpl(this._self, this._then);

  final _EditItem _self;
  final $Res Function(_EditItem) _then;

  /// Create a copy of EditItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? bookmark = null,
    Object? markdown = null,
  }) {
    return _then(_EditItem(
      bookmark: null == bookmark
          ? _self.bookmark
          : bookmark // ignore: cast_nullable_to_non_nullable
              as bool,
      markdown: null == markdown
          ? _self.markdown
          : markdown // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
