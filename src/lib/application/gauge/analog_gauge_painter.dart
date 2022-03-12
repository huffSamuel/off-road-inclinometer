import 'package:flutter/material.dart';
import 'package:rive/components.dart';
import 'package:rive/rive.dart';

import '../theme/analog_gauge_theme.dart';

class AnalogGaugePainter {
  final scaleGroupNames = ['External Scale', 'Left Scale ', 'Right Scale'];

  T? tryGetChild<T>(Artboard artboard, String childName) {
    try {
      return artboard
          .component<Node>('Root')
          ?.children
          .singleWhere((x) => x.name == childName) as T?;
    } catch (err) {
      return null;
    }
  }

  List<Shape?> _getExternalScale(Artboard artboard) {
    return ['External Scale', 'Left Scale ', 'Right Scale']
        .map((x) => tryGetChild<Shape>(artboard, x))
        .where((x) => x != null)
        .toList();
  }

  List<Shape?> _getExternalIndicator(Artboard artboard) {
    return tryGetChild<Node>(artboard, 'External Indicator')
            ?.children
            .whereType<Shape>()
            .toList() ??
        [];
  }

  List<Shape?> _getInternalIndicator(Artboard artboard) {
    return tryGetChild<Node>(artboard, 'Internal Indicator')
            ?.children
            .whereType<Shape>()
            .toList() ??
        [];
  }

  void repaint(Artboard artboard, AnalogGaugePaint paint) {
    final internalIndicator = _getInternalIndicator(artboard);
    final externalScale = _getExternalScale(artboard);

    if (paint.externalScale != null) {
      for (final s in externalScale) {
        paintShape(s, paint.externalScale!);
      }
    }

    if (paint.internalIndicator != null) {
      for (final s in internalIndicator) {
        paintShape(s, paint.internalIndicator!);
      }
    }

    if (paint.externalIndicator != null) {
      for (final s in _getExternalIndicator(artboard)) {
        paintShape(s, paint.externalIndicator!);
      }
    }
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
