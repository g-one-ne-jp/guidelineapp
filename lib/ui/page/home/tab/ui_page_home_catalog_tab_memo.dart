import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/module/firebase/model_firebase_pdf_config.dart';
import 'package:flutter_template/module/firebase/model_firebase_user.dart';
import 'package:flutter_template/providers/toc_provider.dart';
import 'package:flutter_template/providers/user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
        final mainorKey = _tocNotifer.searchMainorKeyFromDetailKeyFromMajor(
            _tocProvider, key);
        return MapEntry(mainorKey, doc);
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _memoItems.value.length,
              itemBuilder: (BuildContext context, int index) {
                var key = _memoItems.value.keys.elementAt(index);
                var item = _memoItems.value[key];
                return Card(
                  child: ListTile(
                    title: Text(item?.detailTitle ?? 'No Title'),
                    subtitle: Text(
                        _userProvider.memos[item?.detailKey] ?? 'No Summary'),
                    onTap: () async {
                      await context.router.pushNamed(
                        '/tabHomeMinor/${key}/true',
                      );
                      fetchMemoItems();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
