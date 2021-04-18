import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:draw_free_hand_sample/paint_line_notifier.dart';
import 'package:draw_free_hand_sample/paint_line.dart';
import 'package:draw_free_hand_sample/painter.dart';
import 'package:flutter/src/widgets/basic.dart' as MyBasic;

class MyCanvas extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    PaintLine paintLine = watch(paintLineNotifier.state);
    Painter painter = Painter(
      currentLine: paintLine.currentLine(),
      lines: paintLine.getLines(),
      color: paintLine.currentColor(),
    );

    return MyBasic.Listener(
      onPointerMove: (details) {
        context
            .read<PaintLineNotifier>(paintLineNotifier)
            .addPosition(details.localPosition);
      },
      onPointerUp: (details) {
        context.read<PaintLineNotifier>(paintLineNotifier).addPositionHistory();
      },
      child: CustomPaint(
        size: MediaQuery.of(context).size,
        painter: painter,
      ),
    );
  }
}
