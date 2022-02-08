import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'application/application.dart';
import 'application/l10n/generated/l10n.dart';
import 'application/routes/routes.dart';
import 'presentation/common/app_host.dart';
import 'presentation/common/home_page.dart';

List<LocalizationsDelegate> localizationsDelegates = [
  S.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

class App extends StatefulWidget {
  App({Key? key}) : super(key: key) {
    final router = FluroRouter();
    Routes.configureRouter(router);
    Application.router = router;
  }

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool _loaded = false;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations(DeviceOrientation.values);

    Application.inclinometer.init();

    rootBundle.load('assets/gauge.riv').then((data) {
      Application.gauge = data;
      setState(() => _loaded = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded) {
      return const MaterialApp(
        title: Application.title,
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    return MaterialApp(
      themeMode: AppSettings.of(context).themeMode,
      darkTheme: darkTheme,
      theme: lightTheme,
      title: Application.title,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: S.delegate.supportedLocales,
      home: const SafeArea(child: HomePage()),
      onGenerateRoute: Application.router.generator,
      debugShowCheckedModeBanner: false,
    );
  }
}

ThemeData darkTheme = ThemeData.dark().copyWith(
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    color: Colors.transparent,
    shadowColor: Colors.transparent,
    elevation: 0.0,
  ),
);
ThemeData lightTheme = ThemeData.light().copyWith(
  iconTheme: IconThemeData(color: Colors.black),
  appBarTheme: AppBarTheme(
    color: Colors.transparent,
    shadowColor: Colors.transparent,
    elevation: 0.0,
  ),
);
