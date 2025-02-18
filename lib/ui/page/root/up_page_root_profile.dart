// ignore_for_file: no_leading_underscores_for_local_identifiers

// Dart imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:JCSGuidelines/providers/user_provider.dart';
import 'package:JCSGuidelines/ui/util/uiUtilWidget.dart';

@RoutePage()
class UiPageProfileCreate extends HookConsumerWidget {
  const UiPageProfileCreate({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _userProvider = ref.watch(userProvider);
    final _userNotifer = ref.watch(userProvider.notifier);

    final _isChecked = useState(true);

    final _gender = useState('性別');
    final _age = useState('年代');
    final _occupation = useState('職種');
    final _specialty = useState('専門科(医師の場合)');
    final _number = useState('');
    final _isMailMagazine = useState(false);

    useEffect(() {
      return null;
    }, []);

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
                  uiUtilTitleDropdown(
                    title: '性別',
                    hintText: '選択してください',
                    value: _gender.value,
                    items: Gender.values.map((e) => e.label).toList(),
                    onChanged: (String value) {
                      _gender.value = value;
                      _isChecked.value = true;
                    },
                  ),
                  uiUtilTitleDropdown(
                    title: '年代',
                    hintText: '選択してください',
                    value: _age.value,
                    items: AgeGroup.values.map((e) => e.label).toList(),
                    onChanged: (String value) {
                      _age.value = value;
                      _isChecked.value = true;
                    },
                  ),
                  uiUtilTitleDropdown(
                    title: '職種',
                    hintText: '選択してください',
                    value: _occupation.value,
                    items: Occupation.values.map((e) => e.label).toList(),
                    onChanged: (String value) {
                      _occupation.value = value;
                    },
                  ),
                  uiUtilTitleDropdown(
                    title: '専門家(医師の場合)',
                    hintText: '選択してください',
                    value: _specialty.value,
                    items: Specialty.values.map((e) => e.label).toList(),
                    onChanged: (String value) {
                      _specialty.value = value;
                      _isChecked.value = true;
                    },
                  ),
                  uiUtilTitleTextField(
                      title: '日循会員番号（会員の場合のみ）',
                      hintText: 'xxxxxxx',
                      value: _number.value,
                      keyboardType: TextInputType.emailAddress,
                      isValidateInput: true,
                      onChanged: (String value) {
                        _number.value = value;
                        _isChecked.value = true;
                      }),
                  uiUtilTitleScrollableText(title: '利用規約', content: 'aaaaas'),
                  uiUtilCheckBox(
                    text: '利用規約に同意する',
                    onChanged: (bool? value) {
                      _isChecked.value = value!;
                    },
                    isChecked: _isChecked.value,
                  ),
                  uiUtilCheckBox(
                      text: 'メルマガなどの配信',
                      onChanged: (value) {
                        _isMailMagazine.value = value!;
                      },
                      isChecked: _isMailMagazine.value),

                  //

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
                                gender: _gender.value,
                                age: _age.value,
                                occupation: _occupation.value,
                                specialty: _specialty.value,
                                number: _number.value,
                                ismailmagazine: _isMailMagazine.value,
                              )) {
                                context.router.popUntilRoot();
                                context.router.replaceNamed('/home');
                              }
                            }
                          : null,
                      child: const Text('登録'),
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
