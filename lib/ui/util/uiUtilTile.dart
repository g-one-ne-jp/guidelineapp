import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/debug/debug_print.dart';
import 'package:flutter_template/main.dart';
import 'package:flutter_template/module/firebase/model_firebase_pdf_config.dart';
import 'package:flutter_template/ui/page/home/tab/ui_page_home_catalog_tab_home.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
            child: Text(title),
          ),
          Card(
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

class UiUtilWidgetTile3 extends HookConsumerWidget {
  UiUtilWidgetTile3({
    super.key,
    required this.deteil,
    required this.onMinorTap,
  });

  var deteil = DetailCategory();
  final Function(MinorCategory) onMinorTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _settions = useState(<Widget>[]);

    useEffect(() {
      deteil.contents.entries.map((a) => a).toList().forEach((element) {
        element.value.settions.entries
            .map((b) => b)
            .toList()
            .forEach((element) {
          _settions.value.insert(
            0,
            UiUtilWidgetExpansionTile(
              titile: element.value.settionTitle,
              children: [
                Column(
                  children: [
                    const Divider(),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(element.value.markdown),
                    ),
                    const Divider(),
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
          color: Colors.grey[300],
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(deteil.detailTitle),
              IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
            ],
          ),
        ),
        Card(
          child: Column(children: _settions.value),
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