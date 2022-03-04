import 'package:flutter/material.dart';
import 'package:off_road_inclinometer/application/inclination/inclinometer.dart';

import 'full_screen_button.dart';
import 'indicators.dart';
import 'set_zero_button.dart';
import 'settings_button.dart';

class HomePage extends StatelessWidget {
  final Inclinometer inclinometer;

  const HomePage({Key? key, required this.inclinometer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Indicators(),
          const Align(
            alignment: Alignment.topRight,
            child: FullScreenButton(),
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: SettingsButton(),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SetZeroButton(
              inclinometer: inclinometer,
            ),
          ),
        ],
      ),
    );
  }
}
