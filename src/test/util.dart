import 'package:flutter/material.dart';
import 'package:off_road_inclinometer/application/l10n/generated/l10n.dart';

Widget wrapTestWidget({
  required Widget child,
  LocalizationsDelegate? delegate,
}) {
  Widget effectiveChild;
  if (delegate != null) {
    effectiveChild = Localizations(
      delegates: [delegate],
      locale: const Locale('en'),
      child: Scaffold(body: child),
    );
  } else {
    effectiveChild = Scaffold(body: child);
  }

  return MaterialApp(home: effectiveChild);
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
