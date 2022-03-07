import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'gauge/app_theme.dart';

class Settings extends Equatable {
  final ThemeMode themeMode;
  final String style;
  final bool digital;
  final GaugeThemeData gaugeThemeData;

  const Settings({
    required this.themeMode,
    required this.style,
    required this.digital,
    required this.gaugeThemeData,
  });

  factory Settings.initial() {
    return Settings(
      themeMode: ThemeMode.system,
      style: GaugeThemeData.fallback().name,
      digital: false,
      gaugeThemeData: GaugeThemeData.fallback(),
    );
  }

  Settings copyWith({
    ThemeMode? themeMode,
    String? style,
    bool? digital,
    GaugeThemeData? gaugeThemeData,
  }) {
    return Settings(
      themeMode: themeMode ?? this.themeMode,
      style: style ?? this.style,
      digital: digital ?? this.digital,
      gaugeThemeData: gaugeThemeData ?? this.gaugeThemeData,
    );
  }

  @override
  List<Object> get props => [
        themeMode,
        style,
        gaugeThemeData,
        digital
      ];
}
