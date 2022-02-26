import 'package:fluro/fluro.dart';

import 'route_handlers.dart';

class Routes {
  static String home = '/';
  static String settings = '/settings';
  static String gaugeStyle = '/settings/gauge-style';

  static void configureRouter(FluroRouter router) {
    router
      ..define(home, handler: homeHandler)
      ..define(settings, handler: settingsHandler)
      ..define(gaugeStyle, handler: gaugeStyleHandler);
  }
}
