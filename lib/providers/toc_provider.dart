// Dart imports:
import 'dart:async';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:JCSGuidelines/module/firebase/model_firebase_pdf_config.dart';
import 'package:JCSGuidelines/repotitory/mixin_repository_file.dart';
import 'package:JCSGuidelines/repotitory/mixin_repository_http.dart';

// Flutter imports:



// StateNotifierクラスを外部ファイルで呼び出すプロバイダー.
final tocProvider = StateNotifierProvider<ProviderToc, MajorCategory>((ref) => ProviderToc());

class ProviderToc extends StateNotifier<MajorCategory> with RepositoryHttp, RepositoryFile {
  // コンストラクタ内での初期状態を設定し、非同期にデータをロードします。
  ProviderToc() : super(MajorCategory());

  Future<void> writeToc({
    required MajorCategory data,
  }) {
    state = data;
    return Future.value();
  }

  // MajorCategoryからデータを読み込むメソッド(minorKeyを指定してMinorCategoryを取得)
  MinorCategory searchMinorCategoryByKeyFromMajor(MajorCategory majorCategory, String minorKey) {
    for (var sub in majorCategory.subs.values) {
      for (var minor in sub.minors.values) {
        if (minor.minorKey == minorKey) {
          // 更新されたMinorCategoryを返す
          return minor;
        }
      }
    }
    // 見つからなかった場合はnullを返す
    return MinorCategory();
  }

  // MajorCategoryからデータを読み込むメソッド(detailKeyを指定してDetailCategoryを取得)
  DetailCategory searchDetailCategoryByKeyFromMajor(MajorCategory majorCategory, String detailKey) {
    for (var sub in majorCategory.subs.values) {
      for (var minor in sub.minors.values) {
        for (var detail in minor.details.values) {
          if (detail.detailKey == detailKey) {
            // 更新されたDetailCategoryを返す
            return detail;
          }
        }
      }
    }
    // 見つからなかった場合はnullを返す
    return DetailCategory();
  }

  // MajorCategoryからデータを読み込むメソッド(detailKeyを指定してminorKeyを取得)
  String searchminorKeyFromDetailKeyFromMajor(MajorCategory majorCategory, String detailKey) {
    for (var sub in majorCategory.subs.values) {
      for (var minor in sub.minors.values) {
        for (var detail in minor.details.values) {
          if (detail.detailKey == detailKey) {
            // 更新されたDetailCategoryを返す
            return minor.minorKey;
          }
        }
      }
    }
    // 見つからなかった場合はnullを返す
    return '';
  }

  /// ブックマークキーから MinorCategory または Settion を検索する
  dynamic searchBookmarkableItemByKey(MajorCategory majorCategory, String key) {
    for (var sub in majorCategory.subs.values) {
      for (var minor in sub.minors.values) {
        // MinorCategory のチェック
        if (minor.minorKey == key) {
          return minor;
        }
        // Settion のチェック
        for (var detail in minor.details.values) {
          for (var content in detail.contents.values) {
            if (content.settions.containsKey(key)) {
              return content.settions[key];
            }
          }
        }
      }
    }
    return null;
  }

  /// メモキーから DetailCategory または Settion を検索し、その親の minorKey と共に返す
  Map<String, dynamic>? searchMemoableItemByKey(
      MajorCategory majorCategory, String key) {
    for (var sub in majorCategory.subs.values) {
      for (var minor in sub.minors.values) {
        for (var detail in minor.details.values) {
          // DetailCategory のチェック
          if (detail.detailKey == key) {
            return {'item': detail, 'minorKey': minor.minorKey};
          }
          // Settion のチェック
          for (var content in detail.contents.values) {
            if (content.settions.containsKey(key)) {
              return {'item': content.settions[key], 'minorKey': minor.minorKey};
            }
          }
        }
      }
    }
    return null;
  }
}
