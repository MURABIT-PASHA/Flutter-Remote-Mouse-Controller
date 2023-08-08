import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mouse/pointer_manager.dart';

class MouseDetector extends StatefulWidget {
  const MouseDetector({Key? key}) : super(key: key);

  @override
  State<MouseDetector> createState() => _MouseDetectorState();
}

class VectorResult {
  late double length;
  late double angle;
}

class _MouseDetectorState extends State<MouseDetector> {
  List<String> touchPoints = [];
  double oldTouchPointX = 0;
  double oldTouchPointY = 0;
  VectorResult calculateVector(double x1, double y1, double x2, double y2) {
    double dx = x2 - x1;
    double dy = y2 - y1;

    double length = sqrt(dx * dx + dy * dy);
    double angle = atan2(dy, dx);

    return VectorResult()
      ..length = length
      ..angle = angle;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/background.jpg"),
                    fit: BoxFit.cover)),
          ),
          GestureDetector(
            onLongPress: () {
              PointerManager.onRightClick();
            },
            onDoubleTap: () {
              PointerManager.onOpen();
            },
            onTap: () {
              PointerManager.onLeftClick();
            },
            behavior: HitTestBehavior.opaque,
            onTapDown: (TapDownDetails details) {
              addTouchPoint(details.globalPosition);
            },
            onPanUpdate: (DragUpdateDetails details) {
              addTouchPoint(details.globalPosition);
            },
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: width / 2 - 10,
                          child: ElevatedButton(
                            onPressed: () {
                              PointerManager.onLeftClick();
                            },
                            child: null,
                          ),
                        ),
                        Container(
                          height: 50,
                          width: width / 2 - 10,
                          child: ElevatedButton(
                            onPressed: () {
                              PointerManager.onRightClick();
                            },
                            child: null,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addTouchPoint(Offset globalPosition) {
    if (oldTouchPointX != 0 || oldTouchPointY != 0) {
      printVector(
          oldTouchPointX, oldTouchPointY, globalPosition.dx, globalPosition.dy);
    }
    oldTouchPointX = globalPosition.dx;
    oldTouchPointY = globalPosition.dy;
  }

  void printVector(double x1, double y1, double x2, double y2) {
    VectorResult result = calculateVector(x1, y1, x2, y2);

    double length = result.length;
    double angleRadians = result.angle;
    double angleDegrees = angleRadians * 180 / pi;

    PointerManager.onDrag(length, angleDegrees);
  }
}
