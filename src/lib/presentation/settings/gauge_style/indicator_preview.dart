import 'package:flutter/material.dart';

import '../../../application/inclination/gauge_palette.dart';
import '../../../application/ioc.dart';
import '../../inclination/roll_gauge.dart';

class IndicatorPreview extends StatelessWidget {
  final GaugeStyle style;

  const IndicatorPreview({Key? key, required this.style, required})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: 200,
        height: 200,
        child: RollGauge(
          style: style,
          inclinometer: ioc(),
        ),
      ),
    );
  }
}
