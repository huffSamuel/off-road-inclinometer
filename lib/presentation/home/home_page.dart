import 'package:flutter/material.dart';

import 'full_screen_button.dart';
import 'indicators.dart';
import 'set_zero_button.dart';
import 'settings_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          Indicators(),
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
        ],
      ),
    );
  }
}
