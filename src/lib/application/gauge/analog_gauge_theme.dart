import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AnalogGaugeThemeData {
  final Color scaleColor;

  const AnalogGaugeThemeData({required this.scaleColor});

  factory AnalogGaugeThemeData.fromJson(Map<String, dynamic> json) {
    return AnalogGaugeThemeData(
        scaleColor: Color(
      json['scaleColor'],
    ));
  }

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

  const AnalogGaugeTheme(this.name, {this.light, this.dark});

  factory AnalogGaugeTheme.fromJson(Map<String, dynamic> json) {
    return AnalogGaugeTheme(
      json['name'],
      light: json['light'] == null
          ? null
          : AnalogGaugeThemeData.fromJson(json['light']),
      dark: json['dark'] == null
          ? null
          : AnalogGaugeThemeData.fromJson(json['dark']),
    );
  }

  static List<AnalogGaugeTheme> all = [
    standard,
    redDawn,
  ];

  static AnalogGaugeTheme standard = const AnalogGaugeTheme(
    'Default Analog',
    light: AnalogGaugeThemeData.light,
    dark: AnalogGaugeThemeData.dark,
  );

  static AnalogGaugeTheme redDawn = const AnalogGaugeTheme(
    'Red Dawn',
    light: AnalogGaugeThemeData(scaleColor: Colors.red),
    dark: AnalogGaugeThemeData(scaleColor: Colors.red),
  );
  @override
  List<Object?> get props => [name];
}
