import 'package:flutter/material.dart';

import '../../application/application.dart';
import '../../application/inclination/gauge_palette.dart';
import 'analog_gauge.dart';
import 'digital_gauge.dart';

class PitchGauge extends StatelessWidget {
  final GaugeStyle style;

  const PitchGauge({
    Key? key,
    required this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (style == GaugeStyle.digital) {
      return DigitalGauge(
        title: const Text('Pitch'),
        stream: Application.inclinometer.pitch.stream,
      );
    }

    return AnalogGauge(
      artboardName: 'pitch_gauge',
      stream: Application.inclinometer.pitch.stream,
    );
  }
}
