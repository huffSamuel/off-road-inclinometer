import 'package:flutter/material.dart';

import 'analog_gauge_theme.dart';
import 'app_theme.dart';

class MergedThemeData {
  final String name;

  /// Application theme data
  final Map<ThemeMode, ThemeData> theme;

  /// Color scheme for the analog gauge.
  final Map<ThemeMode, AnalogGaugePaint> analog;

  /// Color overrides for the digital gauge text.
  final Map<ThemeMode, Color?> digital;

  MergedThemeData({
    required this.name,
    required this.theme,
    required this.analog,
    required this.digital,
  });

  factory MergedThemeData.fromJson(Map<String, dynamic> json) {
    return MergedThemeData(
      name: json['name'],
      analog: {
        ThemeMode.light: AnalogGaugePaint.fromJson(json['analog']['light']),
        ThemeMode.dark: AnalogGaugePaint.fromJson(json['analog']['dark']),
      },
      digital: {},
      theme: {
        ThemeMode.light: AppThemeData.fromJson(json['theme']['light'])
            .mergeWith(ThemeData.light()),
        ThemeMode.dark: AppThemeData.fromJson(json['theme']['dark'])
            .mergeWith(ThemeData.dark()),
      },
    );
  }

  factory MergedThemeData.fallback() {
    return MergedThemeData(
      name: 'Default',
      analog: {
        ThemeMode.light: AnalogGaugePaint.fallbackLight(),
        ThemeMode.dark: AnalogGaugePaint.fallbackDark(),
      },
      digital: {},
      theme: {
        ThemeMode.dark: ThemeData.dark().copyWith(
          iconTheme: const IconThemeData(color: Colors.white),
          appBarTheme: kAppBarTheme.copyWith(
            foregroundColor: Colors.white,
          ),
        ),
        ThemeMode.light: ThemeData.light().copyWith(
          iconTheme: const IconThemeData(color: Colors.black),
          appBarTheme: kAppBarTheme.copyWith(
            foregroundColor: Colors.black
          ),
        ),
      },
    );
  }
}

const kAppBarTheme = AppBarTheme(
  color: Colors.transparent,
  shadowColor: Colors.transparent,
  elevation: 0.0,
);
