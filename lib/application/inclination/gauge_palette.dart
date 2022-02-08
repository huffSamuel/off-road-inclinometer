import 'package:flutter/material.dart';
import 'package:rive/components.dart';
import 'package:rive/rive.dart';

class GaugePalette {
  final Color indicator;
  final String name;

  const GaugePalette({required this.indicator, required this.name});

  static const dark = GaugePalette(indicator: Colors.white, name: 'Dark');
  static const light = GaugePalette(indicator: Colors.black, name: 'Light');

  paint(Artboard artboard) {
    final scales = ['External Scale', 'Left Scale', 'Right Scale']
        .map((x) => artboard.component<Node>(x));

    for (final scale in scales) {
      if (scale != null) {
        _paint(scale, indicator);
      }
    }
  }

  _paint(Node node, Color color) {
    for (final child in node.children) {
      if (child is Shape) {
        child.fills.first.paint.color = color;
      } else if (child is Node) {
        _paint(child, color);
      }
    }
  }
}
