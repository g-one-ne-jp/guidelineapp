// Flutter imports:
// Project imports:
import 'package:JCSGuidelines/debug/debug_print.dart';
import 'package:JCSGuidelines/module/firebase/model_firebase_pdf_config.dart';
import 'package:JCSGuidelines/module/firebase/model_firebase_user.dart';
import 'package:JCSGuidelines/providers/toc_provider.dart';
import 'package:JCSGuidelines/providers/user_provider.dart';
import 'package:JCSGuidelines/ui/page/root/up_page_root_select_guideline.dart';
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
      final name = GuidelineFile.instance.getFullName();

      Future<void>(() async {
        try {
          //ユーザーデータを読み込み
          _user.value = await _userNotifer.readUser<ModelFirebaseUser>(
              fromJson: ModelFirebaseUser.fromJson);
          _tos.value =
              await _userNotifer.readTocsJson(name, context: context);
          await Future.delayed(const Duration(seconds: 1));

          // このwriteTocは、どこかに書き込むのではなく、_tocNotiferのstateに値を入れるだけのもの。
          // 設計として様子がおかしいが、こうすることで、/catalogに遷移したときに
          // tocProviderをwatchしたときに、すでに値が入っている状態にしたいのではないかと考えられる。
          var value = _tos.value.categories.values.toList()[0];
          //選択した目次のIDを保持
          _tocNotifer.writeToc(data: value);
          // ignore: use_build_context_synchronously
          context.router.pushNamed(
            '/catalog',
          );
          customDebugPrint('ホームで問題ない');
        } catch (e) {
          customDebugPrint('ホームでエラーになったのでログアウトします: $e');
          // try {
          //   if (await utilAuthLogout()) {
          //     context.router.popUntilRoot();
          //     context.router.replaceNamed('/login');
          //   }
          // } catch (e) {
          //   customDebugPrint('ユーザーが認証されていません: $e');
          // }
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
