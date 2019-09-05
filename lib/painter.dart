
import 'package:flutter_web/material.dart';
import 'pointer_gesture.dart';
import 'dart:math' as math;


class PointsPainter extends CustomPainter{
  final Map<int,PointerGesture> gestures;
  PointsPainter({this.gestures});

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint()
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    gestures.forEach((int key, PointerGesture gesture){

      Offset pntLast;
      int i = 0;

      gesture.points.forEach((pnt) {
        if(pntLast != null && pnt != null ){

          //////////// starts thin, goes fat, back to thin ///////
          final double r = i>0?i/gesture.points.length:0;

          ///////////////////////  OUTLINE ///////////////////////
          paint.strokeWidth = 20 + 100 * r;
          paint.color = Colors.black;
          canvas.drawLine( pntLast, pnt, paint );

          ///////////////////////  YELLOW  ///////////////////////
          paint.strokeWidth = 100 * r;
          paint.color = Color.lerp( Colors.yellow, Colors.orange, math.pow( r, 0.25 ) );
          canvas.drawLine( pntLast, pnt, paint );

          ///////////////////////  RED  ///////////////////////
          paint.strokeWidth = 100 * math.pow( r, 6 );
          if( paint.strokeWidth > 20 ) {
            paint.color = Color.lerp( Colors.black, Colors.red, r );
            canvas.drawLine( pntLast, pnt, paint );
          }
        }

        i++;
        pntLast = pnt;
        
      });
    });
  }

  @override
  bool shouldRepaint(PointsPainter oldDelegate) => true;
}