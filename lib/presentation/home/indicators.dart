import 'package:flutter/material.dart';
import 'package:native_device_orientation/native_device_orientation.dart';

import '../common/app_settings.dart';
import '../common/util.dart';
import '../inclination/pitch_gauge.dart';
import '../inclination/roll_gauge.dart';

class Indicators extends StatelessWidget {
  const Indicators({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = [
      PitchGauge(
        style: AppSettings.of(context).style,
      ),
      RollGauge(
        style: AppSettings.of(context).style,
      ),
    ];

    return NativeDeviceOrientationReader(builder: (context) {
      final orientation = NativeDeviceOrientationReader.orientation(context);

      if (isLandscape(orientation)) {
        return Row(
          children: children,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        );
      }

      return Column(
        children: children,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      );
    });
  }
}
