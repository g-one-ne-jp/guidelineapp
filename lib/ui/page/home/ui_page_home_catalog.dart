// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:JCSGuidelines/app_router.dart';
import 'package:JCSGuidelines/debug/debug_print.dart';
import 'package:JCSGuidelines/repotitory/mixin_repository_firestore.dart';

@RoutePage()
// ignore: must_be_immutable
class UiPageHomeCatalog extends HookConsumerWidget {
  UiPageHomeCatalog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future<void>(() async {});
      return () => customDebugPrint('dispose!');
    }, []);

    return AutoTabsScaffold(
      routes: [
        UiRouteHomeCatalogTabHome(),
        UiRouteHomeCatalogTabSearch(),
        UiRouteHomeCatalogTabMemo(),
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
          onTap: tabsRouter.setActiveIndex,
          backgroundColor: Colors.red,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(label: 'ホーム', icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: '検索', icon: Icon(Icons.search)),
            BottomNavigationBarItem(label: 'メモ', icon: Icon(Icons.edit)),
            BottomNavigationBarItem(
                label: 'ブックマーク', icon: Icon(Icons.bookmark)),
            BottomNavigationBarItem(label: 'マイページ', icon: Icon(Icons.person)),
          ],
        );
      },
    );
  }
}
