// ignore_for_file: use_build_context_synchronously

// Dart imports:
import 'dart:convert';
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:JCSGuidelines/debug/debug_print.dart';
import 'package:JCSGuidelines/module/firebase/model_firebase_pdf_config.dart';
import 'package:JCSGuidelines/providers/toc_provider.dart';
import 'package:JCSGuidelines/providers/user_provider.dart';
import 'package:JCSGuidelines/repotitory/mixin_repository_firestorage.dart';
import 'package:JCSGuidelines/ui/util/uiUtilTile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pdftron_flutter/pdftron_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

@RoutePage()
// ignore: must_be_immutable
class UiPageHomeCatalogTabHomeMinor extends HookConsumerWidget
    with RepositoryFireStorage {
  UiPageHomeCatalogTabHomeMinor({
    super.key,
    @PathParam('mainorKey') required this.mainorKey,
    @PathParam('viewTypeMemo') required this.viewTypeMemo,
  });
  final String mainorKey;
  final bool viewTypeMemo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _userProvider = ref.watch(userProvider);
    final _userNotifer = ref.watch(userProvider.notifier);

    final _tocProvider = ref.watch(tocProvider);
    final _tocNotifer = ref.watch(tocProvider.notifier);

    final _mainor = useState(MinorCategory());

    final _panelKey = useState('');
    // 再描画用の状態変数
    final _shouldRebuild = useState(false);

    useEffect(() {
      Future<void>(() async {
        _mainor.value = _tocNotifer.searchMinorCategoryByKeyFromMajor(
            _tocProvider, mainorKey);
      });
      return () => customDebugPrint('dispose!');
    }, []);

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

    debugPrint('mainorKey: $mainorKey');
    return Scaffold(
      appBar: AppBar(
        title: Text(_mainor.value.minorTitle),
        actions: <Widget>[
          IconButton(
            icon: Icon(!_userNotifer.getBookmarkState(key: mainorKey)
                ? Icons.bookmark_outline
                : Icons.bookmark),
            onPressed: () {
              _userNotifer.updateBookmark(
                  key: mainorKey,
                  isBookmark: !_userNotifer.getBookmarkState(key: mainorKey));
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        child: ListView.builder(
          itemCount: _mainor.value.details.length,
          itemBuilder: (BuildContext context, int index) {
            var value = _mainor.value.details.values.toList()[index];
            //memoにkeyが存在しているか？
            final isMemo =
                _userNotifer.getMemo(key: value.detailKey).isNotEmpty;

            return isMemo || !viewTypeMemo
                ? UiUtilWidgetTile3(
                    deteil: value,
                    onPdfTap: (String path) {
                      showViewer(document: path);
                    },
                    onDeteilEdit: (deteil) {
                      _panelKey.value = deteil.detailKey;
                      context.router
                          .pushNamed('/edit/${deteil.detailKey}/false');
                    })
                : Container();
          },
        ),
      ),
    );
  }
}
