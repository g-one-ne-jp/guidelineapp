import 'dart:io';

import 'package:flutter/material.dart';

/// タブルーター（ネストされたナビゲーター）内の画面で
/// Android / iOS 両方のバックジェスチャを正しく処理するラッパー。
///
/// - Android: [PopScope] の `onPopInvokedWithResult` でシステムバック／エッジスワイプを横取り
/// - iOS    : `canPop: false` がスワイプを UIKit レベルで無効化するため、
///           左端に透明な [GestureDetector] を重ねてスワイプを検知する。
///
/// Usage:
/// ```dart
/// return TabBackHandler(
///   onBack: () => Navigator.of(context, rootNavigator: true).pop(),
///   child: Scaffold(...),
/// );
/// ```
class TabBackHandler extends StatelessWidget {
  const TabBackHandler({
    super.key,
    required this.onBack,
    required this.child,
    /// iOS 左端スワイプの検知幅（論理ピクセル）
    this.edgeWidth = 30.0,
    /// スワイプとみなす最低速度（論理ピクセル/秒）
    this.minVelocity = 200.0,
  });

  final VoidCallback onBack;
  final Widget child;
  final double edgeWidth;
  final double minVelocity;

  @override
  Widget build(BuildContext context) {
    // Android: PopScope で◀ボタン＆エッジスワイプを横取り
    // iOS    : PopScope は◀ボタンのフォールバック用に残しつつ、
    //          左端 GestureDetector でスワイプを別途検知する
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) onBack();
      },
      child: Stack(
        children: [
          child,

          // ── iOS のみ: 左端スワイプでバックを検知 ──────────────────────────
          // canPop: false によって UIKit の interactivePopGestureRecognizer が
          // 無効化されるため、Flutter ウィジェットレベルで代替検知する。
          if (Platform.isIOS)
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              width: edgeWidth,
              child: GestureDetector(
                // 背面コンテンツのタップを通過させる
                behavior: HitTestBehavior.translucent,
                onHorizontalDragEnd: (details) {
                  final velocity = details.primaryVelocity ?? 0;
                  // 右方向かつ十分な速度のスワイプのみ「戻る」とみなす
                  if (velocity > minVelocity) {
                    onBack();
                  }
                },
              ),
            ),
        ],
      ),
    );
  }
}
