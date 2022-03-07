import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import 'app_theme.dart';

@Singleton()
class GaugeThemeDataRepository {
  final List<GaugeThemeData> _themes = [
    GaugeThemeData.fallback(),
  ];

  Future<void> init() async {
    final data = await rootBundle.loadString('assets/themes.json');
    final themes = json.decode(data) as List;

    _themes.addAll(themes.map((x) => GaugeThemeData.fromJson(x)));
  }

  has(String? name) => _themes.any((x) => x.name == name);

  get(String name) => _themes.singleWhere((x) => x.name == name);

  getAll() => _themes;
}
