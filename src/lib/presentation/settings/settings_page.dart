import 'package:flutter/material.dart';

import '../../application/l10n/generated/l10n.dart';
import '../common/app_bar.dart';
import 'about_app_dialog.dart';
import 'digital_switch/digital_switch_tile.dart';
import 'theme_mode/theme_mode_list_tile.dart';
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
            onPressed: () => showDialog(
              context: context,
              builder: (context) => const AboutAppDialog(),
            ),
          ),
        ],
      ),
      body: ListView(
        children: const [
          DigitalSwitchTile(),
          ThemeListTile(),
          DarkModeTile(),
        ],
      ),
    );
  }
}
