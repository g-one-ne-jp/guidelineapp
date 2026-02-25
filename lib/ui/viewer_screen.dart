import 'dart:io';
import 'dart:ui' as ui;

import 'package:auto_route/auto_route.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/viewer_provider.dart';

// 型安全のためのデータモデル
class PDFPageData {
  final PDFPage page;
  final double width;
  final double height;

  PDFPageData({required this.page, required this.width, required this.height});
}

@RoutePage()
class ViewerScreen extends HookConsumerWidget {
  const ViewerScreen({
    super.key,
    required this.pdfPath,
    required this.pdfFile,
  });

  final String pdfPath;
  final File pdfFile;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("ViewerScreen opened with path: $pdfPath");
    final viewerState = ref.watch(viewerProvider);
    final transformationController =
        useMemoized(() => TransformationController());

    // 1. PDFドキュメント自体の読み込み（ローカルファイルから）
    final pdfFuture = useMemoized(
      () {
        // タイプセーフなルーティングに切り替えたため、パスをそのまま使用可能
//        print("Loading PDF from path: $pdfPath");
        var file = File(pdfPath);
        // if (file.existsSync()) {
        //   print(
        //       "PDF file exists at path: $pdfPath, size: ${file.lengthSync()} bytes");
        // } else {
        //   print("PDF file does NOT exist at path: $pdfPath");
        // }
        return PDFDocument.fromFile(file);
      },
      [pdfPath],
    );
    final pdfSnapshot = useFuture(pdfFuture);

    // 2. 1ページ目の読み込みと寸法の取得
    final pageDataFuture = useMemoized<Future<PDFPageData?>>(() async {
      final document = pdfSnapshot.data;
      if (document == null) return null;

      // ページオブジェクトを取得
      final page = await document.get(page: 1);

      // 生成された画像ファイルから実際の寸法を取得
      final bytes = await File(page.imgPath!).readAsBytes();
      final codec = await ui.instantiateImageCodec(bytes);
      final frame = await codec.getNextFrame();

      return PDFPageData(
        page: page,
        width: frame.image.width.toDouble() / 2,
        height: frame.image.height.toDouble() / 2,
      );
    }, [pdfSnapshot.data]);
    final pageDataSnapshot = useFuture(pageDataFuture);

    // PDFの寸法が確定したらプロバイダーに通知
    useEffect(() {
      final data = pageDataSnapshot.data;
      if (data != null) {
        Future.microtask(() {
          ref.read(viewerProvider.notifier).updateContentSize(
                Size(data.width, data.height),
              );
        });
      }
      return null;
    }, [pageDataSnapshot.data]);

    useEffect(() {
      void onTransformationChanged() {
        ref
            .read(viewerProvider.notifier)
            .updateFromMatrix(transformationController.value);
      }

      transformationController.addListener(onTransformationChanged);
      return () =>
          transformationController.removeListener(onTransformationChanged);
    }, [transformationController]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('PDFビューワー'),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: LayoutBuilder(builder: (context, constraints) {
                      // 画面サイズ（ビューポート）をプロバイダーに通知
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ref
                            .read(viewerProvider.notifier)
                            .updateViewportSize(constraints.biggest);
                      });

                      if (pdfSnapshot.hasError || pageDataSnapshot.hasError) {
                        return const Center(child: Text('PDFの読み込みに失敗しました'));
                      }

                      final pageData = pageDataSnapshot.data;
                      if (pageData == null) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red, width: 1),
                        ),
                        child: InteractiveViewer(
                          transformationController: transformationController,
                          boundaryMargin: const EdgeInsets.all(
                              double.infinity), // 画面外までの移動・縮小を許可
                          constrained: false,
                          minScale: 0.01, // さらに小さく縮小できるように変更
                          maxScale: 5.0,
                          child: SizedBox(
                            width: viewerState.contentSize.width,
                            height: viewerState.contentSize.height,
                            // PDFのページを画像として表示
                            child: Image.file(
                              File(pageData.page.imgPath!),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: _ViewerStatusPanel(viewerState: viewerState),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: _ThumbnailNavigator(
              viewerState: viewerState,
              transformationController: transformationController,
              pdfPage: pageDataSnapshot.data?.page,
            ),
          ),
        ],
      ),
    );
  }
}

class _ViewerStatusPanel extends StatelessWidget {
  const _ViewerStatusPanel({required this.viewerState});
  final ViewerState viewerState;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '拡大率: ${viewerState.scale.toStringAsFixed(2)}x',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            '位置: X:${viewerState.xOffset.toStringAsFixed(1)}, Y:${viewerState.yOffset.toStringAsFixed(1)}',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            'VPortサイズ: ${viewerState.viewportSize.width.toInt()} x ${viewerState.viewportSize.height.toInt()}',
            style: const TextStyle(color: Colors.white70, fontSize: 10),
          ),
          Text(
            'Contentサイズ: ${viewerState.contentSize.width.toInt()} x ${viewerState.contentSize.height.toInt()}',
            style: const TextStyle(color: Colors.white70, fontSize: 10),
          ),
        ],
      ),
    );
  }
}

class _ThumbnailNavigator extends StatelessWidget {
  const _ThumbnailNavigator({
    required this.viewerState,
    required this.transformationController,
    this.pdfPage,
  });

  final ViewerState viewerState;
  final TransformationController transformationController;
  final PDFPage? pdfPage;

  void _handleDrag(Offset localPosition, double thumbW, double thumbH) {
    final double scale = viewerState.scale;

    // ビューポートのサイズ（画像座標系での大きさ）
    final double viewportWInContent = viewerState.viewportSize.width / scale;
    final double viewportHInContent = viewerState.viewportSize.height / scale;

    // サムネイル上のタッチ位置を 0.0 ~ 1.0 の比率に変換（境界でクランプ）
    final double normalizedX = (localPosition.dx / thumbW).clamp(0.0, 1.0);
    final double normalizedY = (localPosition.dy / thumbH).clamp(0.0, 1.0);

    // 画像上の「中心に来てほしい」座標を計算
    final double targetContentCenterX =
        normalizedX * viewerState.contentSize.width;
    final double targetContentCenterY =
        normalizedY * viewerState.contentSize.height;

    // 左上のオフセットを算出
    double leftInContent = targetContentCenterX - (viewportWInContent / 2);
    double topInContent = targetContentCenterY - (viewportHInContent / 2);

    // 画像の範囲外に出ないようにクランプ
    leftInContent = leftInContent.clamp(
      0.0,
      (viewerState.contentSize.width - viewportWInContent)
          .clamp(0.0, double.infinity),
    );
    topInContent = topInContent.clamp(
      0.0,
      (viewerState.contentSize.height - viewportHInContent)
          .clamp(0.0, double.infinity),
    );

    final double newX = -leftInContent * scale;
    final double newY = -topInContent * scale;

    // 行列を更新（スケールは維持）
    transformationController.value = Matrix4.identity()
      ..translate(newX, newY)
      ..scale(scale);
  }

  @override
  Widget build(BuildContext context) {
    if (viewerState.viewportSize == Size.zero || pdfPage == null) {
      return const SizedBox.shrink();
    }

    const double thumbMaxSide = 150.0;
    final double aspectRatio =
        viewerState.contentSize.width / viewerState.contentSize.height;

    double thumbW, thumbH;
    if (aspectRatio > 1) {
      thumbW = thumbMaxSide;
      thumbH = thumbMaxSide / aspectRatio;
    } else {
      thumbH = thumbMaxSide;
      thumbW = thumbMaxSide * aspectRatio;
    }

    // --- 簡略化した計算ロジック ---

    // 画像全体の拡大後のサイズ
    final double contentScaledW =
        viewerState.contentSize.width * viewerState.scale;
    final double contentScaledH =
        viewerState.contentSize.height * viewerState.scale;

    // 比率の算出
    final double viewW =
        (viewerState.viewportSize.width / contentScaledW) * thumbW;
    final double viewH =
        (viewerState.viewportSize.height / contentScaledH) * thumbH;

    // オフセット（マイナスを反転させて、拡大後の画像内での位置を算出）
    final double viewX = (-viewerState.xOffset / contentScaledW) * thumbW;
    final double viewY = (-viewerState.yOffset / contentScaledH) * thumbH;

    // サムネイルの枠内に収まるように制限
    final double rectX = viewX.clamp(0.0, thumbW);
    final double rectY = viewY.clamp(0.0, thumbH);
    final double rectW = viewW.clamp(0.0, thumbW - rectX);
    final double rectH = viewH.clamp(0.0, thumbH - rectY);

    return GestureDetector(
      onPanUpdate: (details) =>
          _handleDrag(details.localPosition, thumbW, thumbH),
      onTapDown: (details) =>
          _handleDrag(details.localPosition, thumbW, thumbH),
      child: Container(
        width: thumbW,
        height: thumbH,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 4)
          ],
        ),
        child: Stack(
          children: [
            Image.file(
              File(pdfPage!.imgPath!),
              width: thumbW,
              height: thumbH,
              fit: BoxFit.cover,
            ),
            Positioned(
              left: rectX,
              top: rectY,
              child: Container(
                width: rectW,
                height: rectH,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 2),
                  color: Colors.red.withOpacity(0.2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
