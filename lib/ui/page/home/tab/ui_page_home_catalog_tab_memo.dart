// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:JCSGuidelines/module/firebase/model_firebase_pdf_config.dart';
import 'package:JCSGuidelines/module/firebase/model_firebase_user.dart';
import 'package:JCSGuidelines/providers/toc_provider.dart';
import 'package:JCSGuidelines/providers/user_provider.dart';

@RoutePage()
class UiPageHomeCatalogTabMemo extends HookConsumerWidget {
  const UiPageHomeCatalogTabMemo({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _userProvider = ref.watch(userProvider);
    final _userNotifer = ref.watch(userProvider.notifier);

    final _tocProvider = ref.watch(tocProvider);
    final _tocNotifer = ref.watch(tocProvider.notifier);

    final _memoItems = useState<Map<String, DetailCategory>>({});

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

      // Firestore からメモされたアイテムを取得
      final memoItemsList = await Future.wait(memoKeys.map((key) async {
        final doc =
            _tocNotifer.searchDetailCategoryByKeyFromMajor(_tocProvider, key);
        final minorKey =
            _tocNotifer.searchminorKeyFromDetailKeyFromMajor(_tocProvider, key);
        return MapEntry(minorKey, doc);
      }));

      // リストをマップに変換
      final memoItems = Map<String, DetailCategory>.fromEntries(memoItemsList);

      _memoItems.value = memoItems;

      //
    }

    useEffect(() {
      fetchMemoItems();

      // AutoTabsRouterを取得
      final tabsRouter = AutoTabsRouter.of(context);

      // タブが選択されたときに再実行
      void handleTabSelection() {
        if (tabsRouter.activeIndex == 2) {
          // 1はこのタブのインデックス
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
            _memoItems.value.keys.isEmpty
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
                        var key = _memoItems.value.keys.elementAt(index);
                        var item = _memoItems.value[key];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            color: Colors.white,
                            child: GestureDetector(
                              child: ListTile(
                                subtitle: SizedBox(
                                  width: double.infinity,
                                  height: 20.h,
                                  child: QuillEditor.basic(
                                    configurations: QuillEditorConfigurations(
                                      controller: QuillController.basic()
                                        ..readOnly = true
                                        ..document = Document.fromJson(
                                            _userNotifer.getMemo(
                                                key: item!.detailKey)),
                                      scrollable: false,
                                      autoFocus: false,
                                      expands: true,
                                      enableSelectionToolbar: false,
                                      isOnTapOutsideEnabled: false,
                                      paintCursorAboveText: false,
                                      checkBoxReadOnly: false,
                                      minHeight: 20.h,
                                      maxHeight: 150.h,
                                    ),
                                  ),
                                ),
                                title: Text(item.detailTitle ?? 'No Title'),
                                onTap: () async {
                                  await context.router.pushNamed(
                                    '/tabHomeMinor/$key/true',
                                  );
                                  fetchMemoItems();
                                },
                              ),
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
