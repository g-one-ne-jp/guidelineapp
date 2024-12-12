// Dart imports:
import 'dart:async';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:JCSGuidelines/providers/moduiles/template_data.dart';
import 'package:JCSGuidelines/repotitory/mixin_repository_file.dart';
import 'package:JCSGuidelines/repotitory/mixin_repository_http.dart';

// RouteData の状態を管理する StateNotifier クラスです。
class ProviderTamplate extends StateNotifier<TemplateData>
    with RepositoryHttp, RepositoryFile {
  // コンストラクタ内での初期状態を設定し、非同期にデータをロードします。
  ProviderTamplate() : super(TemplateData()) {
    load();
  }

  // リポジトリからデータを非同期にロードし、現在の状態を更新します。
  Future<TemplateData> load() async {
    final json = await loadPreferences(
      fileName: state.toString(),
      isSecure: false,
    );
    state = TemplateData.fromJson(json);
    return state;
  }

  // 現在の状態をリポジトリに非同期に保存します。
  Future<void> save({TemplateData? app}) async {
    if (app != null) {
      state = app;
    }
    await savePreferences(
      fileName: state.toString(),
      jsonMap: state,
      isSecure: false,
    );
    await load();
  }
}
