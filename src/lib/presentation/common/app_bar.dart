import 'package:flutter/material.dart';

PreferredSizeWidget makeAppBar({
  required BuildContext context,
  Widget? title,
  Widget? leading,
  List<Widget>? actions,
}) {
  final mode = Theme.of(context).brightness;
  final color = mode == Brightness.light ? Colors.black : Colors.white;
  final textStyle = TextStyle(color: color);
  final iconThemeData = IconThemeData(color: color);

  return AppBar(
    title: DefaultTextStyle.merge(
      child: title ?? Container(),
      style: textStyle,
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconTheme.merge(
        child: leading ?? const BackButton(), data: iconThemeData),
    actions: actions != null
        ? List.from(
            actions.map(
              (x) => IconTheme.merge(child: x, data: iconThemeData),
            ),
          )
        : [],
  );
}

const TextStyle light = TextStyle(color: Colors.black);

const TextStyle dark = TextStyle(color: Colors.white);
