import 'package:flutter/material.dart';

import 'merge_theme_data.dart';
import 'util.dart';

class AppThemeData {
  final Color? primary;
  final Color? background;

  AppThemeData({
    this.primary,
    this.background,
  });

  ThemeData mergeWith(ThemeData theme) {
    return theme.copyWith(
      scaffoldBackgroundColor: background,
      primaryColorLight: primary,
      primaryColorDark: primary,
      textTheme: theme.textTheme.apply(
        bodyColor: primary,
        displayColor: primary,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: primary
        )
      ),
      toggleableActiveColor: primary,
      iconTheme: theme.iconTheme.copyWith(color: primary),
      appBarTheme: kAppBarTheme.copyWith(
        foregroundColor: primary,
      ),
    );
  }

  factory AppThemeData.fromJson(Map<String, dynamic> json) {
    return AppThemeData(
      primary: JsonColor.maybeFromString(json['primary']),
    );
  }
}
