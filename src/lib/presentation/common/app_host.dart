import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app.dart';
import '../../application/app_settings.dart';
import '../../application/application.dart';
import '../../application/inclination/gauge_palette.dart';
import '../../application/ioc.dart';
import 'app_settings.dart';
import 'splash.dart';

class AppHost extends StatefulWidget {
  const AppHost({Key? key}) : super(key: key);

  @override
  State<AppHost> createState() => _AppHostState();
}

class _AppHostState extends State<AppHost> {
  bool _loaded = false;
  late SharedPreferences _prefs;
  late Settings settings;

  @override
  void initState() {
    super.initState();

    Future.wait([
      SharedPreferences.getInstance(),
      rootBundle.load('assets/gauge.riv'),
    ]).then((val) {
      configureDependencies();

      final preferences = val[0] as SharedPreferences;
      final gaugeAsset = val[1] as ByteData;

      Application.gauge = gaugeAsset;
      SystemChrome.setPreferredOrientations(DeviceOrientation.values);

      final themeModeName = preferences.getString('themeMode');
      final styleName = preferences.getString('style');
      final themeMode = themeModeName != null
          ? ThemeMode.values.byName(themeModeName)
          : ThemeMode.system;
      final style = GaugeStyle.all.singleWhere((x) => x.name == styleName,
          orElse: () => GaugeStyle.defaultAnalog);

      settings = Settings(
        themeMode: themeMode,
        style: style,
      );

      setState(() {
        _prefs = preferences;
        _loaded = true;
      });
    });
  }

  updateSettings(Settings newSettings) {
    setState(() {
      if (newSettings.themeMode != settings.themeMode) {
        _prefs.setString('themeMode', newSettings.themeMode.name);
      }
      if (newSettings.style != settings.style) {
        _prefs.setString('style', newSettings.style.name);
      }

      settings = newSettings;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded) {
      return const MaterialApp(
        home: Scaffold(body: Splash()),
      );
    }

    return AppSettings(
      child: App(),
      settings: settings,
      changeSettings: updateSettings,
    );
  }
}
