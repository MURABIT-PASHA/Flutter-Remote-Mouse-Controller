import 'package:flutter/services.dart';

class PointerManager{
  static const MethodChannel _methodChannel = MethodChannel('com.LimonitGames/socket');

  static Future<void> onRightClick() async{
    await _methodChannel.invokeMethod('event', {"type": "rightClick"});
  }
  static Future<void> onDrag(double length, double degree) async{
    await _methodChannel.invokeMethod('event', {"type": "drag", "length": length, "degree": degree});
  }
  static Future<void> onLeftClick() async{
    await _methodChannel.invokeMethod('event', {"type": "leftClick"});
  }
  static Future<void> onOpen() async{
    await _methodChannel.invokeMethod('event', {"type": "open"});
  }
}