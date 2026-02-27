import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class HtmlViewerScreen extends StatelessWidget {
  final String htmlPath;
  final String title;

  const HtmlViewerScreen({
    super.key,
    required this.htmlPath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    // ファイルから内容を読み込むか、Uri.fileで直接開く
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onNavigationRequest: (NavigationRequest request) {
            // http または https で始まる外部URLの場合は外部ブラウザで開く
            if (request.url.startsWith('http://') ||
                request.url.startsWith('https://')) {
              debugPrint('Opening external URL: ${request.url}');
              launchUrl(
                Uri.parse(request.url),
                mode: LaunchMode.externalApplication,
              );
              // WebView内での遷移を阻止
              return NavigationDecision.prevent;
            }
            // ローカルファイルなどはそのままWebView内で開く
            return NavigationDecision.navigate;
          },
        ),
      );

    // ローカルファイルを読み込む
    final file = File(htmlPath);
    if (file.existsSync()) {
      final htmlString = file.readAsStringSync();
      controller.loadRequest(
        Uri.dataFromString(
          htmlString,
          mimeType: 'text/html',
          encoding: Encoding.getByName('utf-8'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
