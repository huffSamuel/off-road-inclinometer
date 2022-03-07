import 'package:flutter/material.dart';

class GaugeThemeData {
  final String name;

  /// Application theme data
  final Map<ThemeMode, ThemeData> theme;

  /// Color scheme for the analog gauge.
  final Map<ThemeMode, AnalogGaugePaint> analog;

  /// Color overrides for the digital gauge text.
  final Map<ThemeMode, Color?> digital;

  GaugeThemeData({
    required this.name,
    required this.theme,
    required this.analog,
    required this.digital,
  });

  factory GaugeThemeData.fromJson(Map<String, dynamic> json) {
    final lightColor = Color(json['lightColor']);
    final darkColor = Color(json['darkColor']);

    return GaugeThemeData(
      name: json['name'],
      analog: {
        ThemeMode.light: AnalogGaugePaint.fromJson(json['analog']['light']),
        ThemeMode.dark: AnalogGaugePaint.fromJson(json['analog']['dark']),
      },
      digital: {},
      theme: _themeFromColors(lightColor, darkColor),
    );
  }

  static Map<ThemeMode, ThemeData> _themeFromColors(
      Color lightColor, Color darkColor) {
    final lightIcon = IconThemeData(color: lightColor);
    final lightText = ThemeData.light().textTheme.apply(
          bodyColor: lightColor,
        );
    final darkIcon = IconThemeData(color: darkColor);
    final darkText = ThemeData.dark().textTheme.apply(
          bodyColor: darkColor,
        );

    return {
      ThemeMode.dark: ThemeData.dark().copyWith(
        iconTheme: darkIcon,
        textTheme: darkText,
        appBarTheme: kAppBarTheme.copyWith(foregroundColor: darkColor),
      ),
      ThemeMode.light: ThemeData.light().copyWith(
        iconTheme: lightIcon,
        textTheme: lightText,
        appBarTheme: kAppBarTheme.copyWith(foregroundColor: lightColor),
      ),
    };
  }

  factory GaugeThemeData.fallback() {
    return GaugeThemeData(
      name: 'Default',
      analog: {
        ThemeMode.light: AnalogGaugePaint.fallbackLight(),
        ThemeMode.dark: AnalogGaugePaint.fallbackDark(),
      },
      digital: {},
      theme: {
        ThemeMode.dark: ThemeData.dark().copyWith(
          iconTheme: const IconThemeData(color: Colors.white),
          appBarTheme: kAppBarTheme,
        ),
        ThemeMode.light: ThemeData.light().copyWith(
          iconTheme: const IconThemeData(color: Colors.black),
          appBarTheme: kAppBarTheme,
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

class AnalogGaugePaint {
  AnalogGaugePaint({
    required this.internalIndicator,
    required this.internalScale,
    required this.externalIndicator,
    required this.gaugeBody,
    required this.externalScale,
  });

  final Color? internalIndicator;
  final Color? internalScale;
  final Color? externalIndicator;
  final Color? gaugeBody;
  final Color? externalScale;

  factory AnalogGaugePaint.fromJson(Map<String, dynamic> json) {
    return AnalogGaugePaint(
        internalIndicator: json['internalIndicator'] == null
            ? null
            : Color(json['internalIndicator']),
        internalScale:
            json['internalScale'] == null ? null : Color(json['internalScale']),
        externalIndicator: json['externalIndicator'] == null
            ? null
            : Color(json['externalIndicator']),
        gaugeBody: json['gaugeBody'] == null ? null : Color(json['gaugeBody']),
        externalScale: json['externalScale'] == null
            ? null
            : Color(json['externalScale']));
  }

  AnalogGaugePaint copyWith({
    Color? internalIndicator,
    Color? internalScale,
    Color? externalIndicator,
    Color? gaugeBody,
    Color? externalScale,
  }) {
    return AnalogGaugePaint(
      externalIndicator: externalIndicator ?? this.externalIndicator,
      internalIndicator: internalIndicator ?? this.internalIndicator,
      internalScale: internalScale ?? this.internalScale,
      gaugeBody: gaugeBody ?? this.gaugeBody,
      externalScale: externalScale ?? this.externalScale,
    );
  }

  factory AnalogGaugePaint.fallbackLight() {
    return AnalogGaugePaint(
      internalIndicator: Colors.white,
      internalScale: Colors.black,
      externalIndicator: Colors.red,
      gaugeBody: Colors.white,
      externalScale: Colors.black,
    );
  }

  factory AnalogGaugePaint.fallbackDark() {
    return AnalogGaugePaint(
      internalIndicator: Colors.white,
      internalScale: Colors.black,
      externalIndicator: Colors.red,
      gaugeBody: Colors.white,
      externalScale: Colors.white,
    );
  }
}
