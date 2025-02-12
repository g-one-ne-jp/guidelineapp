// Dart imports:

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:JCSGuidelines/module/sharedpreference/app_data.dart';
import 'package:JCSGuidelines/repotitory/mixin_repository_file.dart';
import 'package:JCSGuidelines/repotitory/mixin_repository_http.dart';

// RouteData の状態を管理する StateNotifier クラスです。
class ProviderApp extends StateNotifier<AppData> with RepositoryHttp, RepositoryFile {
  // コンストラクタ内での初期状態を設定し、非同期にデータをロードします。
  ProviderApp() : super(AppData());
}
