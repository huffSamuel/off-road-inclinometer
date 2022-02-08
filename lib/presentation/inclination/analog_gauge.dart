import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../application/application.dart';
import '../../application/inclination/gauge_palette.dart';

class AnalogGauge extends StatefulWidget {
  final String artboardName;
  final GaugePalette palette;
  final Stream<double> stream;

  const AnalogGauge({
    Key? key,
    required this.artboardName,
    required this.stream,
    this.palette = GaugePalette.light,
  }) : super(key: key);

  @override
  _AnalogGaugeState createState() => _AnalogGaugeState();
}

class _AnalogGaugeState extends State<AnalogGauge> {
  Artboard? _artboard;
  SMIInput<double>? _degrees;
  StreamSubscription? _subscription;

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }

  @override
  void initState() {
    super.initState();

    _subscription = widget.stream.listen(
      (d) => setState(
        () => _degrees?.change(d),
      ),
    );

    final file = RiveFile.import(Application.gauge);
    final artboard = file.artboardByName(widget.artboardName);
    var controller =
        StateMachineController.fromArtboard(artboard!, 'State Machine 1');

    if (controller != null) {
      artboard.addController(controller);
      _degrees = controller.findInput('deg');
      widget.palette.paint(artboard);
    }

    setState(() => _artboard = artboard);
  }

  @override
  Widget build(BuildContext context) {
    if (_artboard == null) {
      return const SizedBox();
    }

    final mq = MediaQuery.of(context);

    final width = mq.orientation == Orientation.landscape
        ? mq.size.height - 75
        : mq.size.width - 75;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: width,
        height: width,
        child: Rive(
          artboard: _artboard!,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
