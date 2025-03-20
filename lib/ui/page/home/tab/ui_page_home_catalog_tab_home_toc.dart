// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:JCSGuidelines/debug/debug_print.dart';
import 'package:JCSGuidelines/providers/toc_provider.dart';
import 'package:JCSGuidelines/providers/user_provider.dart';
import 'package:JCSGuidelines/ui/util/uiUtilTile.dart';

@RoutePage()
// ignore: must_be_immutable
class UiPageHomeCatalogTabHomeTOC extends HookConsumerWidget {
  const UiPageHomeCatalogTabHomeTOC({
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
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 60.h,
              color: const Color(0xFFf6d1bf),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    _tocProvider.majorSummary,
                    style: TextStyle(color: Colors.black, fontSize: 20.sp),
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
                        if (minor.minorKey.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "minorKeyが空です",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else {
                          context.router.pushNamed(
                            '/tabHomeMinor/${minor.minorKey}/false',
                          );
                        }
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
