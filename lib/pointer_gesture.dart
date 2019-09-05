import 'package:flutter_web_ui/ui.dart';

typedef MapOffset = void Function(Offset offset);
enum PointerType{down,move,up,cancel}

class PointerGesture{
  final int id;
  PointerGesture({this.id});

  List<Offset> _points = [];
  List<Offset> get points => _points;

  void addPoint(Offset point){
    if( _points.isEmpty){
      _points.add( point );
    }else {
      if((_points.last - point).distanceSquared > 1000.0 ) _points.add( point );
      if( _points.length > 20 ) _points.removeAt( 0 );
    }
  }

  void forEach(MapOffset mapper)=> _points.forEach(mapper);
}