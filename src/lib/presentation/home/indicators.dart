import 'package:flutter/material.dart';
import 'package:native_device_orientation/native_device_orientation.dart';

import '../../application/ioc.dart';
import '../common/util.dart';
import '../inclination/pitch_gauge.dart';
import '../inclination/roll_gauge.dart';

class Indicators extends StatelessWidget {
  const Indicators({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = [
      Flexible(
        flex: 1,
        child: PitchGauge(
          inclinometer: ioc(),
        ),
      ),
      Flexible(
        flex: 1,
        child: RollGauge(
          inclinometer: ioc(),
        ),
      ),
    ];

    return NativeDeviceOrientationReader(
      builder: (context) {
        final orientation = NativeDeviceOrientationReader.orientation(context);

        if (isLandscape(orientation)) {
          return Row(
            children: [
              children[0],
              const SizedBox(width: 60),
              children[1],
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          );
        }

        return Column(
          children: children,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        );
      },
    );
  }
}
