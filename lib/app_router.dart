// Flutter imports:
// Project imports:
import 'package:JCSGuidelines/ui/page/home/tab/tab_wrapper_screen.dart';
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
import 'package:JCSGuidelines/ui/page/root/up_page_root_select_guideline.dart';
import 'package:JCSGuidelines/ui/page/root/up_page_root_signup.dart';
import 'package:JCSGuidelines/ui/util/uiUtilEdit.dart';
import 'package:JCSGuidelines/util/util_googlesingin.dart';
// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  //ルーティングの設定
  @override
  List<AutoRoute> get routes => [
        // ログイン画面
        AutoRoute(
          initial: true,
          page: UiRouteLogin.page,
          path: '/login',
          guards: [
            AuthGuard(),
          ],
        ), // ログイン済みでなければアクセスできない

        // ガイドラインを選ぶ画面。
        AutoRoute(page: UiRouteSelectGuideline.page, path: '/selectGuideline'),

        // ログイン情報があるかチェックする画面。
        AutoRoute(page: UiRouteHome.page, path: '/home'),
        // ユーザ登録画面
        AutoRoute(page: UiRouteSingup.page, path: '/singup'),
        // プロフィール作成画面
        AutoRoute(page: UiRouteProfileCreate.page, path: '/profileCreate'),
        // メール認証画面
        AutoRoute(
            page: UiRouteEmailVerification.page, path: '/emailVerification'),

        // 編集画面
        AutoRoute(
            page: UiRouteUtilEdit.page, path: '/edit/:minorKey/:viewTypeMemo'),

        // タブがある画面
        // /catalog で UiRouteHomeCatalog を呼び出し、この内部実装で
        // タブの並び等を組み立て。
        // 子要素として各種タブが、どのようなpathかを定義。
        // 例えば [ホーム] というタブを押したときは /catalog/tabHome というpathで
        // UiRouteHomeCatalogTabHome が表示される...など。
/*
            AutoRoute(
              path: 'tab1',
              page: Tab1WrapperRoute.page,
              children: [
                AutoRoute(path: '', page: Tab1Route.page),
                AutoRoute(path: 'sub', page: Tab1SubRoute.page),
              ],

*/

        AutoRoute(
          page: UiRouteHomeCatalog.page,
          path: '/catalog',
          children: [
            // /catalog/tabHome で空白のTabWrapperScreenを呼び出し...
            AutoRoute(
              path: 'tabHome',
              page: TabWrapperRouteHome.page,
              children: [
              // ↑のラッパーの子（サブルート）のカレントがUiRouteHomeCatalogTabHome
              AutoRoute(
                  path: '',
                  page: UiRouteHomeCatalogTabHome.page,
                  initial: true),
              // /catalog/tabHome/toc でTOC画面を呼び出し
              AutoRoute(
                path: 'toc',
                page: UiRouteHomeCatalogTabHomeTOC.page,
              ),
              // /catalog/tabHomeMinor/:minorKey/:viewTypeMemo でマイナー画面を呼び出し
              AutoRoute(
                path: 'toc/tabHomeMinor/:minorKey/:viewTypeMemo',
                page: UiRouteHomeCatalogTabHomeMinor.page,
              ),
              ],
            ),

            // /catalog/catalogTab2 で空白のTabWrapperRouteSearchを呼び出し...
            AutoRoute(
              path: 'catalogTab2',
              page: TabWrapperRouteSearch.page,
              children: [
                AutoRoute(
                  path: '',
                  page: UiRouteHomeCatalogTabSearch.page,
                ),
                AutoRoute(
                  // ここ(UiRouteHomeCatalogTabSearch内)では
                  //pushNamed('tabHomeMinor/${result['key']}/false');で
                  // /tabHomeMinor/${result['key']}/false に飛べる。
                  path: 'tabHomeMinor/:minorKey/:viewTypeMemo',
                  page: UiRouteHomeCatalogTabHomeMinor.page,
                ),
              ],
            ),

            AutoRoute(
              path: 'catalogTab3',
              page: TabWrapperRouteMemo.page,
              children: [
                AutoRoute(
                  path: '',
                  page: UiRouteHomeCatalogTabMemo.page,
                ),
                AutoRoute(
                  path: 'tabHomeMinor/:minorKey/:viewTypeMemo',
                  page: UiRouteHomeCatalogTabHomeMinor.page,
                ),
              ],
            ),

            AutoRoute(
              path: 'catalogTab4',
              page: TabWrapperRouteBookmark.page,
              children: [
                AutoRoute(
                  path: '',
                  page: UiRouteHomeCatalogTabBookmark.page,
                ),
                AutoRoute(
                  path: 'tabHomeMinor/:minorKey/:viewTypeMemo',
                  page: UiRouteHomeCatalogTabHomeMinor.page,
                ),
              ],
            ),

            // AutoRoute(
            //     page: UiRouteHomeCatalogTabBookmark.page, path: 'catalogTab4'),
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
            path: '/tabHomeMinor/:minorKey/:viewTypeMemo'),
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
        router.replaceNamed('/selectGuideline'); // ログイン成功したら元のパスへ
      }
      //認証がまだ
      else {
        // 未ログインの場合はログイン画面へ遷移
        resolver.next(true);
      }
    } else {
      // 未ログインの場合はログイン画面へ遷移
      resolver.next(true);
    }
  }
}
