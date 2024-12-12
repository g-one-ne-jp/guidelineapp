// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:JCSGuidelines/ui/page/home/tab/ui_page_home_catalog_tab_bookmark.dart';
import 'package:JCSGuidelines/ui/page/home/tab/ui_page_home_catalog_tab_home.dart';
import 'package:JCSGuidelines/ui/page/home/tab/ui_page_home_catalog_tab_home_minor.dart';
import 'package:JCSGuidelines/ui/page/home/tab/ui_page_home_catalog_tab_home_toc.dart';
import 'package:JCSGuidelines/ui/page/home/tab/ui_page_home_catalog_tab_memo.dart';
import 'package:JCSGuidelines/ui/page/home/tab/ui_page_home_catalog_tab_mypage.dart';
import 'package:JCSGuidelines/ui/page/home/tab/ui_page_home_catalog_tab_search.dart';
import 'package:JCSGuidelines/ui/page/home/ui_page_home.dart';
import 'package:JCSGuidelines/ui/page/home/ui_page_home_catalog.dart';
import 'package:JCSGuidelines/ui/page/root/ui_page_root_emailverifacation.dart';
import 'package:JCSGuidelines/ui/page/root/up_page_root_login.dart';
import 'package:JCSGuidelines/ui/page/root/up_page_root_profile.dart';
import 'package:JCSGuidelines/ui/page/root/up_page_root_signup.dart';
import 'package:JCSGuidelines/ui/util/uiUtilEdit.dart';
import 'package:JCSGuidelines/util/util_googlesingin.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  //ルーティングの設定
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: UiRouteLogin.page,
          path: '/login',
          guards: [
            AuthGuard(),
          ],
        ), // ログイン済みでなければアクセスできない

        AutoRoute(page: UiRouteHome.page, path: '/home'),
        AutoRoute(page: UiRouteSingup.page, path: '/singup'),
        AutoRoute(page: UiRouteProfileCreate.page, path: '/profileCreate'),
        AutoRoute(
            page: UiRouteEmailVerification.page, path: '/emailVerification'),
        AutoRoute(
            page: UiRouteUtilEdit.page, path: '/edit/:mainorKey/:viewTypeMemo'),

        AutoRoute(
          page: UiRouteHomeCatalog.page,
          path: '/catalog',
          children: [
            AutoRoute(
              page: UiRouteHomeCatalogTabHome.page,
              path: 'tabHome',
            ),
            AutoRoute(
              page: UiRouteHomeCatalogTabSearch.page,
              path: 'catalogTab2',
            ),
            AutoRoute(
                page: UiRouteHomeCatalogTabMemo.page, path: 'catalogTab3'),
            AutoRoute(
                page: UiRouteHomeCatalogTabBookmark.page, path: 'catalogTab4'),
            AutoRoute(
                page: UiRouteHomeCatalogTabMypage.page, path: 'catalogTab5'),
          ],
        ),
        AutoRoute(
          page: UiRouteHomeCatalogTabHomeTOC.page,
          path: '/toc',
        ),
        AutoRoute(
            page: UiRouteHomeCatalogTabHomeMinor.page,
            path: '/tabHomeMinor/:mainorKey/:viewTypeMemo'),
      ];
}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // ログイン状態の確認
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final user = FirebaseAuth.instance.currentUser!;
      //email認証が終わってる？
      if (user.emailVerified || !utilAuthIsLoginTypePassWord()) {
        // ログイン済みの場合はホーム画面などへ遷移
        router.replaceNamed('/home'); // ログイン成功したら元のパスへ
      }
      //認証がまだ
      else {
        // メール認証確認画面
        router.replaceNamed('/emailVerification');
      }
    } else {
      // 未ログインの場合はログイン画面へ遷移
      resolver.next(true);
    }
  }
}
