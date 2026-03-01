import 'dart:io';

import 'package:JCSGuidelines/app_router.dart';
import 'package:JCSGuidelines/providers/user_provider.dart';
import 'package:JCSGuidelines/ui/util/uiUtilDialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pdfrx/pdfrx.dart';
import 'package:pdftron_flutter/pdftron_flutter.dart';

import '../providers/viewer_provider.dart';
import '../repotitory/mixin_repository_firestorage.dart';

@RoutePage()
class ViewerScreen extends HookConsumerWidget with RepositoryFireStorage {
  const ViewerScreen({
    super.key,
    required this.pdfPath,
    required this.sessionKey,
  });

  final String pdfPath;
  final String sessionKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // print("ViewerScreen opened with InteractiveViewer + pdfrx, path: $pdfPath");
    // print("sessionKey: $sessionKey");

    print(
        "-------------------------------------------ViewerScreen-------------------------------------------");
    
    final viewerState = ref.watch(viewerProvider);
    // userProviderの状態を監視して、ブックマーク等の変更時に再描画を走らせる
    ref.watch(userProvider);

    final transformationController =
        useMemoized(() => TransformationController());

    // ウィジェットが生存しているかを確認するためのフック
    final isMounted = useIsMounted();
    // 再読み込みをトリガーするためのカウンター
    final reloadCounter = useState(0);

    // 1. PDFドキュメントの読み込み（pdfrxを使用）
    final pdfFuture = useMemoized(
      () {
        print("独自ビューワー reload: ${reloadCounter.value}");
        return PdfDocument.openFile(pdfPath);
      },
      [reloadCounter.value], // カウンターが変わると再読み込みを実行
    );
    final pdfSnapshot = useFuture(pdfFuture);

    // 2. 1ページ目のページ情報を取得 (pdfrx v2.x 以降は doc.pages[index] で取得)
    final page = useMemoized<PdfPage?>(() {
      final doc = pdfSnapshot.data;
      if (doc == null || doc.pages.isEmpty) return null;
      return doc.pages[0];
    }, [pdfSnapshot.data]);

    // PDFの寸法が確定したらプロバイダーに通知
    useEffect(() {
      if (page != null) {
        Future.microtask(() {
          ref.read(viewerProvider.notifier).updateContentSize(
                Size(page.width, page.height),
              );
        });
      }
      return null;
    }, [page]);

    // Matrix変更の監視
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

    // 編集画面（Pdftron）を開く処理
    void startEditing() async {
      if (FirebaseAuth.instance.currentUser == null) {
        showLoginDialog(context,
            content: '編集機能を利用するには会員登録/ログインが必要です。ログイン画面に移動しますか？');
        return;
      } 
      var config = Config();
      PdftronFlutter.openDocument(pdfPath, config: config);
      startLeadingNavButtonPressedListener(() async {
        var savedTempPath = await PdftronFlutter.saveDocument();
        if (savedTempPath != null) {
          // Firebase Storageへアップロード
          uploadData(path: savedTempPath, file: File(savedTempPath));

          if (isMounted()) {
            // 一旦画面を閉じて、新しいパス（編集結果）で自分自身を開き直す
            // これによりウィジェットの状態やキャッシュが完全にクリアされる
            Navigator.of(context).pop();
            context.router.push(ViewerRoute(
              pdfPath: savedTempPath,
              sessionKey: sessionKey,
            ));
          }
        }
      });
    }

    // 表示用のファイル名を抽出
    final fileName = pdfPath.split('/').last;

    final bool dbgView = false;
    final _userNotifer = ref.watch(userProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(fileName),
        actions: [
          IconButton(
            icon: Icon(!_userNotifer.getBookmarkState(key: sessionKey)
                ? Icons.bookmark_outline
                : Icons.bookmark),
            onPressed: () {
              if (FirebaseAuth.instance.currentUser == null) {
                showLoginDialog(context,
                    content: 'ブックマーク機能を利用するには会員登録/ログインが必要です。ログイン画面に移動しますか？');
              } else {
                _userNotifer.updateBookmark(
                    key: sessionKey,
                    isBookmark:
                        !_userNotifer.getBookmarkState(key: sessionKey));
              }
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: LayoutBuilder(builder: (context, constraints) {
              // 画面サイズ（ビューポート）をプロバイダーに通知
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ref
                    .read(viewerProvider.notifier)
                    .updateViewportSize(constraints.biggest);
              });

              if (pdfSnapshot.hasError) {
                return const Center(child: Text('PDFの読み込みに失敗しました'));
              }

              final doc = pdfSnapshot.data;
              if (doc == null || page == null) {
                return const Center(child: CircularProgressIndicator());
              }

              return Container(
                decoration: BoxDecoration(
//                  border: Border.all(color: Colors.red, width: 1),
                ),
                child: InteractiveViewer(
                  // reloadCounterが変わった時だけウィジェットを作り直す（操作中のリビルドでは維持される）
                  key: ValueKey(reloadCounter.value),
                  transformationController: transformationController,
                  boundaryMargin: const EdgeInsets.all(double.infinity),
                  constrained: false,
                  minScale: 0.01,
                  maxScale: 10.0,
                  child: SizedBox(
                    width: page.width,
                    height: page.height,
                    // pdfrxのPdfPageViewを使用して1ページのみを描画
                    child: PdfPageView(
                      document: doc,
                      pageNumber: 1,
                    ),
                  ),
                ),
              );
            }),
          ),
          // 編集・メモボタンを右上に配置
          Positioned(
            top: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: startEditing,
                  icon: const Icon(Icons.edit),
                  label: const Text('編集'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.8),
                    foregroundColor: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    if (FirebaseAuth.instance.currentUser == null) {
                      showLoginDialog(context,
                          content: 'メモ機能を利用するには会員登録/ログインが必要です。ログイン画面に移動しますか？');
                      return;
                    }
                    // メモ画面へ遷移
                    context.router.pushNamed('/edit/$sessionKey/false');
                  },
                  icon: const Icon(Icons.message_outlined),
                  label: const Text('メモ'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.8),
                    foregroundColor: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: dbgView
                ? _ViewerStatusPanel(viewerState: viewerState)
                : Container(),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: _ThumbnailNavigator(
              viewerState: viewerState,
              transformationController: transformationController,
              pdfDocument: pdfSnapshot.data,
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
    this.pdfDocument,
  });

  final ViewerState viewerState;
  final TransformationController transformationController;
  final PdfDocument? pdfDocument;

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
    if (viewerState.viewportSize == Size.zero || pdfDocument == null) {
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
            // pdfrxのPdfPageViewを使用してサムネイル画像を表示
            PdfPageView(
              document: pdfDocument!,
              pageNumber: 1,
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
