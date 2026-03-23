import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_pdf_annotations/flutter_pdf_annotations.dart';
import 'package:path_provider/path_provider.dart';

@RoutePage()
class PdfEditScreen extends HookWidget {
  const PdfEditScreen({
    super.key,
    required this.pdfPath,
  });

  final String pdfPath;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      // 画面が開かれたらすぐに編集画面を起動
      Future.microtask(() async {
        try {
          await FlutterPdfAnnotations.openPDF(
            filePath: pdfPath,
            savePath: pdfPath, // 元のファイルパスに上書き保存
            onFileSaved: (savedPath) {
              if (savedPath != null) {
                // 保存されたパス（元のパスと同じ）を返して元の画面に戻る
                context.router.maybePop(savedPath);
              } else {
                // キャンセルまたは失敗時はそのまま戻る
                context.router.maybePop();
              }
            },
          );
        } catch (e) {
          debugPrint('PDF編集エラー: $e');
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('PDFの編集に失敗しました')),
            );
            context.router.maybePop();
          }
        }
      });
      return null;
    }, []);

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
