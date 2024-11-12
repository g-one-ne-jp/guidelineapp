// Dart imports:
import 'dart:async';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:flutter_template/module/sharedpreference/app_data.dart';
import 'package:flutter_template/providers/moduiles/template_data.dart';
import 'package:flutter_template/repotitory/mixin_repository_file.dart';
import 'package:flutter_template/repotitory/mixin_repository_http.dart';

// RouteData の状態を管理する StateNotifier クラスです。
class ProviderApp extends StateNotifier<AppData>
    with RepositoryHttp, RepositoryFile {
  // コンストラクタ内での初期状態を設定し、非同期にデータをロードします。
  ProviderApp() : super(AppData()) {}
}
