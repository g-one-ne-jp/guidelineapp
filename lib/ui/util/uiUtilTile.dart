// Dart imports:
import 'dart:convert';
import 'dart:io';

// Flutter imports:
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

// Project imports:
import 'package:JCSGuidelines/debug/debug_print.dart';
import 'package:JCSGuidelines/module/firebase/model_firebase_pdf_config.dart';
import 'package:JCSGuidelines/repotitory/mixin_repository_firestorage.dart';

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
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10),
              child: Text(
                sub.subTitle != title && children.isNotEmpty
                    ? title
                    : sub.minors.entries.first.value.minorTitle != title &&
                            children.isEmpty
                        ? title
                        : '',
                style: TextStyle(
                  fontSize: 20.0.sp,
                  color: const Color(0xFF50555C),
                ),
              ),
            ),
            Card(
              color: Color(0xfffccfae),
              child: children.isEmpty
                  ? ListTile(
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                      title: Text(sub.minors.entries.first.value.minorTitle,
                          style: const TextStyle(
                            color: Colors.black,
                          )),
                      onTap: () {
                        onTap(sub.minors.entries.first.value.minorKey);
                      },
                    )
                  : ExpansionTile(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                        side: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      trailing: Icon(
                        _isExpanded.value
                            ? Icons.remove // 展開されている場合のアイコン
                            : Icons.add, // 折りたたまれている場合のアイコン
                        color: Colors.black,
                      ),
                      onExpansionChanged: (bool expanded) {
                        _isExpanded.value = expanded;
                      },
                      title: Text(sub.subTitle,
                          style: const TextStyle(
                            color: Colors.black,
                          )),
                      subtitle: sub.subSummary.isNotEmpty
                          ? Text(sub.subSummary)
                          : null,
                      children: sub.minors.entries.map((item) {
                        return Column(
                          children: [
                            const Divider(),
                            ListTile(
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                              ),
                              title: Text(item.value.minorTitle,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  )),
                              onTap: () {
                                onTap(item.key);
                              },
                            ),
                          ],
                        );
                      }).toList(),
                    ),
            ),
          ],
        ),
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
        onTap: (value) {
          onMinorTap(sub.minors[value]!);
        },
        children: sub.minors,
      );
    }
    //1件のみマイナーが存在していたら
    else {
      return createCard(
        title: sub.minors.entries.first.value.minorTitle,
        summary: sub.minors.entries.first.value.minorSummary,
        onTap: (value) {
          onMinorTap(sub.minors[value]!);
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
                    backgroundColor: Color(0xFFFFcfae),
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
                      return Container();
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
  var _pdfPath = '';
  var _loading = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _settions = useState(<Widget>[]);
    final _updateCnt = useState(0);
    _settions.value.clear();

    //  final pdfPath = useState('');

    Future<WebViewController> initController(String path) async {
      final html = File(path).readAsStringSync();
      return WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
            NavigationDelegate(onPageStarted: (String url) {}))
        ..loadRequest(
          Uri.dataFromString(
            html,
            mimeType: "text/html",
            encoding: Encoding.getByName("utf-8"),
          ),
        );
    }

    if (_loading) {
      _loading = false;
      Navigator.of(context, rootNavigator: true).pop();
    } //useEffect(() {
    deteil.contents.entries.map((a) => a).toList().forEach((element) {
      element.value.settions.entries.map((a) => a).toList().forEach((element) {
        _settions.value = List.from(_settions.value)
          ..add(
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
                                      context: context,
                                      path: element.value.markdown),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      if (snapshot.data == null) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      } else {
                                        return FutureBuilder(
                                          future: initController(
                                              snapshot.data!.path),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.done) {
                                              if (snapshot.data == null) {
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              }
                                              return Container(
                                                padding: EdgeInsets.all(10.w),
                                                color: Colors.red,
                                                child: WebViewWidget(
                                                    controller: snapshot.data!),
                                              );
                                            }

                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                        );
                                      }
                                    }

                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                )
                              : FutureBuilder(
                                  future: downLoadData(
                                      context: context,
                                      path: element.value.pdfId),
                                  builder: (context, snapshot) {
                                    if (snapshot.data == null) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    } else {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        _pdfPath = snapshot.data!.path;
                                      }
                                      return snapshot.data == null
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : FutureBuilder(
                                              future: isFileUpdate(
                                                  context: context,
                                                  path: element.value.pdfId),
                                              builder: (context, isUpdate) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    onPdfTap(
                                                        snapshot.data!.path);
                                                  },
                                                  child: Stack(children: [
                                                    pdfView(
                                                        snapshot.data!.path),
                                                    Container(
                                                      color: Colors.transparent,
                                                    ),
                                                    isUpdate.data == null
                                                        ? Container()
                                                        : isUpdate.data!
                                                            ? Positioned(
                                                                top: 0,
                                                                right: 0,
                                                                child:
                                                                    IconButton(
                                                                  iconSize:
                                                                      30.w,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .download_for_offline,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    await showDialog<
                                                                        bool>(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (BuildContext
                                                                              context) {
                                                                        return CupertinoAlertDialog(
                                                                          title:
                                                                              const Text('資料が更新されています。'),
                                                                          content:
                                                                              const Text('資料を更新しますか？　更新した場合は、現在の資料は削除されます。'),
                                                                          actions: <Widget>[
                                                                            TextButton(
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                              child: const Text('キャンセル'),
                                                                            ),
                                                                            TextButton(
                                                                              onPressed: () async {
                                                                                Navigator.of(context).pop();

                                                                                showDialog(
                                                                                  context: context,
                                                                                  barrierDismissible: false,
                                                                                  builder: (BuildContext context) {
                                                                                    return const Center(
                                                                                      child: CircularProgressIndicator(),
                                                                                    );
                                                                                  },
                                                                                );
                                                                                _loading = true;

                                                                                await downLoadData(context: context, isNewUpdate: true, path: element.value.pdfId).then((value) {
                                                                                  _pdfPath = value!.path;
                                                                                  _settions.value.clear();
                                                                                  _updateCnt.value++;
                                                                                });
                                                                              },
                                                                              child: const Text('更新'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              )
                                                            : Container(),
                                                  ]),
                                                );
                                              },
                                            );
                                    }
                                  },
                                ),
                    ),
                  ],
                ),
              ],
            ),
          );
      });
    });

    //  return () => customDebugPrint('dispose!');
    //}, []);

    return Container(
      color: const Color(0xFFEFEFEF),
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            height: 80.h,
          ),
          Card(
            color: const Color(0xFFEFEFEF),
            margin: EdgeInsets.all(10.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0.r),
            ),
            child: Container(
              padding: EdgeInsets.all(5.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 5.h,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    color: const Color(0xFFEFEFEF),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          deteil.detailTitle,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
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
                    child: Container(
                      color: Color(0xfffccfae),
                      child: Column(children: _settions.value),
                    ),
                  ),
                  Container(
                    color: const Color(0xFFEFEFEF),
                    height: 5.h,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
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
                  color: Colors.white,
                  width: 1.0, // 下線の太さ
                ),
              ),
      ),
      child: ExpansionTile(
        trailing: Icon(
          color: Colors.black,
          _isExpanded.value
              ? Icons.remove // 展開されている場合のアイコン
              : Icons.add, // 折りたたまれている場合のアイコン
        ),
        onExpansionChanged: (bool expanded) {
          _isExpanded.value = expanded;
        },
        title: Text(
          titile,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        children: children,
      ),
    );
  }
}

Widget pdfView(String path) {
  return FutureBuilder(
    future: PDFDocument.fromFile(File(path)),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done &&
          snapshot.data != null) {
        return Stack(
          children: [
            PDFViewer(
              showIndicator: true,
              showNavigation: true,
              showPicker: true,
              enableSwipeNavigation: true,
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
}
