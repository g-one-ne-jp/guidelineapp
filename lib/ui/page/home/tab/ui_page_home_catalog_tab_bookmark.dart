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
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class UiPageHomeCatalogTabBookmark extends HookConsumerWidget
    with RepositoryFireStorage {
  const UiPageHomeCatalogTabBookmark({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _userProvider = ref.watch(userProvider);
    final _userNotifer = ref.watch(userProvider.notifier);

    final _tocProvider = ref.watch(tocProvider);
    final _tocNotifer = ref.watch(tocProvider.notifier);

    // MinorCategory または Settion を保持できるように dynamic に変更
    final _bookmarkedItems = useState<Map<String, dynamic>>({});

    // データ取得ロジックを関数に分離
    Future<void> fetchBookmarkedItems() async {
      // ユーザーデータを読み込み
      final user = await _userNotifer.readUser<ModelFirebaseUser>(
          fromJson: ModelFirebaseUser.fromJson);

      // ブックマークが true のものを取得
      final bookmarks = user.bookmarks;
      final bookmarkedKeys = bookmarks.entries
          .where((entry) => entry.value == true)
          .map((entry) => entry.key)
          .toList();

//      print("ブックマークされたアイテムのキー: $bookmarkedKeys");

      // 各キーに対して MinorCategory または Settion を検索
      final bookmarkedItemsList =
          await Future.wait(bookmarkedKeys.map((key) async {
        final doc =
            _tocNotifer.searchBookmarkableItemByKey(_tocProvider, key);
        return MapEntry(key, doc);
      }));

      // リストをマップに変換
      final bookmarkedItems = Map<String, dynamic>.fromEntries(
          bookmarkedItemsList.where((e) => e.value != null));

      _bookmarkedItems.value = bookmarkedItems;
    }

    useEffect(() {
      fetchBookmarkedItems();

      // AutoTabsRouterを取得
      final tabsRouter = AutoTabsRouter.of(context);

      // タブが選択されたときに再実行
      void handleTabSelection() {
        if (tabsRouter.activeIndex == 3) {
          fetchBookmarkedItems();
        }
      }

      tabsRouter.addListener(handleTabSelection);

      return () {
        tabsRouter.removeListener(handleTabSelection);
      };
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ブックマーク'),
        automaticallyImplyLeading: false, // 戻るボタンを表示しない
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            _bookmarkedItems.value.isEmpty
                ? const Center(
                    child: Text(
                      '保存済みのブックマークはありません。',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: _bookmarkedItems.value.length,
                      itemBuilder: (BuildContext context, int index) {
                        var key = _bookmarkedItems.value.keys.elementAt(index);
                        var item = _bookmarkedItems.value[key];

                        String title = 'No Title';
                        String summary = '';
                        IconData icon = Icons.description;

                        // 型に応じて表示内容を切り替え
                        if (item is MinorCategory) {
                          title = item.minorTitle;
                          summary = item.minorSummary;
                          icon = Icons.folder;
                        } else if (item is Settion) {
                          // ファイル名をタイトルに、セクション名をサマリーに設定
                          title = item.pdfId.split('/').last;
                          summary = item.settionTitle;
                          icon = Icons.picture_as_pdf;
                        }

                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(icon, color: Colors.blue),
                              trailing: const Icon(Icons.arrow_forward_ios),
                              title: Text(title),
                              subtitle:
                                  summary.isNotEmpty ? Text(summary) : null,
                              onTap: () async {
                                if (item is MinorCategory) {
                                  // MinorCategory の場合は詳細一覧画面へ
                                  await context.router.pushNamed(
                                    'tabHomeMinor/$key/false',
                                  );
                                } else if (item is Settion) {
                                  // Settion の場合はPDFビューワーへ
                                  // PDFをダウンロードしてパスを取得
                                  final file = await downLoadData(
                                      path: item.pdfId, context: context);
                                  if (file != null) {
                                    context.router.push(ViewerRoute(
                                        pdfPath: file.path, sessionKey: key));
                                  }
                                }
                                await fetchBookmarkedItems();
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
