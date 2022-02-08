import 'package:flutter/material.dart';

import '../../application/application.dart';
import '../../application/inclination/gauge_palette.dart';
import '../../application/inclination/gauge_style.dart';
import '../../application/l10n/generated/l10n.dart';
import '../common/app_host.dart';
import 'analog_gauge.dart';
import 'digital_gauge.dart';

class RollGauge extends StatelessWidget {
  final GaugeStyle? style;

  const RollGauge({
    Key? key,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var effectiveStyle = style ?? AppSettings.of(context).style;
    if (effectiveStyle == GaugeStyle.digital) {
      return DigitalGauge(
          title: Text(S.of(context).roll),
          stream: Application.inclinometer.roll.stream);
    }

    return AnalogGauge(
      artboardName: 'roll_gauge',
      stream: Application.inclinometer.roll.stream,
      palette: Theme.of(context).brightness == Brightness.light
          ? GaugePalette.light
          : GaugePalette.dark,
    );
  }
}

class PitchGauge extends StatelessWidget {
  final GaugeStyle? style;

  const PitchGauge({
    Key? key,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var effectiveStyle = style ?? AppSettings.of(context).style;

    if (effectiveStyle == GaugeStyle.digital) {
      return DigitalGauge(
        title: Text(S.of(context).pitch),
        stream: Application.inclinometer.pitch.stream,
      );
    }

    return AnalogGauge(
      artboardName: 'pitch_gauge',
      stream: Application.inclinometer.pitch.stream,
      palette: Theme.of(context).brightness == Brightness.light
          ? GaugePalette.light
          : GaugePalette.dark,
    );
  }
}
