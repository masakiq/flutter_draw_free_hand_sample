import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:draw_free_hand_sample/paint_line.dart';

class PaintLineNotifier extends StateNotifier<PaintLine> {
  PaintLineNotifier(color) : super(PaintLine(color));

  void addPosition(Offset position) {
    state = state.addPosition(position);
  }

  void addPositionHistory() {
    state = state.addPositionHistory();
  }

  void setActive(bool active) {
    state = state.setActive(active);
  }
}

final paintLineNotifier = StateNotifierProvider.autoDispose
    .family<PaintLineNotifier, Color>((ref, color) {
  return PaintLineNotifier(color);
});
