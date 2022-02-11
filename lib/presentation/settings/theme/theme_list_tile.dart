import 'package:flutter/material.dart';

import '../../../application/application.dart';
import '../../../application/l10n/generated/l10n.dart';
import '../../../application/routes/routes.dart';

class ThemeListTile extends StatelessWidget {
  const ThemeListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(S.of(context).gaugeStyleTitle),
      onTap: () => Application.router.navigateTo(
        context,
        Routes.gaugeStyle,
      ),
    );
  }
}
