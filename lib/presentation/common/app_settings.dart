import 'package:flutter/material.dart';

import '../../application/app_settings.dart';

class AppSettings extends InheritedWidget {
  final Settings settings;
  final Function(Settings) changeSettings;

  const AppSettings({
    Key? key,
    required Widget child,
    required this.settings,
    required this.changeSettings,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant AppSettings oldWidget) {
    return settings != oldWidget.settings;
  }

  static void update(BuildContext context, Settings value) {
    final parent = context.dependOnInheritedWidgetOfExactType<AppSettings>()!;

    parent.changeSettings(value);
  }

  static Settings of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppSettings>()!.settings;
  }
}
