import 'package:flutter/material.dart';
import 'package:off_road_inclinometer/application/inclination/inclinometer.dart';

import '../../application/application.dart';
import '../../application/inclination/gauge_palette.dart';
import 'analog_gauge.dart';
import 'digital_gauge.dart';

class RollGauge extends StatelessWidget {
  final GaugeStyle? style;
  final Inclinometer inclinometer;

  const RollGauge({
    Key? key,
    required this.style,
    required this.inclinometer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (style == GaugeStyle.digital) {
      return DigitalGauge(
        title: const Text('Roll'),
        stream: inclinometer.roll.stream,
      );
    }

    return AnalogGauge(
      artboardName: 'roll_gauge',
      stream: inclinometer.roll.stream,
    );
  }
}
