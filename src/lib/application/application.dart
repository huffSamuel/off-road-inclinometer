import 'package:fluro/fluro.dart';
import 'package:flutter/services.dart';

class Application {
  static const String title = 'Off-Road Inclinometer';
  static const String version = "1.0.1";
  static const String url = 'https://github.com/huffSamuel/off-road-inclinometer';
  static late FluroRouter router;
  static late ByteData gauge;

  static const int bufferSize = 5;
}

