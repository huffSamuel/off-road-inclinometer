import 'package:flutter/material.dart';

import '../../../../application/l10n/generated/l10n.dart';
import '../../../application/gauge/gauge_style.dart';
import '../../common/app_bar.dart';
import '../../common/app_settings.dart';
import 'indicator_preview.dart';

class GaugeStylePage extends StatefulWidget {
  final GaugeStyle style;
  const GaugeStylePage({
    Key? key,
    required this.style,
  }) : super(key: key);

  @override
  State<GaugeStylePage> createState() => _GaugeStylePageState();
}

class _GaugeStylePageState extends State<GaugeStylePage> {
  late GaugeStyle _gaugeStyle;

  @override
  initState() {
    super.initState();
    _gaugeStyle = widget.style;
  }

  _setStyle(GaugeStyle? style) {
    if (style == null) {
      return;
    }

    setState(() {
      _gaugeStyle = style;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        AppSettings.update(
          context,
          AppSettings.of(context).copyWith(
            style: _gaugeStyle,
          ),
        );
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
              IndicatorPreview(style: _gaugeStyle),
              const Divider(thickness: 2),
              ...GaugeStyle.all.map(
                (x) => RadioListTile<GaugeStyle>(
                  title: Text(x.name),
                  groupValue: _gaugeStyle,
                  value: x,
                  onChanged: _setStyle,
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
