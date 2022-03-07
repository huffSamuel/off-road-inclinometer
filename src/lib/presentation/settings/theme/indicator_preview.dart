import 'package:flutter/material.dart';

import '../../../application/gauge/app_theme.dart';
import '../../../application/ioc.dart';
import '../../inclination/roll_gauge.dart';

class IndicatorPreview extends StatelessWidget {
  final GaugeThemeData theme;

  const IndicatorPreview({
    Key? key,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: 200,
        height: 200,
        child: RollGauge(
          theme: theme,
          inclinometer: ioc(),
        ),
      ),
    );
  }
}
