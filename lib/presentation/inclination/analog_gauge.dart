import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../application/application.dart';
import '../../application/inclination/gauge_palette.dart';
import '../common/app_settings.dart';

class AnalogGauge extends StatefulWidget {
  final String artboardName;
  final Stream<double> stream;

  const AnalogGauge({
    Key? key,
    required this.artboardName,
    required this.stream,
  }) : super(key: key);

  @override
  _AnalogGaugeState createState() => _AnalogGaugeState();
}

class _AnalogGaugeState extends State<AnalogGauge> {
  final painter = AnalogGaugePainter()
    ..themeData = AnalogGaugeTheme.standard
    ..themeMode = ThemeMode.light;

  Artboard? _artboard;
  SMIInput<double>? _degrees;
  StreamSubscription? _subscription;

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_artboard == null) {
      return;
    }

    final settings = AppSettings.of(context);
    painter.themeMode = settings.themeMode;

    if (painter.shouldRepaint) {
      painter.paint(_artboard!);
    }
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
        ? mq.size.height - 40
        : mq.size.width - 55;

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
