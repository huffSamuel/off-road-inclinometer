import 'package:fluro/fluro.dart';
import 'package:flutter/services.dart';

import 'inclination/inclinometer.dart';

class Application {
  static const String title = 'Off-Road Inclinometer';
  static const String version = "0.0.1-alpha";
  static const String url = 'https://github.com/huffSamuel/off-road-inclinometer';
  static late FluroRouter router;
  static late ByteData gauge;
  static final inclinometer = Inclinometer();
}

