// ignore_for_file: no_leading_underscores_for_local_identifiers

// Dart imports:

// Package imports:
import 'package:auto_route/auto_route.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final String BASE_FILE_NAME = "gidline.json";
final String EXTEND_FILE_NAME = "gidline_2026.json";

// class Sample {
//   // コンストラクタ（private）
//   Sample._internal();
//   // インスタンスはただ１つだけ
//   static final Sample instance = Sample._internal();
//   // キャッシュしたインスタンスを返す
//   factory Sample() => instance;
// }

class GuidelineFile {
  late String name;
  late String suffix;

  static final GuidelineFile instance = GuidelineFile._internal();

  factory GuidelineFile() {
    return instance;
  }

  GuidelineFile._internal() {
    name = "";
    suffix = "";
  }

  void setGuideline(String name, String suffix) {
    this.name = name;
    this.suffix = suffix;
  }

  void setFullname(String name) {
    this.name = name;
  }

  String getFullName() {
    return name; //"${name}_$suffix";
  }

  @override
  String toString() => "GuidelineFile $name with suffix $suffix";
}

@RoutePage()
class UiPageSelectGuideline extends HookConsumerWidget {
  const UiPageSelectGuideline({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final _emailController = useState(useTextEditingController());
    // final _passwordController = useState(useTextEditingController());
    // final _isPasswordVisible = useState(false);

    useEffect(() {
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(title: const Text('JCSガイドライン選択')),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // //
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     '当アプリについて',
                //     style: TextStyle(fontSize: 20.0.sp),
                //   ),
                // ),
                // SizedBox(
                //   height: 8.0.h,
                // ),
                // SizedBox(
                //   height: 150.0.h, // Set a fixed height for the container
                //   child: SingleChildScrollView(
                //     child: Text(
                //       'このアプリは、JCSガイドラインに基づいて、心血管疾患の予防、診断、治療に関する情報を提供します。'
                //       '最新の研究成果や臨床ガイドラインを反映し、医療従事者や患者さんに役立つ情報を提供します。',
                //       style: TextStyle(fontSize: 15.0.sp),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 16.0.h,
                ),
                //
                // const Align(
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     'ご利用にはアカウント登録が必要です',
                //   ),
                // ),
                // //
                // SizedBox(
                //   height: 8.0.h,
                // ),
                // //Email入力欄
                // TextField(
                //   controller: _emailController.value,
                //   decoration: InputDecoration(
                //     hintText: 'Email',
                //     hintStyle:
                //         const TextStyle(color: Colors.grey), // hintの文字色をグレーに設定
                //     border: OutlineInputBorder(
                //       borderSide: const BorderSide(color: Colors.grey),
                //       borderRadius: BorderRadius.circular(10.0.r), // 角丸の半径を指定
                //     ),
                //     filled: true,
                //     fillColor: Colors.grey[100], // 背景色を指定
                //   ),
                //   onSubmitted: (String value) {},
                // ),
                // //
                // SizedBox(
                //   height: 16.0.h,
                // ),

                // TextField(
                //   controller: _passwordController.value,
                //   decoration: InputDecoration(
                //     hintText: 'パスワード',
                //     hintStyle:
                //         const TextStyle(color: Colors.grey), // hintの文字色をグレーに設定
                //     border: OutlineInputBorder(
                //       borderSide: const BorderSide(color: Colors.grey),
                //       borderRadius: BorderRadius.circular(10.0.r), // 角丸の半径を指定
                //     ),
                //     filled: true,
                //     fillColor: Colors.grey[100], // 背景色を指定
                //     suffixIcon: IconButton(
                //       icon: Icon(
                //         _isPasswordVisible.value
                //             ? Icons.visibility
                //             : Icons.visibility_off,
                //       ),
                //       onPressed: () {
                //         _isPasswordVisible.value = !_isPasswordVisible.value;
                //       },
                //     ),
                //   ),
                //   obscureText: !_isPasswordVisible.value,
                //   onSubmitted: (String value) {},
                // ),
                // const Align(
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     '*パスワードは大文字小文字英字、数字、記号の組み合わせで8文字以上にしてください。',
                //     style: TextStyle(
                //       color: Colors.black54,
                //       fontSize: 10.0,
                //     ),
                //   ),
                // ),
                // //
                SizedBox(
                  height: 16.0.h,
                ),
                //アカウント作成
                Container(
                  padding: EdgeInsets.all(10.0.w),
                  // 横幅いっぱいにする
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      print('ガイドライン2025改訂版選択');
                      GuidelineFile.instance.setFullname(BASE_FILE_NAME);
//                      context.router.popUntilRoot();
                      context.router.pushNamed('/home');
                    },
                    child: const Text('ガイドライン2025改訂版'),
                  ),
                ),
                //
                SizedBox(
                  height: 16.0.h,
                ),
                //アカウントを持ってるボタン
                // Goolgwサインインボタン
                Container(
                  padding: EdgeInsets.all(10.0.w),
                  // 横幅いっぱいにする
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      print('別ガイドライン選択');
                      GuidelineFile.instance.setFullname(EXTEND_FILE_NAME);

//                      context.router.popUntilRoot();
                      context.router.pushNamed('/home');
                    },
                    child: const Text('別ガイドライン'),
                  ),
                ),
                //
                SizedBox(
                  height: 16.0.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
