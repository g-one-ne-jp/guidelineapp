// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:JCSGuidelines/debug/debug_print.dart';
import 'package:JCSGuidelines/providers/toc_provider.dart';
import 'package:JCSGuidelines/providers/user_provider.dart';
import 'package:JCSGuidelines/ui/util/uiUtilTile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
// ignore: must_be_immutable
class UiPageHomeCatalogTabHomeTOC extends HookConsumerWidget {
  UiPageHomeCatalogTabHomeTOC({
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
        title: Text(_tocProvider.majorTitle),
      ),
      body: Container(
        color: Colors.grey[400],
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 60.h,
              color: const Color(0xFFE4007F),
              child: Center(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    _tocProvider.majorSummary,
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
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
                        context.router.pushNamed(
                          '/tabHomeMinor/${minor.mainorKey}/false',
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
