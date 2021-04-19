import 'package:flutter/material.dart';

class PaintLine {
  List<Offset> _currentLine = [];
  List<List<Offset>> _lines = [[]];
  Color _color = Colors.blue;
  bool _active = false;

  PaintLine(Color color, [currentLine, lines, active]) {
    _color = color;
    if (currentLine != null) {
      _currentLine = currentLine;
    }
    if (lines != null) {
      _lines = lines;
    }
    if (color == Colors.blue) {
      _active = true;
    }
    if (active != null) {
      _active = active;
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

  PaintLine setActive(bool active) {
    _active = active;
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

  bool isActive() {
    return _active;
  }
}
