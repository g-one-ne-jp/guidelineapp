// Dart imports:
import 'dart:io';

import 'package:JCSGuidelines/providers/toc_provider.dart';
import 'package:JCSGuidelines/providers/user_provider.dart';
import 'package:JCSGuidelines/repotitory/mixin_repository_firestorage.dart';
import 'package:JCSGuidelines/ui/page/root/up_page_root_select_guideline.dart';
import 'package:JCSGuidelines/ui/util/ui_util_tab_back_handler.dart';
// Package imports:
import 'package:auto_route/auto_route.dart';
// Flutter imports:
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
// ignore: must_be_immutable
class UiPageHomeCatalogTabHome extends HookConsumerWidget
    with RepositoryFireStorage {
  UiPageHomeCatalogTabHome({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(
        "-------------------------------------------HOMEカタログタブ-------------------------------------------");
    final _userProvider = ref.watch(userProvider);
    final _userNotifer = ref.watch(userProvider.notifier);

    final _tocProvider = ref.watch(tocProvider);
    final _tocNotifer = ref.watch(tocProvider.notifier);

    useEffect(() {
      Future<void>(() async {
        await _userNotifer.readTocs();
      });
      return null;
//      return () => customDebugPrint('dispose!');
    }, []);

    // TabBackHandler: Android◀・Androidスワイプ・iOSスワイプ 全てに対応
    return TabBackHandler(
      onBack: () => context.router.root.popUntilRoot(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(''),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // この画面はタブ内のサブルートである。
              // なので、タブのルーターのルート(タブではなく親のルーター）まで遡って
              // initialな画面に戻る。
              context.router.root.popUntilRoot();
            },
          ),
        ),
        body: Container(
          color: Colors.grey[200],
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: downLoadData(
                      context: context,
                      path:
                          'gidline/cover/${GuidelineFile.instance.getCoverName()}'),
                  builder: (context, snapshot) {
                    return snapshot.data == null
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : FutureBuilder(
                            future:
                                PDFDocument.fromFile(File(snapshot.data!.path)),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return Stack(
                                  children: [
                                    PDFViewer(
                                      showIndicator: false,
                                      showNavigation: false,
                                      showPicker: false,
                                      enableSwipeNavigation: false,
                                      document: snapshot.data!,
                                    ),
                                    Container(
                                      color: Colors.transparent,
                                    )
                                  ],
                                );
                              }
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          );
                  },
                ),
              ),
              //
              Container(
                padding: EdgeInsets.all(5.0.w),
                // 横幅いっぱいにする
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final currentPath = AutoRouter.of(context).currentPath;
                    // "/catalog/tabHome" + "/toc"
                    // のpathを組み立てて、タブ内のさぶるーととして画面遷移させる。
                    context.router.pushNamed(
                      '$currentPath/toc',
                    );
                  },
                  child: Text(
                    'ガイドラインを開く',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ), // Scaffold
    ); // TabBackHandler
  }
}
