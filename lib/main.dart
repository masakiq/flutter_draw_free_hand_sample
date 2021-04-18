import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';

void main() {
  runApp(Container(
    color: Colors.white,
    child: Writeable(),
  ));
}

class Writeable extends StatefulWidget {
  @override
  _WriteableState createState() => _WriteableState();
}

class _WriteableState extends State<Writeable> {
  List<Offset> currentLine = [];
  List<List<Offset>> lines = [[]];
  Color color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    Painter painter = Painter(
      lines: lines,
      currentLine: currentLine,
      color: color,
    );

    CustomPaint paintCanvas = CustomPaint(
      painter: painter,
    );

    return Listener(
      onPointerMove: (details) {
        setState(() {
          currentLine.add(details.localPosition);
        });
      },
      onPointerUp: (details) {
        setState(() {
          lines.add(currentLine.toList());
          currentLine.clear();
        });
      },
      child: paintCanvas,
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

  // Paints here using drawPoints and PointMode.lines, but have also tried
  // PointMode.points, PointMode.polygon and drawPath with a path variable and
  // moveTo, lineTo methods.
  @override
  void paint(Canvas canvas, Size size) {
    // Paint line currently being drawn (points added since pointer was
    // last lifted)
    paintStyle.color = color;
    paintStyle.strokeWidth = 3;
    for (int i = 0; i < currentLine.length - 1; i++) {
      canvas.drawPoints(
        PointMode.lines,
        [currentLine[i], currentLine[i + 1]],
        paintStyle,
      );
    }
    // Paint all completed lines drawn since app start
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
