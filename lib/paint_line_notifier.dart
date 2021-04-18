import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:draw_free_hand_sample/paint_line.dart';

class PaintLineNotifier extends StateNotifier<PaintLine> {
  PaintLineNotifier() : super(PaintLine());

  void addPosition(Offset position) {
    state = state.addPosition(position);
  }

  void addPositionHistory() {
    state = state.addPositionHistory();
  }
}

final paintLineNotifier = StateNotifierProvider<PaintLineNotifier>((ref) {
  return PaintLineNotifier();
});
