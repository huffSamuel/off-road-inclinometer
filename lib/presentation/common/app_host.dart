import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive_test/presentation/common/model_binding.dart';

import '../../app.dart';

class AppHost extends StatefulWidget {
  const AppHost({Key? key}) : super(key: key);

  @override
  State<AppHost> createState() => _AppHostState();
}

class _AppHostState extends State<AppHost> {
  late Settings settings = Settings.initial();

  @override
  void initState() {
    super.initState();
  }

  updateSettings(Settings newSettings) {
    setState(() {
      if (newSettings.fullScreen != settings.fullScreen) {
        if (newSettings.fullScreen) {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
        } else {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        }
      }

      settings = newSettings;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppSettings(
      child: App(),
      settings: settings,
      changeSettings: updateSettings,
    );
  }
}

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
