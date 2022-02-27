import 'package:flutter/material.dart';
import 'package:off_road_inclinometer/application/l10n/generated/l10n.dart';

Widget wrapTestWidget(Widget child) {
  return Material(
    child: Localizations(
      delegates: const [
        S.delegate,
      ],
      locale: const Locale('en'),
      child: Scaffold(body: child),
    ),
  );
}

class TestLocalizationsDelegate extends AppLocalizationDelegate {
  final S s;

  TestLocalizationsDelegate(this.s);

  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  Future<S> load(Locale locale) {
    return Future.value(s);
  }

  @override
  bool shouldReload(covariant AppLocalizationDelegate old) {
    return false;
  }

  @override
  List<Locale> get supportedLocales => [const Locale('en')];
}
