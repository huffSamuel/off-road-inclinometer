import 'package:flutter/material.dart';

import '../../../application/l10n/generated/l10n.dart';
import '../../common/app_settings.dart';

class DigitalSwitchTile extends StatefulWidget {
  const DigitalSwitchTile({Key? key}) : super(key: key);

  @override
  State<DigitalSwitchTile> createState() => _DigitalSwitchTileState();
}

class _DigitalSwitchTileState extends State<DigitalSwitchTile> {
  late bool _value;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final appSettings = AppSettings.of(context);

    setState(() {
      _value = appSettings.digital;
    });
  }

  void _update(bool value) {
    AppSettings.update(
      context,
      AppSettings.of(context).copyWith(digital: value),
    );
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(S.of(context).digitalGauge),
      value: _value,
      onChanged: _update,
    );
  }
}
