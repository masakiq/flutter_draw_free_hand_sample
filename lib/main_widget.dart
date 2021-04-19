import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:draw_free_hand_sample/my_canvas.dart';
import 'package:draw_free_hand_sample/change_color_button.dart';
import 'package:draw_free_hand_sample/paint_line.dart';
import 'package:draw_free_hand_sample/paint_line_notifier.dart';

class MainWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    List<Widget> widgets = [];
    PaintLine blueLine = watch(paintLineNotifier(Colors.blue).state);
    // PaintLine redLine = watch(paintLineNotifier(Colors.red).state);
    if (blueLine.isActive()) {
      widgets.add(MyCanvas(color: Colors.red));
      widgets.add(MyCanvas(color: Colors.blue));
    } else {
      widgets.add(MyCanvas(color: Colors.blue));
      widgets.add(MyCanvas(color: Colors.red));
    }
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Image.asset('assets/images/Icon-192.png'),
          widgets[0],
          widgets[1],
          ChangeColorButton(),
        ],
      ),
    );
  }
}
