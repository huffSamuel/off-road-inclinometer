import 'package:flutter/material.dart';

import '../../../../application/l10n/generated/l10n.dart';
import '../../common/app_settings.dart';
import '../../common/dialog_list_tile.dart';
import '../theme/theme_mode_dialog.dart';

class GaugeStyleListTile extends StatelessWidget {
  const GaugeStyleListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogListTile(
      title: Text(S.of(context).theme),
      currentValue:
          Text(S.of(context).themeMode(AppSettings.of(context).themeMode)),
      onTap: () => {
        showDialog(
          context: context,
          builder: (context) => const ThemeModeDialog(),
        )
      },
    );
  }
}
