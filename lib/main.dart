import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:draw_free_hand_sample/my_canvas.dart';
import 'package:draw_free_hand_sample/change_color_button.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        home: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Image.asset('assets/images/Icon-192.png'),
              MyCanvas(),
              ChangeColorButton(),
            ],
          ),
        ),
      ),
    ),
  );
}
