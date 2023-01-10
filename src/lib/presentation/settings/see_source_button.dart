import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../application/application.dart';
import '../../application/l10n/generated/l10n.dart';

class SeeSourceListTile extends StatelessWidget {
  const SeeSourceListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.code),
      title: Text(S.of(context).sourceCode),
      onTap: () async {
        if (await canLaunchUrl(Application.url)) {
          launchUrl(Application.url);
        }
      },
    );
  }
}
