import 'package:flutter/material.dart';

import '../../application/application.dart';

class SetZeroButton extends StatefulWidget {
  const SetZeroButton({Key? key}) : super(key: key);

  @override
  State<SetZeroButton> createState() => _SetZeroButtonState();
}

class _SetZeroButtonState extends State<SetZeroButton> {
  bool _zeroSet = false;

  void _set() {
    if (_zeroSet) {
      setState(() {
        _zeroSet = false;
        Application.inclinometer.clearZero();
      });
    } else {
      setState(() {
        _zeroSet = true;
        Application.inclinometer.setZero();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: _zeroSet ? Colors.red : Colors.blue,
      icon: const Icon(Icons.track_changes),
      onPressed: _set,
    );
  }
}
