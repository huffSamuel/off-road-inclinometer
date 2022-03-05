import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AnalogGaugeThemeData {
  final Color scaleColor;

  const AnalogGaugeThemeData({required this.scaleColor});

  static const dark = AnalogGaugeThemeData(
    scaleColor: Colors.white,
  );
  static const light = AnalogGaugeThemeData(
    scaleColor: Colors.black,
  );
}

class AnalogGaugeTheme extends Equatable {
  final String name;
  final AnalogGaugeThemeData? light;
  final AnalogGaugeThemeData? dark;

  data(ThemeMode mode) {
    return mode == ThemeMode.dark ? dark : light;
  }

  AnalogGaugeTheme(this.name, {this.light, this.dark});

  static List<AnalogGaugeTheme> all = [
    standard,
    redDawn
  ];

  static AnalogGaugeTheme standard = AnalogGaugeTheme(
    'Default Analog',
    light: AnalogGaugeThemeData.light,
    dark: AnalogGaugeThemeData.dark,
  );

  static AnalogGaugeTheme redDawn = AnalogGaugeTheme(
    'Red Dawn',
    light: AnalogGaugeThemeData(scaleColor: Colors.red),
    dark: AnalogGaugeThemeData(scaleColor: Colors.red),
  );

  @override
  List<Object?> get props => [name];
}
