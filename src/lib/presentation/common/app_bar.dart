import 'package:flutter/material.dart';

PreferredSizeWidget makeAppBar({
  required BuildContext context,
  Widget? title,
  Widget? leading,
  List<Widget>? actions,
}) {
  return AppBar(
      title: DefaultTextStyle.merge(
        child: title ?? Container(),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: leading ?? const BackButton(),
      actions: actions);
}
