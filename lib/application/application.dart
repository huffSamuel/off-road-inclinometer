import 'package:fluro/fluro.dart';
import 'package:flutter/services.dart';

import 'inclination/inclinometer.dart';

class Application {
  static const String title = 'Off-Road Inclinometer';
  static const String version = "0.0.1-alpha";
  static late FluroRouter router;
  static late ByteData gauge;
  static final inclinometer = Inclinometer();
}

class Vector3 {
  final double x;
  final double y;
  final double z;

  Vector3(this.x, this.y, this.z);
}
