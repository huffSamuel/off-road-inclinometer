import 'package:flutter/material.dart';

import '../../application/application.dart';
import '../../application/l10n/generated/l10n.dart';
import '../common/app_bar.dart';
import 'gauge_style/gauge_style_list_tile.dart';
import 'theme/theme_list_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: makeAppBar(
        context: context,
        title: Text(
          S.of(context).settings,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline_rounded),
            onPressed: () => showAboutDialog(
                context: context,
                applicationName: Application.title,
                applicationVersion: Application.version),
          ),
        ],
      ),
      body: ListView(
        children: const [
          ThemeListTile(),
          GaugeStyleListTile(),
        ],
      ),
    );
  }
}
