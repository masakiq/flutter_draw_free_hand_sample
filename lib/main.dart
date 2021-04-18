import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:draw_free_hand_sample/my_canvas.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        // バックグラウンドにイメージ設定
        home: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Icon-192.png'),
            ),
          ),
          // child: Writeable(),
          child: MyCanvas(),
        ),
        // Stack を使う
        // home: Container(
        //   color: Colors.white,
        //   child: Stack(
        //     children: [
        //       Image.asset('assets/images/Icon-192.png'),
        //       Writeable(),
        //     ],
        //   ),
        // ),
      ),
    ),
  );
  // runApp(
  //   Container(
  //     color: Colors.white,
  //     child: Writeable(),
  //   ),
  // );
}
