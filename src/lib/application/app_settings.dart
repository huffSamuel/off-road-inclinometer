import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'inclination/gauge_palette.dart';

class Settings extends Equatable {
  final ThemeMode themeMode;
  final GaugeStyle style;
  

  const Settings({
    required this.themeMode,
    required this.style,
  });

  factory Settings.initial() {
    return Settings(
      themeMode: ThemeMode.system,
      style: GaugeStyle.defaultAnalog,
    );
  }

  Settings copyWith({
    ThemeMode? themeMode,
    bool? fullScreen,
    GaugeStyle? style,
  }) {
    return Settings(
      themeMode: themeMode ?? this.themeMode,
      style: style ?? this.style,
    );
  }

  @override
  List<Object> get props => [
        themeMode,
        style,
      ];
}
