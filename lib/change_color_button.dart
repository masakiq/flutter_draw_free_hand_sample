import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:draw_free_hand_sample/paint_line_notifier.dart';

class ChangeColorButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    return ElevatedButton(
      child: Text(
        'Change Color',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Color(0xff7e849a),
        onPrimary: Colors.white,
      ),
      onPressed: () {
        bool blueLine = context
            .read<PaintLineNotifier>(paintLineNotifier(Colors.blue))
            .state
            .isActive();
        if (blueLine) {
          context
              .read<PaintLineNotifier>(paintLineNotifier(Colors.blue))
              .setActive(false);
          context
              .read<PaintLineNotifier>(paintLineNotifier(Colors.red))
              .setActive(true);
        } else {
          context
              .read<PaintLineNotifier>(paintLineNotifier(Colors.blue))
              .setActive(true);
          context
              .read<PaintLineNotifier>(paintLineNotifier(Colors.red))
              .setActive(false);
        }
      },
    );
  }
}
