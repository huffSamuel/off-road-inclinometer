import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'see_source_button.dart';

class AboutAppDialog extends StatefulWidget {
  const AboutAppDialog({Key? key}) : super(key: key);

  @override
  State<AboutAppDialog> createState() => _AboutAppDialogState();
}

class _AboutAppDialogState extends State<AboutAppDialog> {
  String? _version;
  String? _name;

  @override
  void initState() {
    PackageInfo.fromPlatform().then((info) {
      setState(() {
        _version = info.version;
        _name = info.appName;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AboutDialog(
      applicationVersion: _version,
      applicationName: _name,
      applicationIcon: Image.asset(
        'assets/icon/icon.png',
        width: 64,
        height: 64,
      ),
      children: const [SeeSourceListTile()],
    );
  }
}
