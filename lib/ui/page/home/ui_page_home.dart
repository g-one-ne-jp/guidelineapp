// Flutter imports:
// Project imports:
import 'package:JCSGuidelines/debug/debug_print.dart';
import 'package:JCSGuidelines/module/firebase/model_firebase_pdf_config.dart';
import 'package:JCSGuidelines/module/firebase/model_firebase_user.dart';
import 'package:JCSGuidelines/providers/toc_provider.dart';
import 'package:JCSGuidelines/providers/user_provider.dart';
import 'package:JCSGuidelines/util/util_googlesingin.dart';
// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
// ignore: must_be_immutable
class UiPageHome extends HookConsumerWidget {
  const UiPageHome({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _user = useState(ModelFirebaseUser());

    final _userProvider = ref.watch(userProvider);
    final _userNotifer = ref.watch(userProvider.notifier);

    final _tocProvider = ref.watch(tocProvider);
    final _tocNotifer = ref.watch(tocProvider.notifier);

    final _tos = useState(ModelFirebasePdfConfig());

    useEffect(() {
      Future<void>(() async {
        try {
          //ユーザーデータを読み込み
          _user.value = await _userNotifer.readUser<ModelFirebaseUser>(
              fromJson: ModelFirebaseUser.fromJson);
          _tos.value = await _userNotifer.readTocsJson(context: context);
          await Future.delayed(const Duration(seconds: 1));
          var value = _tos.value.categories.values.toList()[0];
          //選択した目次のIDを保持
          _tocNotifer.writeToc(data: value);
          // ignore: use_build_context_synchronously
          context.router.pushNamed(
            '/catalog',
          );
        } catch (e) {
          customDebugPrint('error: $e');
          try {
            if (await utilAuthLogout()) {
              context.router.popUntilRoot();
              context.router.replaceNamed('/login');
            }
          } catch (e) {
            customDebugPrint('ユーザーが認証されていません: $e');
          }
        }
      });
      return null;
//      return () => customDebugPrint('dispose!');
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
