import 'package:flutter/material.dart';

import '../../application/application.dart';
import '../../application/inclination/gauge_palette.dart';
import 'analog_gauge.dart';
import 'digital_gauge.dart';

class RollGauge extends StatelessWidget {
  final GaugeStyle? style;

  const RollGauge({
    Key? key,
    required this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (style == GaugeStyle.digital) {
      return DigitalGauge(
        title: const Text('Roll'),
        stream: Application.inclinometer.roll.stream,
      );
    }

    return AnalogGauge(
      artboardName: 'roll_gauge',
      stream: Application.inclinometer.roll.stream,
    );
  }
}
