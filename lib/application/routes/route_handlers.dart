import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import '../../presentation/common/home_page.dart';
import '../../presentation/settings/gauge_style_page.dart';
import '../../presentation/settings/settings_page.dart';

var homeHandler = Handler(handlerFunc: (context, params) {
  return const SafeArea(child: HomePage());
});

var settingsHandler = Handler(handlerFunc: (context, params) {
  return const SafeArea(child: SettingsPage());
});

var gaugeStyleHandler = Handler(handlerFunc: (context, params) {
  return const SafeArea(child: GaugeStylePage());
});
