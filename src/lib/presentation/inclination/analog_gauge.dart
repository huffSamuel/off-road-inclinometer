import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../application/application.dart';
import '../../application/gauge/analog_gauge_painter.dart';
import '../../application/gauge/analog_gauge_theme.dart';
import '../common/app_settings.dart';

class AnalogGauge extends StatefulWidget {
  final String artboardName;
  final Stream<double> stream;
  final AnalogGaugeTheme? theme;

  const AnalogGauge({
    Key? key,
    required this.artboardName,
    required this.stream,
    this.theme,
  }) : super(key: key);

  @override
  _AnalogGaugeState createState() => _AnalogGaugeState();
}

class _AnalogGaugeState extends State<AnalogGauge> {
  final painter = AnalogGaugePainter();

  Artboard? _artboard;
  SMIInput<double>? _degrees;
  StreamSubscription? _subscription;

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }

  @override
  void didUpdateWidget(covariant AnalogGauge oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updatePainter();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updatePainter();
   
  }

  void _updatePainter() {
     if (_artboard == null) {
      return;
    }

    final settings = AppSettings.of(context);

    painter.set(
      mode: settings.themeMode,
      theme: widget.theme ?? settings.style.theme!
    );

    if (painter.shouldRepaint) {
      painter.paint(_artboard!);
    }
  }

  @override
  void initState() {
    super.initState();

    painter.set(
      theme: widget.theme ?? AnalogGaugeTheme.standard,
      mode: ThemeMode.light,
    );

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

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Rive(
        artboard: _artboard!,
        useArtboardSize: false,
        fit: BoxFit.contain,
      ),
    );
  }
}
