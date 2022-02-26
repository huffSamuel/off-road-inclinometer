import 'package:flutter/material.dart';

import '../../application/inclination/inclinometer.dart';
import '../../application/ioc.dart';
import '../../application/l10n/generated/l10n.dart';

class SetZeroButton extends StatefulWidget {
  const SetZeroButton({Key? key}) : super(key: key);

  @override
  State<SetZeroButton> createState() => _SetZeroButtonState();
}

class _SetZeroButtonState extends State<SetZeroButton> {
  final Inclinometer _inclinometer = ioc();

  bool _zeroSet = false;

  void _set() {
    final s = S.of(context);

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        width: 300,
        content: Text(
          _zeroSet ? s.absoluteInclination : s.relativeInclination,
        ),
      ),
    );

    if (_zeroSet) {
      setState(() {
        _zeroSet = false;
        _inclinometer.clearZero();
      });
    } else {
      setState(() {
        _zeroSet = true;
        _inclinometer.setZero();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: _zeroSet ? const Icon(Icons.person) : const Icon(Icons.language),
      onPressed: _set,
    );
  }
}
