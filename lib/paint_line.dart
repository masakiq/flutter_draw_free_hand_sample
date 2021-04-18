import 'package:flutter/material.dart';

class PaintLine {
  List<Offset> _currentLine = [];
  List<List<Offset>> _lines = [[]];
  Color _color = Colors.blue;

  PaintLine([currentLine, lines, color]) {
    if (currentLine != null) {
      _currentLine = currentLine;
    }
    if (lines != null) {
      _lines = lines;
    }
    if (color != null) {
      _color = color;
    }
  }

  PaintLine addPosition(Offset position) {
    _currentLine.add(position);
    return this;
  }

  PaintLine addPositionHistory() {
    _lines.add(_currentLine.toList());
    _currentLine.clear();
    return this;
  }

  PaintLine toggleColor() {
    if (_color == Colors.blue) {
      _color = Colors.red;
    } else {
      _color = Colors.blue;
    }
    return this;
  }

  List<Offset> currentLine() {
    return _currentLine;
  }

  List<List<Offset>> getLines() {
    return _lines;
  }

  Color currentColor() {
    return _color;
  }
}
