import 'package:flutter/material.dart';

import '../../../../application/l10n/generated/l10n.dart';
import '../../../application/app_settings.dart';
import '../../../application/theme/merge_theme_data.dart';
import '../../../application/theme/gauge_theme_data_repository.dart';
import '../../../application/ioc.dart';
import '../../common/app_bar.dart';
import '../../common/app_settings.dart';
import 'indicator_preview.dart';

class GaugeStylePage extends StatefulWidget {
  final MergedThemeData themeData;
  const GaugeStylePage({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  @override
  State<GaugeStylePage> createState() => _GaugeStylePageState();
}

class _GaugeStylePageState extends State<GaugeStylePage> {
  late MergedThemeData _themeData;
  final MergedThemeRepository _themeDataRepo = ioc();

  @override
  initState() {
    super.initState();
    _themeData = widget.themeData;
  }

  _setStyle(MergedThemeData? themeData) {
    if (themeData == null) {
      return;
    }

    setState(() {
      _themeData = themeData;
    });
  }

  ThemeMode _theme(Settings appSettings, BuildContext context) {
    if (appSettings.themeMode == ThemeMode.system) {
      return MediaQuery.of(context).platformBrightness == Brightness.dark
          ? ThemeMode.dark
          : ThemeMode.light;
    }
    return appSettings.themeMode;
  }

  @override
  Widget build(BuildContext context) {
    final appSettings = AppSettings.of(context);

    final themeTiles = _themeDataRepo.getAll().map(
          (x) => RadioListTile<MergedThemeData>(
            title: Text(x.name),
            groupValue: _themeData,
            value: x,
            onChanged: _setStyle,
          ),
        );

    final scrollable =
        Expanded(child: ListView(children: List.from(themeTiles)));

    return Theme(
      data: _themeData.theme[_theme(appSettings, context)]!,
      child: WillPopScope(
        onWillPop: () {
          AppSettings.update(
            context,
            appSettings.copyWith(
              gaugeThemeData: _themeData,
              style: _themeData.name,
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
          body: Column(
            children: [
              IndicatorPreview(theme: _themeData),
              const Divider(thickness: 2),
              scrollable,
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
