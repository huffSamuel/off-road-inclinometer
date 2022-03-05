import 'package:flutter/material.dart';
import 'package:rive/components.dart';
import 'package:rive/rive.dart';

import 'analog_gauge_theme.dart';

class AnalogGaugePainter {
  AnalogGaugeTheme? _themeData;

  get shouldRepaint => _shouldRepaint;

  bool _shouldRepaint = false;
  ThemeMode? _themeMode;

  void set({
    required AnalogGaugeTheme theme,
    required ThemeMode mode,
  }) {
    print('Set ${theme.name}');

    _shouldRepaint = theme != _themeData || mode != _themeMode;

    _themeData = theme;
    _themeMode = mode;
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
    if (_themeData == null) {
      return;
    }

    print('Paint: ${_themeData?.name}');

    scaleGroupNames
        .map((x) => tryGetChild(artboard, x))
        .where((x) => x != null)
        .forEach(
            (x) => paintShape(x, _themeData!.data(_themeMode!).scaleColor));
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
