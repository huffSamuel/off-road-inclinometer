import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/transformers.dart';

const digitalThrottle = Duration(milliseconds: 250);

class DigitalGauge extends StatefulWidget {
  final Widget title;
  final Stream<double> stream;

  const DigitalGauge({
    Key? key,
    required this.title,
    required this.stream,
  }) : super(key: key);

  @override
  State<DigitalGauge> createState() => _DigitalGaugeState();
}

class _DigitalGaugeState extends State<DigitalGauge> {
  double _degrees = 0;
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();

    _subscription = widget.stream.throttleTime(digitalThrottle).listen(
          (d) => setState(() => _degrees = d.abs()),
        );
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }

  String _degreesText() {
    if (_degrees.abs() < 10) {
      return _degrees.toStringAsFixed(1);
    }

    return _degrees.toStringAsFixed(0);
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final width = mq.orientation == Orientation.landscape
        ? (mq.size.width / 2)
        : (mq.size.height / 2) - 14;

    return SizedBox(
      height: width,
      width: width,
      child: Column(
        children: [
          Expanded(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                _degreesText(),
              ),
            ),
          ),
          DefaultTextStyle.merge(
            style: const TextStyle(
              fontSize: 24.0,
            ),
            child: widget.title,
          )
        ],
      ),
    );
  }
}
