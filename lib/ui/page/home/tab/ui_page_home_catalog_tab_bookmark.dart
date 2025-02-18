// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:JCSGuidelines/module/firebase/model_firebase_pdf_config.dart';
import 'package:JCSGuidelines/module/firebase/model_firebase_user.dart';
import 'package:JCSGuidelines/providers/toc_provider.dart';
import 'package:JCSGuidelines/providers/user_provider.dart';

@RoutePage()
class UiPageHomeCatalogTabBookmark extends HookConsumerWidget {
  const UiPageHomeCatalogTabBookmark({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _userProvider = ref.watch(userProvider);
    final _userNotifer = ref.watch(userProvider.notifier);

    final _tocProvider = ref.watch(tocProvider);
    final _tocNotifer = ref.watch(tocProvider.notifier);

    final _bookmarkedItems = useState<Map<String, MinorCategory>>({});

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

      // Firestore からブックマークされたアイテムを取得
      final bookmarkedItemsList =
          await Future.wait(bookmarkedKeys.map((key) async {
        final doc =
            _tocNotifer.searchMinorCategoryByKeyFromMajor(_tocProvider, key);
        return MapEntry(key, doc);
      }));

      // リストをマップに変換
      final bookmarkedItems =
          Map<String, MinorCategory>.fromEntries(bookmarkedItemsList);

      _bookmarkedItems.value = bookmarkedItems;
    }

    useEffect(() {
      fetchBookmarkedItems();

      // AutoTabsRouterを取得
      final tabsRouter = AutoTabsRouter.of(context);

      // タブが選択されたときに再実行
      void handleTabSelection() {
        if (tabsRouter.activeIndex == 3) {
          // 1はこのタブのインデックス
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
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            color: Colors.white,
                            child: ListTile(
                              trailing: const Icon(Icons.arrow_forward_ios),
                              title: Text(item?.minorTitle ?? 'No Title'),
                              subtitle:
                                  Text(item?.minorSummary ?? 'No Summary'),
                              onTap: () async {
                                await context.router.pushNamed(
                                  '/tabHomeMinor/$key/false',
                                );
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
