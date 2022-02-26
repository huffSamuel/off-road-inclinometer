import 'package:flutter/material.dart';

class DialogListTile extends StatelessWidget {
  final Widget title;
  final Widget currentValue;
  final Widget Function(BuildContext) builder;

  const DialogListTile({
    Key? key,
    required this.title,
    required this.currentValue,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      trailing: currentValue,
      onTap: () {
        showDialog(context: context, builder: builder);
      },
    );
  }
}
