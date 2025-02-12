// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:JCSGuidelines/debug/debug_print.dart';
import 'package:JCSGuidelines/module/firebase/model_firebase_pdf_config.dart';
import 'package:JCSGuidelines/providers/toc_provider.dart';
import 'package:JCSGuidelines/providers/user_provider.dart';
import 'package:JCSGuidelines/repotitory/mixin_repository_firestorage.dart';

@RoutePage()
// ignore: must_be_immutable
class UiPageUtilEdit extends HookConsumerWidget with RepositoryFireStorage {
  UiPageUtilEdit({
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

    final _controller = useState(QuillController.basic());

    useEffect(() {
      Future<void>(() async {
        _minor.value = _tocNotifer.searchMinorCategoryByKeyFromMajor(_tocProvider, minorKey);

        final json = _userNotifer.getMemo(key: minorKey);
        if (json.isNotEmpty) {
          _controller.value.document = Document.fromJson(json);
        }
      });
      return () => customDebugPrint('dispose!');
    }, []);

    debugPrint('minorKey: $minorKey');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(_minor.value.minorTitle),
        leading: IconButton(
          icon: const Icon(Icons.close), // バツアイコン
          onPressed: () async {
            FocusScope.of(context).unfocus();
            // ignore: deprecated_member_use
            context.router.pop();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () async {
              await _userNotifer.updateMemo(
                  key: minorKey, memo: jsonEncode(_controller.value.document.toDelta().toJson()));
              FocusScope.of(context).unfocus();
              FocusScope.of(context).nextFocus();
              await Fluttertoast.showToast(
                msg: '保存を実行しました。',
              );
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.lightBlueAccent,
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal, // 子ウィジェットのスクロール方向
              child: QuillToolbar.simple(
                configurations: QuillSimpleToolbarConfigurations(
                  controller: _controller.value,
                  showItalicButton: false,
                  showHeaderStyle: false,
                  showUnderLineButton: false,
                  showListCheck: false,
                  showListNumbers: false,
                  showListBullets: false,
                  showIndent: false,
                  showRedo: true,
                  showUndo: true,
                  showSubscript: false,
                  showSearchButton: false,
                  showSuperscript: false,
                  showStrikeThrough: false,
                  showInlineCode: false,
                  showFontFamily: false,
                  showClearFormat: false,
                  showCodeBlock: false,
                  showQuote: false,
                  showBackgroundColorButton: false,
                  showDividers: false,
                  showClipboardCopy: false,
                  showClipboardCut: false,
                  showClipboardPaste: true,
                  showColorButton: true,
                ),
              ),
            ),
          ),
          //
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.white70,
              child: QuillEditor.basic(
                configurations: QuillEditorConfigurations(
                  placeholder: 'ここをタップしてメモを入力してください。',
                  controller: _controller.value,
                  scrollable: true,
                  padding: const EdgeInsets.all(16.0),
                  autoFocus: false,
                  expands: true,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
