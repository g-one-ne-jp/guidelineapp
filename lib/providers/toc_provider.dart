import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/module/firebase/model_firebase_pdf_config.dart';
import 'package:flutter_template/repotitory/mixin_repository_file.dart';
import 'package:flutter_template/repotitory/mixin_repository_http.dart';

// StateNotifierクラスを外部ファイルで呼び出すプロバイダー.
final tocProvider =
    StateNotifierProvider<ProviderToc, MajorCategory>((ref) => ProviderToc());

class ProviderToc extends StateNotifier<MajorCategory>
    with RepositoryHttp, RepositoryFile {
  // コンストラクタ内での初期状態を設定し、非同期にデータをロードします。
  ProviderToc() : super(MajorCategory()) {}

  Future<void> writeToc({
    required MajorCategory data,
  }) {
    state = data;
    return Future.value();
  }

  // データを読み込むメソッド
  MinorCategory searchMinorCategoryByKeyFromMajor(
      MajorCategory majorCategory, String mainorKey) {
    for (var sub in majorCategory.subs.values) {
      for (var minor in sub.minors.values) {
        if (minor.mainorKey == mainorKey) {
          // 更新されたMinorCategoryを返す
          return minor;
        }
      }
    }
    // 見つからなかった場合はnullを返す
    return MinorCategory();
  }
}
