// Flutter imports:
// Project imports:
import 'package:JCSGuidelines/app_router.dart';
import 'package:JCSGuidelines/module/firebase/model_firebase_pdf_config.dart';
import 'package:JCSGuidelines/module/firebase/model_firebase_user.dart';
import 'package:JCSGuidelines/providers/toc_provider.dart';
import 'package:JCSGuidelines/providers/user_provider.dart';
import 'package:JCSGuidelines/repotitory/mixin_repository_firestorage.dart';
// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class UiPageHomeCatalogTabMemo extends HookConsumerWidget
    with RepositoryFireStorage {
  const UiPageHomeCatalogTabMemo({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _userProvider = ref.watch(userProvider);
    final _userNotifer = ref.watch(userProvider.notifier);

    final _tocProvider = ref.watch(tocProvider);
    final _tocNotifer = ref.watch(tocProvider.notifier);

    // キーをメモのキー(detailKey or settionKey)とし、値にアイテムとminorKeyを保持する
    final _memoItems = useState<Map<String, dynamic>>({});

    // データ取得ロジックを関数に分離
    Future<void> fetchMemoItems() async {
      // ユーザーデータを読み込み
      final user = await _userNotifer.readUser<ModelFirebaseUser>(
          fromJson: ModelFirebaseUser.fromJson);

      // メモが存在するものを取得
      final memos = user.memos;
      final memoKeys = memos.entries
          .where((entry) => entry.value.isNotEmpty)
          .map((entry) => entry.key)
          .toList();

      // user.memos のMapには Firebaseから取得したメモデータがそのまま入っている。
      // DetailCategoryに割り振られたキーに対応するメモデータという形。
      // detailKey3:"[{"insert":"あ\n\n"}]"
      // hoge_detailKey3:"[{"insert":"んんん\n\n"}]"
      //
      // memoKeysリストにはキーだけ
      // ["detailKey3", "hoge_detailKey3"]

      final memoItems = <String, dynamic>{};
      // メモのキー一覧から...
      for (final key in memoKeys) {
        // DetailCategory または Settion を検索
        final result = _tocNotifer.searchMemoableItemByKey(_tocProvider, key);
        if (result == null) {
          continue;
        }
        memoItems[key] = result;
      }
      _memoItems.value = memoItems;
      // print("----------------------取得したメモアイテム数: ${memoItems.length}");

      // for (var entry in memoItems.entries) {
      //   final key = entry.key;
      //   final item = entry.value['item'];
      //   final minorKey = entry.value['minorKey'];
      //   print(
      //       "キー: $key, アイテムタイトル: ${item is DetailCategory ? item.detailTitle : (item as Settion).settionTitle}, minorKey: $minorKey");
      // }

    }


    useEffect(() {
      fetchMemoItems();

      // AutoTabsRouterを取得
      final tabsRouter = AutoTabsRouter.of(context);

      // タブが選択されたときに再実行
      void handleTabSelection() {
        if (tabsRouter.activeIndex == 2) {
          fetchMemoItems();
        }
      }

      tabsRouter.addListener(handleTabSelection);

      return () {
        tabsRouter.removeListener(handleTabSelection);
      };
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('メモ'),
        automaticallyImplyLeading: false, // 戻るボタンを表示しない
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            _memoItems.value.isEmpty
                ? const Center(
                    child: Text(
                      '保存済みのメモはありません。',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: _memoItems.value.length,
                      itemBuilder: (BuildContext context, int index) {
                        var itemKey = _memoItems.value.keys.elementAt(index);
                        var result = _memoItems.value[itemKey];
                        var item = result['item'];
                        var minorKey = result['minorKey'];

                        String title = ''; // いったん固定で空文字にする

                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            color: Colors.white,
                            child: ListTile(
                              subtitle: SizedBox(
                                width: double.infinity,
                                height: 20.h,
                                child: IgnorePointer(
                                  child: QuillEditor.basic(
                                    controller: QuillController.basic()
                                      ..readOnly = true
                                      ..document = Document.fromJson(
                                          _userNotifer.getMemo(key: itemKey)),
                                    config: const QuillEditorConfig(
                                      scrollable: false,
                                      autoFocus: false,
                                      expands: true,
                                      enableSelectionToolbar: false,
                                      onTapOutsideEnabled: false,
                                      paintCursorAboveText: false,
                                      checkBoxReadOnly: false,
                                    ),
                                  ),
                                ),
                              ),
                              title: Text(title),
                              onTap: () async {
                                if (item is DetailCategory) {
                                  // DetailCategory の場合は詳細画面へ（メモ表示モード）
                                  await context.router.pushNamed(
                                    'tabHomeMinor/$minorKey/true',
                                  );
                                } else if (item is Settion) {
                                  // Settion の場合はPDFをダウンロードして独自ビューワーへ
                                  final file = await downLoadData(
                                      path: item.pdfId, context: context);
                                  if (file != null) {
                                    context.router.push(ViewerRoute(
                                        pdfPath: file.path,
                                        sessionKey: itemKey));
                                  }
                                }
                                fetchMemoItems();
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

