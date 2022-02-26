import 'dart:async';
import 'dart:math' as math;

import 'package:flutter_sensors/flutter_sensors.dart';
import 'package:native_device_orientation/native_device_orientation.dart';

import '../../domain/vector.dart';

const _radToDeg = 57.3;

class Inclinometer {
  final _communicator = NativeDeviceOrientationCommunicator();
  final _sensorManager = SensorManager();

  bool zero = false;

  double? _lastPitch;
  double? _lastRoll;
  Vector3? _lastSensor;
  NativeDeviceOrientation? _lastOrientation;

  StreamController<double> pitch = StreamController.broadcast();
  StreamController<double> roll = StreamController.broadcast();

  void _updateSensor(List<double> data) {
    _lastSensor = Vector3(data[0], data[1], data[2]);
    _calculate();
  }

  void _updateOrientation(NativeDeviceOrientation orientation) {
    _lastOrientation = orientation;
    _calculate();
  }

  void _calculate() {
    if (_lastSensor == null || _lastOrientation == null) {
      return;
    }

    final nextPitch = _calculatePitch(_lastSensor!, _lastOrientation!);
    final nextRoll = _calculateRoll(_lastSensor!, _lastOrientation!);

    if (zero && _lastPitch == null) {
      _lastPitch = nextPitch;
      _lastRoll = nextRoll;
    }

    pitch.add(nextPitch - (zero ? _lastPitch! : 0));
    roll.add(nextRoll - (zero ? _lastRoll! : 0));
  }

  setZero() {
    zero = true;
    _lastPitch = null;
  }

  clearZero() {
    zero = false;
  }

  init() {
    _sensorManager
        .sensorUpdates(
            sensorId: Sensors.ACCELEROMETER,
            interval: Sensors.SENSOR_DELAY_GAME)
        .then(
      (stream) {
        stream.listen((event) => _updateSensor(event.data));
      },
    );

    _communicator.onOrientationChanged().listen(_updateOrientation);
  }

  double _calculatePitch(Vector3 v, NativeDeviceOrientation orientation) {
    double pitch;

    if (orientation == NativeDeviceOrientation.landscapeLeft ||
        orientation == NativeDeviceOrientation.landscapeRight) {
      pitch = _pitch(v.x, v.z);
    } else {
      pitch = _pitch(v.y, v.z);
    }

    switch (orientation) {
      case NativeDeviceOrientation.landscapeLeft:
      case NativeDeviceOrientation.portraitUp:
        pitch = pitch - 90;
        break;
      case NativeDeviceOrientation.landscapeRight:
      case NativeDeviceOrientation.portraitDown:
        pitch = -pitch - 90;
        break;
      default:
        break;
    }
    return _precision(pitch);
  }

  double _calculateRoll(Vector3 v, NativeDeviceOrientation orientation) {
    double roll;

    if (orientation == NativeDeviceOrientation.landscapeLeft ||
        orientation == NativeDeviceOrientation.landscapeRight) {
      roll = _roll(v.y, v.x, v.z) * -1;
    } else {
      roll = _roll(v.x, v.y, v.z);
    }

    return _precision(roll);
  }

  double _pitch(double y, double z) {
    return math.atan2(y, z) * _radToDeg;
  }

  double _roll(double x, double y, double z) {
    return math.atan2(-x, math.sqrt(y * y + z * z)) * _radToDeg;
  }

  double _precision(double value) {
    return double.parse(value.toStringAsFixed(1));
  }
}
