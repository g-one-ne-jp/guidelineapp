import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    final newScale = matrix.storage[0];
    final newX = matrix.storage[12];
    final newY = matrix.storage[13];

    if (state.scale == newScale &&
        state.xOffset == newX &&
        state.yOffset == newY) {
      return;
    }

    state = state.copyWith(
      scale: newScale,
      xOffset: newX,
      yOffset: newY,
    );
  }

  void updateViewportSize(Size size) {
    if (state.viewportSize == size) return;
    state = state.copyWith(viewportSize: size);
  }

  void updateContentSize(Size size) {
    if (state.contentSize == size) return;
    state = state.copyWith(contentSize: size);
  }
}

final viewerProvider =
    AutoDisposeNotifierProvider<ViewerNotifier, ViewerState>(ViewerNotifier.new);
