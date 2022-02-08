import 'dart:async';

import 'package:flutter/material.dart';

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
  int _degrees = 0;
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();

    _subscription = widget.stream.listen(
      (d) => setState(() => _degrees = d.toInt()),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final width = mq.orientation == Orientation.landscape
        ? mq.size.height - 75
        : mq.size.width - 75;

    return Column(
      children: [
        SizedBox(
          width: width,
          height: width,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              _degrees.toStringAsFixed(0),
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
    );
  }
}
