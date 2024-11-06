// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/providers/user_provider.dart';
import 'package:flutter_template/repotitory/mixin_repository_firestore.dart';
import 'package:flutter_template/ui/util/uiUtilWidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class UiPageProfileCreate extends HookConsumerWidget {
  UiPageProfileCreate({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _userProvider = ref.watch(userProvider);
    final _userNotifer = ref.watch(userProvider.notifier);

    final _isChecked = useState(false);

    final _name = useState('名前');
    final _affiliation = useState('所属');
    final _specialty = useState('専門');
    final _address = useState('住所');

    useEffect(() {}, []);

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('アカウント登録'),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  uiUtilTitleTextFeild(
                      title: '姓名',
                      hintText: '山田太郎',
                      onChenged: (String value) {
                        _name.value = value;
                      }),
                  uiUtilTitleTextFeild(
                      title: '所属',
                      hintText: '〇〇病院',
                      onChenged: (String value) {
                        _affiliation.value = value;
                      }),
                  uiUtilTitleTextFeild(
                      title: '専門',
                      hintText: '〇〇科',
                      onChenged: (String value) {
                        _specialty.value = value;
                      }),
                  uiUtilTitleTextFeild(
                      title: '住所',
                      hintText: '東京都',
                      onChenged: (String value) {
                        _address.value = value;
                      }),
                  //利用規約
                  uiUtilTitleScrollableText(title: '利用規約', content: 'aaaaas'),

                  //
                  uiUtilCheckBox(
                    text: '同意する',
                    onChanged: (bool? value) {
                      _isChecked.value = value!;
                    },
                    isChecked: _isChecked.value,
                  ),

                  //
                  SizedBox(
                    height: 16.0.h,
                  ),
                  //登録ボタン
                  Container(
                    padding: EdgeInsets.all(10.0.w),
                    // 横幅いっぱいにする
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isChecked.value
                          ? () async {
                              if (await _userNotifer.updateUserProfile(
                                name: _name.value,
                                affiliation: _affiliation.value,
                                specialty: _specialty.value,
                                address: _address.value,
                              )) {
                                context.router.popUntilRoot();
                                context.router.replaceNamed('/home');
                              }
                            }
                          : null,
                      child: Text('登録'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
