import 'package:flutter/material.dart';

import '../../../../application/l10n/generated/l10n.dart';
import '../../common/app_settings.dart';
import '../../common/dialog_list_tile.dart';
import 'theme_mode_dialog.dart';

class DarkModeTile extends StatelessWidget {
  const DarkModeTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogListTile(
      title: Text(S.of(context).themeModeTitle),
      currentValue: Text(
        S.of(context).themeMode(
              AppSettings.of(context).themeMode,
            ),
      ),
      onTap: () => {
        showDialog(
          context: context,
          builder: (context) => const ThemeModeDialog(),
        )
      },
    );
  }
}
