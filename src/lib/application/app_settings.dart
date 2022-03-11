import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme/merge_theme_data.dart';

class Settings extends Equatable {
  final ThemeMode themeMode;
  final String style;
  final bool digital;
  final MergedThemeData gaugeThemeData;

  const Settings({
    required this.themeMode,
    required this.style,
    required this.digital,
    required this.gaugeThemeData,
  });

  factory Settings.initial() {
    return Settings(
      themeMode: ThemeMode.system,
      style: MergedThemeData.fallback().name,
      digital: false,
      gaugeThemeData: MergedThemeData.fallback(),
    );
  }

  Settings copyWith({
    ThemeMode? themeMode,
    String? style,
    bool? digital,
    MergedThemeData? gaugeThemeData,
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
