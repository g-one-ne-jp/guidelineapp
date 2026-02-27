// Flutter imports:
// Project imports:
import 'package:JCSGuidelines/app_router.dart';
import 'package:JCSGuidelines/ui/util/uiUtilDialog.dart';
// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
// ignore: must_be_immutable
class UiPageHomeCatalog extends HookConsumerWidget {
  const UiPageHomeCatalog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future<void>(() async {});
      return null;
//      return () => customDebugPrint('dispose!');
    }, []);

    return PopScope(
      canPop: false, // バックキーおよび戻るジェスチャを無効化
      child: AutoTabsScaffold(
        routes: [
          //UiRouteHomeCatalogTabHome(),
          TabWrapperRouteHome(),
          const UiRouteHomeCatalogTabSearch(),
          const UiRouteHomeCatalogTabMemo(),
          UiRouteHomeCatalogTabBookmark(),
          UiRouteHomeCatalogTabMypage(),
        ],
        transitionBuilder: (context, child, animation) => FadeTransition(
          opacity: animation,
          child: child,
        ),
        bottomNavigationBuilder: (_, tabsRouter) {
          return BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              // タブを切り替え、かつそのタブのスタックをルートまで戻す
              if (index == 4) {
                if (FirebaseAuth.instance.currentUser == null) {
                  showLoginDialog(context,
                      content: 'マイページを利用するには会員登録/ログインが必要です。ログイン画面に移動しますか？');
                  return;
                }
              }

              tabsRouter.setActiveIndex(index);
                            
              if (index == 0) {
                // ホーム（index: 0）の場合、スタックを完全に破棄して初期画面（カバー）で置き換える
                // これによりロード画面から来たときと同じ状態になる
                tabsRouter
                    .stackRouterOfIndex(0)
                    ?.replaceAll([UiRouteHomeCatalogTabHome()]);
              } else {
                // 遷移先のタブのスタックを強制的にトップに戻す
                tabsRouter.stackRouterOfIndex(index)?.popUntilRoot();
              }
            },
            backgroundColor: Colors.red,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(label: 'ホーム', icon: Icon(Icons.home)),
              BottomNavigationBarItem(label: '検索', icon: Icon(Icons.search)),
              BottomNavigationBarItem(
                  label: 'メモ', icon: Icon(Icons.message_outlined)),
              BottomNavigationBarItem(
                  label: 'ブックマーク', icon: Icon(Icons.bookmark)),
              BottomNavigationBarItem(label: 'マイページ', icon: Icon(Icons.person)),
            ],
          );
        },
      ),
    );
  }
}

