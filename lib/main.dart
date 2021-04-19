import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:draw_free_hand_sample/main_widget.dart';

void main() {
  MainWidget();
  runApp(
    ProviderScope(
      child: MaterialApp(
        home: MainWidget(),
      ),
    ),
  );
}
