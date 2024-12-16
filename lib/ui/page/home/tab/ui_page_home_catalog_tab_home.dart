// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:JCSGuidelines/debug/debug_print.dart';
import 'package:JCSGuidelines/providers/toc_provider.dart';
import 'package:JCSGuidelines/providers/user_provider.dart';
import 'package:JCSGuidelines/repotitory/mixin_repository_firestorage.dart';
import 'package:JCSGuidelines/ui/util/uiUtilTile.dart';

@RoutePage()
// ignore: must_be_immutable
class UiPageHomeCatalogTabHome extends HookConsumerWidget
    with RepositoryFireStorage {
  UiPageHomeCatalogTabHome({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _userProvider = ref.watch(userProvider);
    final _userNotifer = ref.watch(userProvider.notifier);

    final _tocProvider = ref.watch(tocProvider);
    final _tocNotifer = ref.watch(tocProvider.notifier);

    useEffect(() {
      Future<void>(() async {
        await _userNotifer.readTocs();
      });
      return () => customDebugPrint('dispose!');
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: Text('表紙'),
        automaticallyImplyLeading: false, // 戻るボタンを表示しない
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: downLoadData(path: 'gidline/cover/ガイドライン_表紙.pdf'),
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
              padding: EdgeInsets.all(10.0.w),
              // 横幅いっぱいにする
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  context.router.pushNamed(
                    '/toc',
                  );
                },
                child: const Text('ガイドラインを開く'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
