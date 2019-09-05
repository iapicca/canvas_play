import 'package:canvas_play/stateful_canvas.dart';
import 'package:flutter_web/material.dart';

// a porting (and clean up) to flutter web of this 
// https://github.com/starterboost/flutter_canvas_experiment

void main() => runApp( MaterialApp(
    home: StatefulCanvas(),
    debugShowCheckedModeBanner: false
  ),
);