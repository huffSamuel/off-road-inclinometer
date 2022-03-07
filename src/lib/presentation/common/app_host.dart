import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app.dart';
import '../../application/app_settings.dart';
import '../../application/application.dart';
import '../../application/gauge/app_theme.dart';
import '../../application/gauge/gauge_theme_data_repository.dart';
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
  late GaugeThemeDataRepository _rep;

  @override
  void initState() {
    super.initState();

    configureDependencies();
    _rep = ioc();

    Future.wait([
      SharedPreferences.getInstance(),
      rootBundle.load('assets/gauge.riv'),
      _rep.init(),
    ]).then((val) {

      final preferences = val[0] as SharedPreferences;
      final gaugeAsset = val[1] as ByteData;

      Application.gauge = gaugeAsset;
      SystemChrome.setPreferredOrientations(DeviceOrientation.values);

      final themeModeName = preferences.getString('themeMode');
      String? stylePreference = preferences.getString('style');

      if(!_rep.has(stylePreference)) {
        stylePreference = GaugeThemeData.fallback().name;
        preferences.setString('style', stylePreference);
      }

      final themeMode = themeModeName != null
          ? ThemeMode.values.byName(themeModeName)
          : ThemeMode.system;

      settings = Settings(
        themeMode: themeMode,
        style: stylePreference!,
        digital: false,
        gaugeThemeData: _rep.get(stylePreference),
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
        _prefs.setString('style', newSettings.style);
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
