import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';
import 'package:draw_free_hand_sample/paint_line_notifier.dart';
import 'package:draw_free_hand_sample/paint_line.dart';
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
        painter: painter,
      ),
    );
  }
}

class Painter extends CustomPainter {
  Painter({
    @required this.lines,
    @required this.currentLine,
    @required this.color,
  });

  final List<List<Offset>> lines;
  final List<Offset> currentLine;
  final Color color;

  double scalePressures = 10;
  Paint paintStyle = Paint();

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    paintStyle.color = color;
    paintStyle.strokeWidth = 3;
    for (int i = 0; i < currentLine.length - 1; i++) {
      canvas.drawPoints(
        PointMode.lines,
        [currentLine[i], currentLine[i + 1]],
        paintStyle,
      );
    }
    for (int i = 0; i < lines.length; i++) {
      for (int j = 0; j < lines[i].length - 1; j++) {
        canvas.drawPoints(
          PointMode.lines,
          [lines[i][j], lines[i][j + 1]],
          paintStyle,
        );
      }
    }
  }
}
