// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_template/debug/debug_print.dart';
import 'package:flutter_template/module/firebase/model_firebase_pdf_config.dart';
import 'package:flutter_template/providers/toc_provider.dart';
import 'package:flutter_template/providers/user_provider.dart';
import 'package:flutter_template/repotitory/mixin_repository_firestore.dart';

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
        _tos.value = await _userNotifer.readTocsJson();
        await Future.delayed(const Duration(seconds: 1));
        var value = _tos.value.categories.values.toList()[0];
        //選択した目次のIDを保持
        _tocNotifer.writeToc(data: value);
        // ignore: use_build_context_synchronously
        context.router.pushNamed(
          '/catalog',
        );
      });
      return () => customDebugPrint('dispose!');
    }, []);

    return Scaffold(
      body: SafeArea(
          child: Column(
        //真ん中揃え
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //
          const Text('ロード中'),
          SizedBox(
            height: 16.h,
          ),
          const Center(
            child: CircularProgressIndicator(),
          )
        ],
      )),
    );
  }
}
