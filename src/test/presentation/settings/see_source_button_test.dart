import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:off_road_inclinometer/application/l10n/generated/l10n.dart';
import 'package:off_road_inclinometer/presentation/settings/see_source_button.dart';

import '../../util.dart';

void main() {
  group('SeeSourceListTIle', () {
    _makeWidget() {
      return wrapTestWidget(
        child: SeeSourceListTile(),
        delegate: S.delegate,
      );
    }

    testWidgets('should contain expected children', (tester) async {
      tester.runAsync(() async {
        await tester.pumpWidget(_makeWidget());

        final widgetFinder = find.byType(SeeSourceListTile);

        expect(widgetFinder, findsOneWidget);

        final iconFinder = find.byIcon(Icons.code);
        final textFinder = find.text('Source Code');

        expect(iconFinder, findsOneWidget);
        expect(textFinder, findsOneWidget);
      });
    });
  });
}
