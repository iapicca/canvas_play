import 'package:canvas_play/pointer_gesture.dart';
import 'package:canvas_play/points_painter.dart';
import 'package:flutter_web/material.dart';
import 'dart:core';

class StatefulCanvas extends StatefulWidget {
  @override
  _StatefulCanvasState createState() => _StatefulCanvasState();
}

class _StatefulCanvasState extends State<StatefulCanvas> {
  Map<int,PointerGesture> _gestures = {};

  void _addPoint({final PointerType type, final PointerEvent event}){
    PointerGesture _gesture;
    if(_gestures[event.pointer]!=null) _gesture=_gestures[event.pointer];
    if( type==PointerType.down) _gesture = PointerGesture(id: event.pointer);
    if(_gesture!=null) _gesture.addPoint(event.position);
    if( type==PointerType.down) _gestures[event.pointer] = _gesture;
    setState((){});
  }

  @override
    void initState() {
      super.initState();
    }

  void _clearGestures() {
    _gestures.clear();
    setState((){});
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Listener(
      onPointerDown: (pointer)=> _addPoint(
        type: PointerType.down,
        event: pointer),
      onPointerMove: ( pointer )=> _addPoint(
        type: PointerType.move,
        event: pointer),
      onPointerUp: ( pointer )=> _addPoint(
        type: PointerType.up,
        event: pointer),
      onPointerCancel: ( pointer )=> _addPoint(
        type: PointerType.cancel,
        event: pointer),
      child: CustomPaint(
        painter: PointsPainter(
          gestures: _gestures),
        child: Container()
      ),
    ),
    floatingActionButton: IconButton(
      highlightColor: Colors.blue,
      icon: Icon(Icons.clear),
      onPressed:()=>_clearGestures()),
  );
}