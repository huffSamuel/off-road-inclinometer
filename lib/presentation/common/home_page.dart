import 'package:flutter/material.dart';
import 'package:native_device_orientation/native_device_orientation.dart';

import '../inclination/gauge_builder.dart';
import 'full_screen_button.dart';
import 'set_zero_button.dart';
import 'settings_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          Align(
            alignment: Alignment.topRight,
            child: FullScreenButton(),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SettingsButton(),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SetZeroButton(),
          ),
          Indicators(),
        ],
      ),
    );
  }
}

class Indicators extends StatelessWidget {
  const Indicators({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = [
      const PitchGauge(),
      const RollGauge(),
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

bool isLandscape(NativeDeviceOrientation orientation) {
  return orientation == NativeDeviceOrientation.landscapeLeft ||
      orientation == NativeDeviceOrientation.landscapeRight;
}
