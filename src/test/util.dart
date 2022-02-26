import 'package:flutter/material.dart';

Widget wrapTestWidget(Widget child) {
  return MaterialApp(
    home: Scaffold(
      body: child,
    ),
  );
}
