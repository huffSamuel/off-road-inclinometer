import 'package:flutter/material.dart';

extension HexString on String {
  int getHexValue() => int.parse(replaceAll('#', '0xff'));
}

extension JsonColor on Color {
  static Color? maybeFromString(String? str) {
    if (str == null) {
      return null;
    }

    return Color(str.getHexValue());
  }
}
