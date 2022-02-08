import 'package:flutter/material.dart';
import 'package:rive_test/presentation/common/app_host.dart';

class FullScreenButton extends StatelessWidget {
  const FullScreenButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = AppSettings.of(context);

    return IconButton(
      icon: Icon(
        settings.fullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
      ),
      onPressed: () => AppSettings.update(
        context,
        settings.copyWith(
          fullScreen: !settings.fullScreen,
        ),
      ),
    );
  }
}
