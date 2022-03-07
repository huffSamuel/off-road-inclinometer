import 'package:flutter/material.dart';

import '../../application/gauge/app_theme.dart';
import '../../application/inclination/inclinometer.dart';
import '../common/app_settings.dart';
import 'analog_gauge.dart';
import 'digital_gauge.dart';

class RollGauge extends StatelessWidget {
  final GaugeThemeData? theme;
  final Inclinometer inclinometer;

  const RollGauge({
    Key? key,
    this.theme,
    required this.inclinometer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (AppSettings.of(context).digital) {
      return DigitalGauge(
        title: const Text('Roll'),
        stream: inclinometer.roll.stream,
      );
    }

    return AnalogGauge(
      gaugeTheme: theme,
      artboardName: 'roll_gauge',
      stream: inclinometer.roll.stream,
    );
  }
}
