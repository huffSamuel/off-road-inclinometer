import 'package:flutter/material.dart';

import '../../../application/inclination/gauge_palette.dart';
import '../../inclination/roll_gauge.dart';

class IndicatorPreview extends StatelessWidget {
  final GaugeStyle style;

  const IndicatorPreview({Key? key, required this.style, required})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 365,
          child: RollGauge(
            style: style,
          ),
        ),
      ],
    );
  }
}