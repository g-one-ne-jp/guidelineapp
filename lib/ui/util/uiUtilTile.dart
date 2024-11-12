// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// Project imports:
import 'package:flutter_template/debug/debug_print.dart';
import 'package:flutter_template/main.dart';
import 'package:flutter_template/module/firebase/model_firebase_pdf_config.dart';
import 'package:flutter_template/repotitory/mixin_repository_firestorage.dart';
import 'package:flutter_template/ui/page/home/tab/ui_page_home_catalog_tab_home.dart';
import 'package:flutter_template/ui/page/home/ui_page_home.dart';
import 'package:flutter_template/ui/util/uiUtilWidget.dart';

// ignore: must_be_immutable
class UiUtilWidgetTile extends HookConsumerWidget {
  UiUtilWidgetTile({
    super.key,
    required this.sub,
    required this.onMinorTap,
  });

  var sub = SubCategory();
  final Function(MinorCategory) onMinorTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _isExpanded = useState(false);

    useEffect(() {
      Future<void>(() async {});
      return () => customDebugPrint('dispose!');
    }, []);

    Widget createCard({
      required String title,
      required String summary,
      required Function onTap,
      required Map<String, MinorCategory> children,
    }) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20.0.sp,
                color: const Color(0xFF50555C),
              ),
            ),
          ),
          Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            color: Colors.white,
            child: Card(
              color: Colors.white,
              child: children.isEmpty
                  ? ListTile(
                      trailing: const Icon(Icons.arrow_forward_ios),
                      title: Text(sub.minors.entries.first.value.minorTitle),
                      onTap: () {
                        onTap();
                      },
                    )
                  : ExpansionTile(
                      trailing: Icon(
                        _isExpanded.value
                            ? Icons.remove // 展開されている場合のアイコン
                            : Icons.add, // 折りたたまれている場合のアイコン
                      ),
                      onExpansionChanged: (bool expanded) {
                        _isExpanded.value = expanded;
                      },
                      title: Text(sub.subTitle),
                      subtitle: Text(sub.subSummary),
                      children: sub.minors.entries.map((item) {
                        return ListTile(
                          trailing: const Icon(Icons.arrow_forward_ios),
                          title: Text(item.value.minorTitle),
                          onTap: () {
                            onTap();
                          },
                        );
                      }).toList(),
                    ),
            ),
          ),
        ],
      );
    }

    //1件もない
    if (sub.minors.isEmpty) {
      return createCard(
        title: sub.subTitle,
        summary: sub.subSummary,
        onTap: () {
          Fluttertoast.showToast(
            msg: 'minorが存在しません',
          );
        },
        children: {},
      );
    }
    //1件以上マイナーが存在していたら
    else if (sub.minors.length > 1) {
      return createCard(
        title: sub.subTitle,
        summary: sub.subSummary,
        onTap: () {
          onMinorTap(sub.minors.entries.first.value);
        },
        children: sub.minors,
      );
    }
    //1件のみマイナーが存在していたら
    else {
      return createCard(
        title: sub.minors.entries.first.value.minorTitle,
        summary: sub.minors.entries.first.value.minorSummary,
        onTap: () {
          onMinorTap(sub.minors.entries.first.value);
        },
        children: {},
      );
    }
  }
}

// ignore: must_be_immutable
class UiUtilWidgetTile2 extends HookConsumerWidget {
  UiUtilWidgetTile2({
    super.key,
    required this.minor,
    required this.onMinorTap,
  });

  var minor = MinorCategory();
  final Function(MinorCategory) onMinorTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _isExpanded = useState(false);

    useEffect(() {
      Future<void>(() async {});
      return () => customDebugPrint('dispose!');
    }, []);

    Widget createCard({
      required String title,
      required String summary,
      required Function onTap,
      required Map<String, DetailCategory> children,
    }) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title),
          ),
          Card(
            color: Colors.white,
            child: children.isEmpty
                ? ListTile(
                    trailing: const Icon(Icons.arrow_forward_ios),
                    title:
                        Text(minor.details.entries.first.value.detailSummary),
                    onTap: () {
                      onTap();
                    },
                  )
                : ExpansionTile(
                    trailing: Icon(
                      _isExpanded.value
                          ? Icons.remove // 展開されている場合のアイコン
                          : Icons.add, // 折りたたまれている場合のアイコン
                    ),
                    onExpansionChanged: (bool expanded) {
                      _isExpanded.value = expanded;
                    },
                    title: Text(minor.minorTitle),
                    subtitle: Text(minor.minorSummary),
                    children: minor.details.entries.map((item) {
                      return ListTile(
                        trailing: const Icon(Icons.arrow_forward_ios),
                        title: Text(item.value.detailTitle),
                        onTap: () {
                          onTap();
                        },
                      );
                    }).toList(),
                  ),
          ),
        ],
      );
    }

    return createCard(
      title: minor.minorTitle,
      summary: minor.minorTitle,
      onTap: () {
        //onMinorTap(sub.minors.entries.first.value);
      },
      children: minor.details,
    );
  }
}

class UiUtilWidgetTile3 extends HookConsumerWidget with RepositoryFireStorage {
  UiUtilWidgetTile3({
    super.key,
    required this.deteil,
    required this.onPdfTap,
    required this.onDeteilEdit,
  });

  var deteil = DetailCategory();

  final Function(DetailCategory) onDeteilEdit;
  final Function(String path) onPdfTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _settions = useState(<Widget>[]);
    var _pdfPath = '';
    useEffect(() {
      deteil.contents.entries.map((a) => a).toList().forEach((element) {
        element.value.settions.entries
            .map((b) => b)
            .toList()
            .forEach((element) {
          _settions.value = List.from(_settions.value)
            ..insert(
              0,
              UiUtilWidgetExpansionTile(
                titile: element.value.settionTitle,
                children: [
                  Column(
                    children: [
                      const Divider(),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            minHeight: 120.h, maxHeight: 360.h), // 最大の高さを200に設定
                        child:
                            //MarkdownWidget(data: element.value.markdown)
                            element.value.pdfId.isEmpty
                                ? FutureBuilder(
                                    future: downLoadData(
                                        path: element.value.markdown),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        return MarkdownWidget(
                                            data: File(snapshot.data!.path)
                                                .readAsStringSync());
                                      }

                                      return const CircularProgressIndicator();
                                    },
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      onPdfTap(_pdfPath);
                                    },
                                    child: Stack(
                                      children: [
                                        FutureBuilder(
                                          future: downLoadData(
                                              path: element.value.pdfId),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.done) {
                                              _pdfPath = snapshot.data!.path;
                                              return PDFView(
                                                filePath: _pdfPath,
                                                enableSwipe: true,
                                                swipeHorizontal: true,
                                                autoSpacing: false,
                                                pageFling: false,
                                                backgroundColor: Colors.grey,
                                                onRender: (_pages) {},
                                                onError: (error) {
                                                  print(error.toString());
                                                },
                                                onPageError: (page, error) {
                                                  print(
                                                      '$page: ${error.toString()}');
                                                },
                                                onViewCreated:
                                                    (PDFViewController
                                                        pdfViewController) {},
                                              );
                                            }

                                            return const CircularProgressIndicator();
                                          },
                                        ),
                                        Container(
                                          color: Colors.transparent,
                                        ),
                                      ],
                                    ),
                                  ),
                      ),
                    ],
                  ),
                ],
              ),
            );
        });
      });

      return () => customDebugPrint('dispose!');
    }, []);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.transparent,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(deteil.detailTitle),
              IconButton(
                onPressed: () {
                  onDeteilEdit(deteil);
                },
                icon: const Icon(Icons.edit),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            color: Colors.white,
            child: Column(children: _settions.value),
          ),
        ),
      ],
    );
  }
}

class UiUtilWidgetExpansionTile extends HookConsumerWidget {
  const UiUtilWidgetExpansionTile({
    super.key,
    required this.children,
    required this.titile,
  });

  final String titile;
  final List<Widget> children;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _isExpanded = useState(false);

    useEffect(() {
      Future<void>(() async {});
      return () => customDebugPrint('dispose!');
    }, []);

    return Container(
      decoration: BoxDecoration(
        border: _isExpanded.value
            ? null
            : const Border(
                bottom: BorderSide(
                  width: 1.0, // 下線の太さ
                ),
              ),
      ),
      child: ExpansionTile(
        trailing: Icon(
          _isExpanded.value
              ? Icons.remove // 展開されている場合のアイコン
              : Icons.add, // 折りたたまれている場合のアイコン
        ),
        onExpansionChanged: (bool expanded) {
          _isExpanded.value = expanded;
        },
        title: Text(titile),
        children: children,
      ),
    );
  }
}
