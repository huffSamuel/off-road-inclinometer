import 'package:flutter/material.dart';

import '../../application/inclination/gauge_palette.dart';
import '../../application/inclination/inclinometer.dart';
import 'analog_gauge.dart';
import 'digital_gauge.dart';

class PitchGauge extends StatelessWidget {
  final GaugeStyle style;
  final Inclinometer inclinometer;

  const PitchGauge({
    Key? key,
    required this.style,
    required this.inclinometer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (style == GaugeStyle.digital) {
      return DigitalGauge(
        title: const Text('Pitch'),
        stream: inclinometer.pitch.stream,
      );
    }

    return AnalogGauge(
      artboardName: 'pitch_gauge',
      stream: inclinometer.pitch.stream,
    );
  }
}
