import 'package:flutter/material.dart';
import 'package:flutter_template/providers/moduiles/template_data.dart';
import 'package:flutter_template/providers/template_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_template/main.dart';

/// TemplateProviderクラスのsaveメソッドのテストケースです。
/// saveメソッドが状態を更新し、設定を保存し、loadメソッドを呼び出すことを検証します。
void main() {
  // テストのバインディングを初期化
  TestWidgetsFlutterBinding.ensureInitialized();
  test('save method test', () async {
    final provider = ProviderTamplate();

    // モックのTemplateDataオブジェクトを作成します
    final templateData = TemplateData(/* 好きな値で初期化 */);

    // saveメソッドを呼び出します
    await provider.save(app: templateData);

    // 状態が更新されたことを検証します
    expect(provider.state, templateData);

    // loadメソッドが呼び出されたことを検証します
    expect(await provider.load(), templateData.toString());
  });
}
