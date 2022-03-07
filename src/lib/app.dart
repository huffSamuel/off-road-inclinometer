import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'application/application.dart';
import 'application/l10n/generated/l10n.dart';
import 'application/routes/routes.dart';
import 'presentation/common/app_settings.dart';
import 'presentation/home/home_page.dart';

List<LocalizationsDelegate> localizationsDelegates = [
  S.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

class App extends StatelessWidget {
  App({Key? key}) : super(key: key) {
    final router = FluroRouter();
    Routes.configureRouter(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    final appSettings = AppSettings.of(context);

    return MaterialApp(
      themeMode: appSettings.themeMode,
      darkTheme: appSettings.gaugeThemeData.theme[ThemeMode.dark],
      theme: appSettings.gaugeThemeData.theme[ThemeMode.light],
      title: Application.title,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: S.delegate.supportedLocales,
      home: const SafeArea(child: HomePage()),
      onGenerateRoute: Application.router.generator,
      debugShowCheckedModeBanner: false,
    );
  }
}
