// Flutter imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

// Project imports:
import 'package:flutter_template/debug/debug_print.dart';
import 'package:flutter_template/module/firebase/model_firebase_pdf_config.dart';
import 'package:flutter_template/module/firebase/model_firebase_user.dart';
import 'package:flutter_template/providers/user_provider.dart';
import 'package:flutter_template/repotitory/mixin_repository_firestore.dart';
import 'package:flutter_template/ui/util/uiUtilWidget.dart';
import 'package:flutter_template/util/util_googlesingin.dart';

@RoutePage()
class UiPageHomeCatalogTabMypage extends HookConsumerWidget {
  UiPageHomeCatalogTabMypage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _userProvider = ref.watch(userProvider);
    final _userNotifer = ref.watch(userProvider.notifier);

    final _user = useState(ModelFirebaseUser());
    final _gender = useState('性別');
    final _age = useState('年代');
    final _occupation = useState('職種');
    final _specialty = useState('専門科(医師の場合)');
    final _number = useState('');
    final _isMailMagazine = useState(false);

    final _isChecked = useState(false);
    final _isEdited = useState(false);

    useEffect(() {
      Future<void>(() async {
        //ユーザーデータを読み込み
        _user.value = await _userNotifer.readUser<ModelFirebaseUser>(
            fromJson: ModelFirebaseUser.fromJson);
        _gender.value = _user.value.gender;
        _age.value = _user.value.age;
        _occupation.value = _user.value.occupation;
        _specialty.value = _user.value.specialty;
        _number.value = _user.value.number;
        _isMailMagazine.value = _user.value.ismailmagazine;
      });
      return () => customDebugPrint('dispose!');
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('マイページ'),
        automaticallyImplyLeading: false, // 戻るボタンを表示しない
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'プロフィール',
                    style: TextStyle(fontSize: 20.sp),
                  ),
                ),
                SizedBox(
                  height: 8.0.h,
                ),
                //Emailの表示
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'E-MAIL  ${FirebaseAuth.instance.currentUser?.email}',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ),
                SizedBox(
                  height: 16.0.h,
                ),
                uiUtilTitleDropdown(
                  title: '性別',
                  hintText: '選択してください',
                  value: _gender.value,
                  items: Gender.values.map((e) => e.label).toList(),
                  isEditable: _isEdited.value,
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
                  isEditable: _isEdited.value,
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
                  isEditable: _isEdited.value,
                  onChanged: (String value) {
                    _occupation.value = value;
                    _isChecked.value = true;
                  },
                ),
                uiUtilTitleDropdown(
                  title: '専門家(医師の場合)',
                  hintText: '選択してください',
                  value: _specialty.value,
                  items: Specialty.values.map((e) => e.label).toList(),
                  isEditable: _isEdited.value,
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
                    isEditable: _isEdited.value,
                    onChanged: (String value) {
                      _number.value = value;
                      _isChecked.value = true;
                    }),

                uiUtilCheckBox(
                    text: 'メルマガなどの配信',
                    isEditable: _isEdited.value,
                    onChanged: (value) {
                      _isMailMagazine.value = value!;
                      _isChecked.value = true;
                    },
                    isChecked: _isMailMagazine.value),
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
                    onPressed: () async {
                      if (!_isEdited.value) {
                        _isEdited.value = true;
                      } else {
                        if (await _userNotifer.updateUserProfile(
                          gender: _gender.value,
                          age: _age.value,
                          occupation: _occupation.value,
                          specialty: _specialty.value,
                          number: _number.value,
                          ismailmagazine: _isMailMagazine.value,
                        )) {
                          Fluttertoast.showToast(
                            msg: 'プロフィールを更新しました。',
                          );
                          _isEdited.value = false;
                          _isChecked.value = false;
                        }
                      }
                    },
                    child: Text(_isEdited.value ? '更新' : 'プロフィールを変更'),
                  ),
                ),
                SizedBox(
                  height: 16.0.h,
                ),
                //パスワードリセット
                utilAuthIsLoginTypePassWord()
                    ? TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.blue,
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: () async {
                          uitlAuthLoggedInPasswordReset(
                            context: context,
                          ).then((onValue) async {
                            if (onValue.isNotEmpty) {
                              await Fluttertoast.showToast(
                                msg: onValue,
                              );
                            }
                          });
                        },
                        child: const Text('パスワードリセット'),
                      )
                    : Container(),
                SizedBox(
                  height: 32.0.h,
                ),
                //ログアウト
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () async {
                    await showDialog<bool>(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: const Text('確認'),
                          content: const Text('本当にログアウトしますか？'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: const Text('キャンセル'),
                            ),
                            TextButton(
                              onPressed: () async {
                                Navigator.of(context).pop(true);
                                if (await utilAuthLogout()) {
                                  context.router.popUntilRoot();
                                  context.router.replaceNamed('/login');
                                  await Fluttertoast.showToast(
                                    msg: 'ログアウトしました。',
                                  );
                                }
                              },
                              child: const Text('ログアウト'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text('ログアウト'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
