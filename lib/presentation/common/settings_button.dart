import 'package:flutter/material.dart';

import '../../application/application.dart';
import '../../application/routes/routes.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Application.router.navigateTo(context, Routes.settings),
      icon: const Icon(Icons.settings),
    );
  }
}
