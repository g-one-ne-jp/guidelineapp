// ignore_for_file: use_build_context_synchronously

// Dart imports:
import 'dart:io';

import 'package:JCSGuidelines/app_router.dart';
import 'package:JCSGuidelines/module/firebase/model_firebase_pdf_config.dart';
import 'package:JCSGuidelines/providers/toc_provider.dart';
import 'package:JCSGuidelines/providers/user_provider.dart';
import 'package:JCSGuidelines/repotitory/mixin_repository_firestorage.dart';
import 'package:JCSGuidelines/ui/util/ui_util_tab_back_handler.dart';
import 'package:JCSGuidelines/ui/util/uiUtilDialog.dart';
import 'package:JCSGuidelines/ui/util/uiUtilTile.dart';
// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pdftron_flutter/pdftron_flutter.dart';

@RoutePage()

/// pdfを表示する画面
/// /tabHomeMinor/:minorKey/:viewTypeMemo のルーティングで呼ばれる。
/// [推奨・エビデンスレベル]の場合
/// tabHomeMinor/minorKey3/false など
// ignore: must_be_immutable
class UiPageHomeCatalogTabHomeMinor extends HookConsumerWidget
    with RepositoryFireStorage {
  UiPageHomeCatalogTabHomeMinor({
    super.key,
    @PathParam('minorKey') required this.minorKey,
    @PathParam('viewTypeMemo') required this.viewTypeMemo,
  });
  final String minorKey;
  final bool viewTypeMemo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _userProvider = ref.watch(userProvider);
    final _userNotifer = ref.watch(userProvider.notifier);

    final _tocProvider = ref.watch(tocProvider);
    final _tocNotifer = ref.watch(tocProvider.notifier);

    final _minor = useState(MinorCategory());

    final _panelKey = useState('');
    // 再描画用の状態変数
    final _shouldRebuild = useState(false);

    useEffect(() {
      Future<void>(() async {
        _minor.value = _tocNotifer.searchMinorCategoryByKeyFromMajor(
            _tocProvider, minorKey);
      });
      return null;
//      return () => customDebugPrint('dispose!');
    }, []);


    // ここでエディター開いている。
    void showViewer({required String document}) async {
      //ビューワーのカスタムコンフィグ
      var config = Config();
      PdftronFlutter.openDocument(document, config: config);
      startLeadingNavButtonPressedListener(() async {
        var path = await PdftronFlutter.saveDocument();
        uploadData(path: path!, file: File(path));
        // 再描画をトリガー
        _shouldRebuild.value = !_shouldRebuild.value;
      });
    }
    // int c = _minor.value.details.length - 1;
    // if (c < 0) {
    //   c = 0;
    // }

    debugPrint('minorKey: $minorKey');
    final path = AutoRouter.of(context).currentPath;
    print(
        '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~detail count: ${_minor.value.details.length}');
    final bookmarkEnable = false;
    // TabBackHandler: Android◀・Androidスワイプ・iOSスワイプ 全てに対応
    // /toc 経由の場合は外側の Root Navigator、それ以外はタブ内スタックへ。
    return TabBackHandler(
      onBack: () => Navigator.of(context, rootNavigator: path.contains('/toc')).pop(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(_minor.value.minorTitle),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () =>
                // ガイドラインの目次からこの画面に来たときは ../tabHome/toc/minorというルートになるので
                // rootNavigatorでポップして、目次に戻る。
                // しかし、検索などのサブルートで来た場合は、タブ内のスタックでポップしたいので
                // rootNavigator
                Navigator.of(context, rootNavigator: path.contains('/toc'))
                    .pop(),
          ),
          actions: <Widget>[
            bookmarkEnable
                ? IconButton(
                    icon: Icon(!_userNotifer.getBookmarkState(key: minorKey)
                        ? Icons.bookmark_outline
                        : Icons.bookmark),
                    onPressed: () {
                      if (FirebaseAuth.instance.currentUser == null) {
                        showLoginDialog(context,
                            content:
                                'ブックマーク機能を利用するには会員登録/ログインが必要です。ログイン画面に移動しますか？');
                      } else {
                        _userNotifer.updateBookmark(
                            key: minorKey,
                            isBookmark:
                                !_userNotifer.getBookmarkState(key: minorKey));
                      }
                    },
                  )
              : Container(),
          ],
        ),
        body: Container(
          color: Colors.white,
          child: ListView.builder(
            itemCount: _minor.value.details.length,
            itemBuilder: (BuildContext context, int index) {
              var value = _minor.value.details.values.toList()[index];
              //memoにkeyが存在しているか？
              final isMemo =
                  _userNotifer.getMemo(key: value.detailKey).isNotEmpty;
              return isMemo || !viewTypeMemo
                  ? PdfGridView(
                      deteil: value,
                      onPdfTap: (String path, String sessionKey) {
                        // ここはpdfを選択肢エディタを開く。
// "/data/user/0/jp.co.miceone.jcsguidelines/app_flutter/1VW4FmgSlUWiCdHHQVFzeZ6wxds2/表2.pdf"
                        // PDFView{erでPDFを表示する
                        if (path.endsWith("pdf")) {
                          //showViewer(document: path);
                          //return;
                        }
                        // タイプセーフなルーティングを使用（パスにスラッシュが含まれていても安全に渡せる）
                        context.router.push(
                            ViewerRoute(pdfPath: path, sessionKey: sessionKey));
                      },
                      onDeteilEdit: (deteil) {
                        // ここはメモアイコンが押された時。
                        print(
                            "---------------Edit tapped: ${deteil.detailKey}");
                        _panelKey.value = deteil.detailKey;
                        context.router
                            .pushNamed('/edit/${deteil.detailKey}/false');
                      })
                  : Container();
            },
          ),
        ),
      ), // Scaffold
    ); // TabBackHandler
  }
}

// 59697
// befor: /data/user/0/jp.co.miceone.jcsguidelines/app_flutter/PErGRIlcdYfpozdD0oXk95V2fN42/表2.pdf
// after: /data/user/0/jp.co.miceone.jcsguidelines/app_flutter/PErGRIlcdYfpozdD0oXk95V2fN42/表2.pdf
// 94673