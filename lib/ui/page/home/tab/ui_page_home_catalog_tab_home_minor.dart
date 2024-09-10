import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/debug/debug_print.dart';
import 'package:flutter_template/providers/toc_provider.dart';
import 'package:flutter_template/repotitory/mixin_repository_firestore.dart';
import 'package:flutter_template/ui/util/uiUtilTile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
// ignore: must_be_immutable
class UiPageHomeCatalogTabHomeMinor extends HookConsumerWidget
    with RepositoryFireStore {
  UiPageHomeCatalogTabHomeMinor({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _tocProvider = ref.watch(tocProvider);
    final _tocNotifer = ref.watch(tocProvider.notifier);

    useEffect(() {
      Future<void>(() async {
        await readTocs();
      });
      return () => customDebugPrint('dispose!');
    }, []);

    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 60.h,
          color: Colors.pink,
          child: const Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'ガイドライン改訂版',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _tocProvider.subs.keys.toList().length,
            itemBuilder: (BuildContext context, int index) {
              var value = _tocProvider.subs.values.toList()[index];

              return UiUtilWidgetTile(
                  sub: value,
                  onMinorTap: (minor) {
                    var b = 0;
                    var a = 0;
                  });
            },
          ),
        ),
      ],
    );
  }
}
