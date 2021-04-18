import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';

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
