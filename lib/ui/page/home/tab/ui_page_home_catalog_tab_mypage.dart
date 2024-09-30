import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/debug/debug_print.dart';
import 'package:flutter_template/module/firebase/model_firebase_pdf_config.dart';
import 'package:flutter_template/module/firebase/model_firebase_user.dart';
import 'package:flutter_template/repotitory/mixin_repository_firestore.dart';
import 'package:flutter_template/ui/util/uiUtilWidget.dart';
import 'package:flutter_template/util/util_googlesingin.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

@RoutePage()
class UiPageHomeCatalogTabMypage extends HookConsumerWidget
    with RepositoryFireStore {
  UiPageHomeCatalogTabMypage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _tos = useState(ModelFirebasePdfConfig());
    final _panelController = useState(PanelController());
    final _isOpen = useState(false);

    final _user = useState(ModelFirebaseUser());
    final _name = useState('名前');
    final _affiliation = useState('所属');
    final _specialty = useState('専門');
    final _address = useState('住所');
    final _isChecked = useState(false);

    useEffect(() {
      Future<void>(() async {
        //ユーザーデータを読み込み
        _user.value = await readUser<ModelFirebaseUser>(
            fromJson: ModelFirebaseUser.fromJson);
        _name.value = _user.value.name;
        _affiliation.value = _user.value.name;
        _affiliation.value = _user.value.affiliation;
        _address.value = _user.value.address;
        _specialty.value = _user.value.specialty;
      });
      return () => customDebugPrint('dispose!');
    }, []);

    return Scaffold(
      appBar: AppBar(title: const Text('マイページ')),
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
                    value: _name.value,
                    onChenged: (String value) {
                      _name.value = value;
                      _isChecked.value = true;
                    }),
                uiUtilTitleTextFeild(
                    title: '所属',
                    hintText: '〇〇病院',
                    value: _affiliation.value,
                    onChenged: (String value) {
                      _affiliation.value = value;
                      _isChecked.value = true;
                    }),
                uiUtilTitleTextFeild(
                    title: '専門',
                    hintText: '〇〇科',
                    value: _specialty.value,
                    onChenged: (String value) {
                      _specialty.value = value;
                      _isChecked.value = true;
                    }),
                uiUtilTitleTextFeild(
                    title: '住所',
                    hintText: '東京都',
                    value: _address.value,
                    onChenged: (String value) {
                      _address.value = value;
                      _isChecked.value = true;
                    }),

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
                            if (await updateUserProfile(
                              name: _name.value,
                              affiliation: _affiliation.value,
                              specialty: _specialty.value,
                              address: _address.value,
                            )) {
                              Fluttertoast.showToast(
                                msg: 'プロフィールを更新しました。',
                              );
                              _isChecked.value = false;
                            }
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0.r),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 15.h),
                    ),
                    child: const Text('更新'),
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
                          if (await uitlAuthLoggedInPasswordReset()) {
                            var a = 0;
                          }
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
            ),
          ),
        ),
      ),
    );
  }
}
