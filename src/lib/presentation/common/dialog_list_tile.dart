import 'package:flutter/material.dart';

class DialogListTile extends StatelessWidget {
  final Widget title;
  final Widget currentValue;
  final VoidCallback onTap;

  const DialogListTile({
    Key? key,
    required this.title,
    required this.currentValue,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      trailing: currentValue,
      onTap: onTap,
    );
  }
}
