import 'package:flutter/material.dart';
import 'package:rive_test/application/l10n/generated/l10n.dart';
import 'package:rive_test/presentation/common/app_host.dart';

class ThemeModeDialog extends StatelessWidget {
  const ThemeModeDialog({Key? key}) : super(key: key);

  void _update(ThemeMode? theme, BuildContext context) {
    if (theme == null) {
      return;
    }

    AppSettings.update(context, AppSettings.of(context).copyWith(themeMode: theme));

  }

  @override
  Widget build(BuildContext context) {

    return SimpleDialog(
      children: List.from(
        ThemeMode.values.map(
          (x) => RadioListTile<ThemeMode>(
            title: Text(S.of(context).themeMode(x)),
            value: x,
            groupValue: AppSettings.of(context).themeMode,
            onChanged: (v) => _update(v, context),
          ),
        ),
      ),
    );
  }
}
