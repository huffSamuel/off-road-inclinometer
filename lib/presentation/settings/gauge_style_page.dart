import 'package:flutter/material.dart';

import '../../application/inclination/gauge_style.dart';
import '../../application/l10n/generated/l10n.dart';
import '../common/app_bar.dart';
import '../common/app_host.dart';
import '../inclination/gauge_builder.dart';

class GaugeStylePage extends StatefulWidget {
  const GaugeStylePage({Key? key}) : super(key: key);

  @override
  State<GaugeStylePage> createState() => _GaugeStylePageState();
}

class IndicatorPreview extends StatelessWidget {
  final GaugeStyle style;
  const IndicatorPreview({Key? key, required this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RollGauge(
          style: style,
        ),
      ],
    );
  }
}

class _GaugeStylePageState extends State<GaugeStylePage> {
  late GaugeStyle gaugeStyle;

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    gaugeStyle = AppSettings.of(context).style;
  }

  setStyle(GaugeStyle? style) {
    if (style == null) {
      return;
    }

    setState(() => gaugeStyle = style);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        AppSettings.update(
            context, AppSettings.of(context).copyWith(style: gaugeStyle));
        return Future.value(true);
      },
      child: Scaffold(
        appBar: makeAppBar(
          context: context,
          title: Text(
            S.of(context).gaugeStyleTitle,
          ),
        ),
        body: Scrollbar(
          child: ListView(
            children: [
              IndicatorPreview(style: gaugeStyle),
              const Divider(thickness: 2),
              ...[GaugeStyle.analog, GaugeStyle.digital].map(
                (x) => RadioListTile<GaugeStyle>(
                  title: Text(S.of(context).gaugeStyle(x)),
                  groupValue: gaugeStyle,
                  value: x,
                  onChanged: setStyle,
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}

class GaugeStyleSelectList extends StatelessWidget {
  const GaugeStyleSelectList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return RadioListTile(
        groupValue: 0,
        value: index,
        onChanged: (int? value) {},
      );
    });
  }
}
