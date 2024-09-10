import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/debug/debug_print.dart';
import 'package:flutter_template/module/firebase/model_firebase_pdf_config.dart';
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
