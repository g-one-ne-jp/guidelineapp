import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class ViewerState {
  final double scale;
  final double xOffset;
  final double yOffset;
  final Size viewportSize;
  final Size contentSize;

  ViewerState({
    required this.scale,
    required this.xOffset,
    required this.yOffset,
    this.viewportSize = Size.zero,
    this.contentSize = const Size(800, 1200),
  });

  ViewerState copyWith({
    double? scale,
    double? xOffset,
    double? yOffset,
    Size? viewportSize,
    Size? contentSize,
  }) {
    return ViewerState(
      scale: scale ?? this.scale,
      xOffset: xOffset ?? this.xOffset,
      yOffset: yOffset ?? this.yOffset,
      viewportSize: viewportSize ?? this.viewportSize,
      contentSize: contentSize ?? this.contentSize,
    );
  }
}

class ViewerNotifier extends AutoDisposeNotifier<ViewerState> {
  @override
  ViewerState build() {
    return ViewerState(scale: 1.0, xOffset: 0.0, yOffset: 0.0);
  }

  void updateFromMatrix(Matrix4 matrix) {
    state = state.copyWith(
      scale: matrix.storage[0],
      xOffset: matrix.storage[12],
      yOffset: matrix.storage[13],
    );
  }

  void updateViewportSize(Size size) {
    state = state.copyWith(viewportSize: size);
  }

  void updateContentSize(Size size) {
    state = state.copyWith(contentSize: size);
  }
}

final viewerProvider =
    AutoDisposeNotifierProvider<ViewerNotifier, ViewerState>(ViewerNotifier.new);
