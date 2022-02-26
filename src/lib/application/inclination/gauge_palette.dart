import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rive/components.dart';
import 'package:rive/rive.dart';

class AnalogGaugeThemeData {
  final Color scaleColor;
  final String name;

  const AnalogGaugeThemeData({required this.scaleColor, required this.name});

  static const dark = AnalogGaugeThemeData(
    name: 'Dark',
    scaleColor: Colors.white,
  );
  static const light = AnalogGaugeThemeData(
    name: 'Light',
    scaleColor: Colors.black,
  );
}

class AnalogGaugeTheme {
  final String name;
  final AnalogGaugeThemeData? light;
  final AnalogGaugeThemeData? dark;

  data(ThemeMode mode) {
    return mode == ThemeMode.dark ? dark : light;
  }

  AnalogGaugeTheme(this.name, {this.light, this.dark});

  static List<AnalogGaugeTheme> all = [
    standard,
  ];

  static AnalogGaugeTheme standard = AnalogGaugeTheme(
    'Default Analog',
    light: AnalogGaugeThemeData.light,
    dark: AnalogGaugeThemeData.dark,
  );
}

class GaugeStyle extends Equatable {
  final String name;
  final AnalogGaugeTheme? theme;

  const GaugeStyle(this.name, {this.theme});

  static GaugeStyle digital = const GaugeStyle('Digital');
  static GaugeStyle defaultAnalog =
      GaugeStyle('Default Analog', theme: AnalogGaugeTheme.standard);

  static List<GaugeStyle> all = [
    digital,
    ...AnalogGaugeTheme.all.map((x) => GaugeStyle.analog(x.name, x)),
  ];

  factory GaugeStyle.analog(String name, AnalogGaugeTheme theme) {
    return GaugeStyle(name, theme: theme);
  }

  @override
  List<Object?> get props => [name];
}

class AnalogGaugePainter {
  AnalogGaugeTheme? themeData;

  get shouldRepaint => _shouldRepaint;

  bool _shouldRepaint = false;
  ThemeMode? _themeMode;

  set themeMode(ThemeMode themeMode) {
    _shouldRepaint = themeMode != _themeMode;
    _themeMode = themeMode;
  }

  final scaleGroupNames = ['External Scale', 'Left Scale ', 'Right Scale'];

  Shape? tryGetChild(Artboard artboard, String childName) {
    try {
      return artboard
          .component<Node>('Root')
          ?.children
          .singleWhere((x) => x.name == childName) as Shape?;
    } catch (err) {
      return null;
    }
  }

  Shape? getExternalScale(Artboard artboard) {
    return tryGetChild(artboard, 'External Scale');
  }

  Shape? getLeftScale(Artboard artboard) {
    return tryGetChild(artboard, 'Left Scale ');
  }

  Shape? getRightScale(Artboard artboard) {
    return tryGetChild(artboard, 'Right Scale');
  }

  void paint(Artboard artboard) {
    if (themeData == null) {
      return;
    }

    scaleGroupNames
        .map((x) => tryGetChild(artboard, x))
        .where((x) => x != null)
        .forEach((x) => paintShape(x, themeData!.data(_themeMode!).scaleColor));
  }

  void paintNode(
    Node? node,
    Color color,
  ) {
    if (node == null) {
      return;
    }
  }

  void paintShape(
    Shape? shape,
    Color color,
  ) {
    if (shape == null) {
      return;
    }

    shape.fills.first.paint.color = color;
  }
}
