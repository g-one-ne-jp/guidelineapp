// ignore_for_file: file_names

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// ジェネレートされたクラスからUserクラスのprivateメンバ変数にアクセスするため
part 'model_firebase_user.freezed.dart';
part 'model_firebase_user.g.dart';

@freezed
abstract class ModelFirebaseUser with _$ModelFirebaseUser {
  factory ModelFirebaseUser({
    @Default('') String name,
    @Default('') String affiliation,
    @Default('') String specialty,
    @Default('') String address,
    @Default({}) Map<String, EditItem> editItems,
    @Default({}) Map<String, String> memos,
    @Default({}) Map<String, bool> bookmarks,
  }) = _ModelFirebaseUser;

  factory ModelFirebaseUser.fromJson(Map<String, dynamic> json) =>
      _$ModelFirebaseUserFromJson(json);
}

@unfreezed
abstract class EditItem with _$EditItem {
  factory EditItem({
    @Default(false) bool bookmark,
    @Default('') String markdown,
  }) = _EditItem;

  factory EditItem.fromJson(Map<String, dynamic> json) =>
      _$EditItemFromJson(json);
}
