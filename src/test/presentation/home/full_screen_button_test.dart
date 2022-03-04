import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:off_road_inclinometer/presentation/home/full_screen_button.dart';

import '../../util.dart';

void main() {
  group('FullScreenButton', () {
    _makeWidget() {
      return wrapTestWidget(child: const FullScreenButton());
    }

    testWidgets(
      'should contain an icon that switches on tap',
      (tester) async {
        await tester.runAsync(() async {
          await tester.pumpWidget(_makeWidget());

          final buttonFinder = find.byType(FullScreenButton);

          expect(buttonFinder, findsOneWidget);

          final maximizeFinder = find.byIcon(Icons.fullscreen);
          final minimizeFinder = find.byIcon(Icons.fullscreen_exit);

          expect(maximizeFinder, findsOneWidget);
          expect(minimizeFinder, findsNothing);

          await tester.tap(buttonFinder);
          await tester.pump();

          expect(maximizeFinder, findsNothing);
          expect(minimizeFinder, findsOneWidget);
        });
      },
    );
  });
}
