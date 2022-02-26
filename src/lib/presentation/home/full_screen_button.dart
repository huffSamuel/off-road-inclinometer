import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FullScreenButton extends StatefulWidget {
  const FullScreenButton({Key? key}) : super(key: key);

  @override
  State<FullScreenButton> createState() => _FullScreenButtonState();
}

class _FullScreenButtonState extends State<FullScreenButton> {
  bool _fullScreen = false;

  setFullScreen(bool value) {
    final uiMode =
        value ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge;
    SystemChrome.setEnabledSystemUIMode(uiMode);

    setState(() => _fullScreen = value);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          _fullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
        ),
        onPressed: () => setFullScreen(!_fullScreen));
  }
}
