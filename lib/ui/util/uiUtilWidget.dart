import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget uiUtilTitleTextFeild({
  required String title,
  required String hintText,
  required Function onChenged,
  String value = '',
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start, // 題名を左寄せ
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 8.h), // 題名と入力欄の間に少しスペースを入れる
      TextField(
        controller: TextEditingController(text: value),
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(),
        ),
        onSubmitted: (text) {
          onChenged(text);
        },
      ),
      SizedBox(height: 16.h), // 入力欄と次の題名の間に少しスペースを入れる
    ],
  );
}

Widget uiUtilTitleScrollableText({
  required String title,
  required String content,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 8),
      Container(
        width: double.infinity,
        height: 200.h,
        decoration: BoxDecoration(
          // 枠線を追加
          border: Border.all(color: Colors.grey), // 枠線の色と太さを指定
          borderRadius: BorderRadius.circular(8.0), // 角丸を追加する場合
        ),
        child: SingleChildScrollView(
          child: Text(
            content,
          ),
        ),
      ),
    ],
  );
}

Widget uiUtilCheckBox({
  required String text,
  required Function(bool?) onChanged,
  required bool isChecked,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center, // 中央寄せに設定
    children: [
      Checkbox(
        value: isChecked,
        onChanged: onChanged,
      ),
      GestureDetector(
        onTap: () => onChanged(!isChecked),
        child: Text(text),
      ),
    ],
  );
}
