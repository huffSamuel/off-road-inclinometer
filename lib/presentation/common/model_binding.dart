import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rive_test/application/inclination/gauge_style.dart';

class Settings extends Equatable {
  final ThemeMode themeMode;
  final bool fullScreen;
  final GaugeStyle style;

  const Settings({
    required this.themeMode,
    required this.fullScreen,
    required this.style,
  });

  factory Settings.initial() {
    return const Settings(
        themeMode: ThemeMode.system,
        fullScreen: false,
        style: GaugeStyle.analog);
  }

  Settings copyWith({
    ThemeMode? themeMode,
    bool? fullScreen,
    GaugeStyle? style,
  }) {
    return Settings(
      fullScreen: fullScreen ?? this.fullScreen,
      themeMode: themeMode ?? this.themeMode,
      style: style ?? this.style,
    );
  }

  @override
  List<Object> get props => [
        themeMode,
        fullScreen,
        style,
      ];
}

String enumToString(Object obj) {
  final str = obj.toString();
  final i = str.indexOf('.') + 1;
  return str.substring(i).toUpperCase();
}
