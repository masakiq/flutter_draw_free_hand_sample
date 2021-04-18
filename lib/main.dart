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
  List<List<double>> pressures = [[]];
  List<Offset> currentLine = [];
  List<List<Offset>> lines = [[]];
  List<double> currentLinePressures = [];
  double pressure;
  Offset position;
  Color color = Colors.black;
  Painter painter;
  CustomPaint paintCanvas;

  @override
  Widget build(BuildContext context) {
    painter = Painter(
        lines: lines,
        currentLine: currentLine,
        pressures: pressures,
        currentLinePressures: currentLinePressures,
        color: color);

    paintCanvas = CustomPaint(
      painter: painter,
    );

    return Listener(
      onPointerMove: (details) {
        setState(() {
          currentLinePressures.add(details.pressure);
          currentLine.add(details.localPosition);
        });
      },
      onPointerUp: (details) {
        setState(() {
          lines.add(currentLine.toList());
          pressures.add(currentLinePressures.toList());
          currentLine.clear();
          currentLinePressures.clear();
        });
      },
      child: paintCanvas,
    );
  }
}

class Painter extends CustomPainter {
  Painter(
      {@required this.lines,
      @required this.currentLine,
      @required this.color,
      @required this.pressures,
      @required this.currentLinePressures});

  final List<List<Offset>> lines;
  final List<Offset> currentLine;
  final Color color;
  final List<List<double>> pressures;
  final List<double> currentLinePressures;

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
    for (int i = 0; i < currentLine.length - 1; i++) {
      paintStyle.strokeWidth = currentLinePressures[i] * scalePressures;
      canvas.drawPoints(
          PointMode.lines, [currentLine[i], currentLine[i + 1]], paintStyle);
    }
    // Paint all completed lines drawn since app start
    for (int i = 0; i < lines.length; i++) {
      for (int j = 0; j < lines[i].length - 1; j++) {
        paintStyle.strokeWidth = pressures[i][j] * scalePressures;
        canvas.drawPoints(
            PointMode.lines, [lines[i][j], lines[i][j + 1]], paintStyle);
      }
    }
  }
}
