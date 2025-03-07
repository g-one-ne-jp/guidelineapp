// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum Gender {
  male('男'),
  female('女'),
  other('その他');

  final String label;
  const Gender(this.label);
}

enum AgeGroup {
  twenties('20代'),
  thirties('30代'),
  forties('40代'),
  fifties('50代'),
  sixties('60代'),
  seventiesAndAbove('70代以上');

  final String label;
  const AgeGroup(this.label);
}

enum Occupation {
  doctor('医師'),
  trainee('研修医'),
  nurse('看護師'),
  clinicalEngineer('臨床工学技士'),
  pharmacist('薬剤師'),
  otherMedicalStaff('その他医療従事者'),
  medicalCompanyEmployee('医療関連会社勤務'),
  other('その他');

  final String label;
  const Occupation(this.label);
}

enum Specialty {
  internalMedicineCardiology('内科（循環器専門）'),
  internalMedicineNonCardiology('内科（循環器非専門）'),
  surgeryCardiology('外科（循環器専門）'),
  surgeryNonCardiology('外科（循環器非専門）'),
  pediatricsCardiology('小児科（循環器専門）'),
  pediatricsNonCardiology('小児科（循環器非専門）'),
  other('その他');

  final String label;
  const Specialty(this.label);
}

Widget uiUtilTitleTextField({
  required String title,
  required String hintText,
  required Function(String) onChanged,
  String value = '',
  TextInputType keyboardType = TextInputType.text,
  bool isEditable = true,
  bool isValidateInput = false,
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
          errorText: isValidateInput
              ? _validateInput(value)
                  ? null
                  : '英数のみ入力可能です'
              : null,
        ),
        keyboardType: keyboardType,
        onSubmitted: (text) {
          if (_validateInput(text)) {
            onChanged(text);
          }
        },
        enabled: isEditable, // 編集可否を設定
      ),
      SizedBox(height: 16.h), // 入力欄と次の題名の間に少しスペースを入れる
    ],
  );
}

bool _validateInput(String input) {
  final regex = RegExp(r'^[a-zA-Z0-9]+$');
  return regex.hasMatch(input);
}

Widget uiUtilTitleScrollableText({
  required String title,
  required String content,
  bool isEditable = true,
  Function(String)? onChanged,
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
        child: isEditable
            ? TextField(
                controller: TextEditingController(text: content),
                maxLines: null,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8.0),
                ),
                onChanged: onChanged,
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(content),
                ),
              ),
      ),
    ],
  );
}

Widget uiUtilHtml({
  required String title,
  bool isEditable = true,
  Function(String)? onChanged,
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
        height: 300.h,
        decoration: BoxDecoration(
          // 枠線を追加
          border: Border.all(color: Colors.grey), // 枠線の色と太さを指定
          borderRadius: BorderRadius.circular(8.0), // 角丸を追加する場合
        ),
        child: FutureBuilder<String>(
          future: rootBundle.loadString('assets/txt/GONE.html'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('エラー: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final controller = WebViewController()
                ..setBackgroundColor(Colors.transparent) // 背景色を白に設定
                ..loadRequest(
                  Uri.dataFromString(
                    snapshot.data!,
                    mimeType: 'text/html',
                    encoding: Encoding.getByName('utf-8'),
                  ),
                );
              return ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) => ListTile(
                  title: Container(
                    height: 3000.h,
                    child: WebViewWidget(controller: controller),
                  ),
                ),
              );
            } else {
              return const Center(child: Text('データがありません'));
            }
          },
        ),
      ),
    ],
  );
}

Widget uiUtilCheckBox({
  required String text,
  required Function(bool?) onChanged,
  required bool isChecked,
  bool isEditable = true,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center, // 中央寄せに設定
    children: [
      Checkbox(
        value: isChecked,
        onChanged: isEditable ? onChanged : null, // 編集可否を設定
      ),
      GestureDetector(
        onTap: isEditable ? () => onChanged(!isChecked) : null, // 編集可否を設定
        child: Text(text),
      ),
    ],
  );
}

Widget uiUtilTitleDropdown({
  required String title,
  required String hintText,
  required List<String> items,
  required Function(String) onChanged,
  String? value,
  bool isEditable = true,
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
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey), // 枠線の色と太さを指定
          borderRadius: BorderRadius.circular(8.0), // 角丸を追加する場合
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12.0), // 内側の余白を追加
        child: DropdownButton<String>(
          value: items.contains(value) ? value : items.first, // 初期値を追加
          hint: Text(hintText),
          isExpanded: true,
          underline: const SizedBox(), // デフォルトの下線を削除
          items: items.map<DropdownMenuItem<String>>((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: isEditable
              ? (String? newValue) {
                  if (newValue != null) {
                    onChanged(newValue);
                  }
                }
              : null,
          disabledHint: Text(value ?? hintText), // 編集不可の場合の表示
        ),
      ),
      SizedBox(height: 16.h), // 入力欄と次の題名の間に少しスペースを入れる
    ],
  );
}
