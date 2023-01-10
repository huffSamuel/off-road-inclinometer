// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Lock Orientation`
  String get lockOrientation {
    return Intl.message(
      'Lock Orientation',
      name: 'lockOrientation',
      desc: '',
      args: [],
    );
  }

  /// `Gauge Style`
  String get gaugeStyleTitle {
    return Intl.message(
      'Gauge Style',
      name: 'gaugeStyleTitle',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Pitch`
  String get pitch {
    return Intl.message(
      'Pitch',
      name: 'pitch',
      desc: '',
      args: [],
    );
  }

  /// `Roll`
  String get roll {
    return Intl.message(
      'Roll',
      name: 'roll',
      desc: '',
      args: [],
    );
  }

  /// `{gaugeStyle, select, analog {Analog} digital {Digital}}`
  String gaugeStyle(Object gaugeStyle) {
    return Intl.select(
      gaugeStyle,
      {
        'analog': 'Analog',
        'digital': 'Digital',
      },
      name: 'gaugeStyle',
      desc: '',
      args: [gaugeStyle],
    );
  }

  /// `{themeMode, select, dark {Dark} light {Light} system {System}}`
  String themeMode(Object themeMode) {
    return Intl.select(
      themeMode,
      {
        'dark': 'Dark',
        'light': 'Light',
        'system': 'System',
      },
      name: 'themeMode',
      desc: '',
      args: [themeMode],
    );
  }

  /// `Relative Inclination`
  String get relativeInclination {
    return Intl.message(
      'Relative Inclination',
      name: 'relativeInclination',
      desc: '',
      args: [],
    );
  }

  /// `Absolute Inclination`
  String get absoluteInclination {
    return Intl.message(
      'Absolute Inclination',
      name: 'absoluteInclination',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Source Code`
  String get sourceCode {
    return Intl.message(
      'Source Code',
      name: 'sourceCode',
      desc: '',
      args: [],
    );
  }

  /// `Theme Mode`
  String get themeModeTitle {
    return Intl.message(
      'Theme Mode',
      name: 'themeModeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Digital Gauge`
  String get digitalGauge {
    return Intl.message(
      'Digital Gauge',
      name: 'digitalGauge',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
