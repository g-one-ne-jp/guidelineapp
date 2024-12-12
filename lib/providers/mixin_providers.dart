// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:JCSGuidelines/providers/moduiles/template_data.dart';
import 'package:JCSGuidelines/providers/template_provider.dart';

/// ミックスインプロバイダーテンプレート
mixin MixinProviderTemplate {
  /// プロバイダーテンプレートを取得します。
  TemplateData get providerTemplate => _providerTemplate;
  TemplateData _providerTemplate = TemplateData();

  /// ノーティファイヤーテンプレートを取得します。
  ProviderTamplate get notifierTemplate => _notifierTemplate;
  ProviderTamplate _notifierTemplate = ProviderTamplate();

  /// RiverpodのStateNotifierProviderを定義します。
  final riverpod = StateNotifierProvider<ProviderTamplate, TemplateData>(
    (ref) => ProviderTamplate(),
  );

  /// プロバイダーログインを設定します。
  ///
  /// [ref] - WidgetRefオブジェクト
  void setProviderLogin({required WidgetRef ref}) {
    // getterを利用して値を取得する
    _providerTemplate = ref.watch(riverpod);
    _notifierTemplate = ref.watch(riverpod.notifier);
  }
}
