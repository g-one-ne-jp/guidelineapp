import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/debug/debug_print.dart';
import 'package:flutter_template/module/firebase/model_firebase_pdf_config.dart';
import 'package:flutter_template/providers/toc_provider.dart';
import 'package:flutter_template/providers/user_provider.dart';
import 'package:flutter_template/repotitory/mixin_repository_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
// ignore: must_be_immutable
class UiPageHome extends HookConsumerWidget {
  UiPageHome({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _userProvider = ref.watch(userProvider);
    final _userNotifer = ref.watch(userProvider.notifier);

    final _tocProvider = ref.watch(tocProvider);
    final _tocNotifer = ref.watch(tocProvider.notifier);

    final _tos = useState(ModelFirebasePdfConfig());

    useEffect(() {
      Future<void>(() async {
        _tos.value = await _userNotifer.readTocs();
      });
      return () => customDebugPrint('dispose!');
    }, []);

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 60.h,
            color: Colors.cyan,
            child: const Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text('ガイドライン改訂版'),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tos.value.categories.keys.toList().length,
              itemBuilder: (BuildContext context, int index) {
                var value = _tos.value.categories.values.toList()[index];

                return Card(
                  child: ListTile(
                    title: Text(value.majorTitle),
                    onTap: () {
                      //選択した目次のIDを保持
                      _tocNotifer.writeToc(data: value);

                      context.router.pushNamed(
                        '/catalog',
                      );
                      customDebugPrint('onTap');
                    },
                  ),
                );
              },
            ),
          ),
          /*
          Expanded(
            child: ListView.builder(
              itemCount: _tos.value.categories.keys.toList().length,
              itemBuilder: (BuildContext context, int index) {
                var value = _tos.value.categories.values.toList()[index];

                return Card(
                  child: ExpansionTile(
                    title: Text(value.majorTitle),
                    subtitle: Text(value.majorSummary),
                    children: value.subs.entries.map((item) {
                      return ListTile(
                        title: Text(item.value.subTitle),
                        onTap: () {
                          //選択した目次のIDを保持
                          selectedTocId(
                              id: _tos.value.categories.keys.toList()[index]);
                          context.router.pushNamed(
                            '/catalog',
                          );
                          customDebugPrint('onTap');
                        },
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ),
          */
        ],
      )),
    );
  }
}
