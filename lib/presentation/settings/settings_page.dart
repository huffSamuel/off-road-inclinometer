import 'package:flutter/material.dart';

import '../../application/application.dart';
import '../../application/l10n/generated/l10n.dart';
import '../../application/routes/routes.dart';
import '../common/app_bar.dart';
import '../common/dialog_list_tile.dart';
import 'theme/theme_mode_dialog.dart';

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
          ]),
      body: ListView(
        children: [
          ListTile(
            title: Text(S.of(context).gaugeStyleTitle),
            onTap: () => Application.router.navigateTo(
              context,
              Routes.gaugeStyle,
            ),
          ),
          DialogListTile(
            title: Text('Theme'),
            currentValue: Text('System Default'),
            onTap: () => {
              showDialog(
                context: context,
                builder: (context) => ThemeModeDialog(),
              ),
            },
          ),
        ],
      ),
    );
  }
}
