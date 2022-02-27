import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:off_road_inclinometer/application/inclination/inclinometer.dart';
import 'package:off_road_inclinometer/application/l10n/generated/l10n.dart';
import 'package:off_road_inclinometer/presentation/home/set_zero_button.dart';

import '../../util.dart';
import 'set_zero_button_test.mocks.dart';

@GenerateMocks([Inclinometer, S])
void main() {
  group('SetZeroButton', () {
    late Inclinometer mockInclinometer;
    late MockS mockS;

    _makeWidget() {
      return wrapTestWidget(
        SetZeroButton(
          inclinometer: mockInclinometer,
        ),
      );
    }

    setUp(() {
      mockInclinometer = MockInclinometer();
      mockS = MockS();

      when(mockS.absoluteInclination).thenReturn('absolute');
      when(mockS.relativeInclination).thenReturn('relative');
    });

    testWidgets(
      'should contain an icon that should switch on tap',
      (tester) async {
        tester.runAsync(() async {
          await tester.pumpWidget(_makeWidget());

          final personIconFinder = find.byIcon(Icons.person);
          final languageIconFinder = find.byIcon(Icons.language);

          expect(personIconFinder, findsOneWidget);
          expect(languageIconFinder, findsNothing);

          await tester.tap(find.byType(SetZeroButton));
          await tester.pumpAndSettle();

          expect(languageIconFinder, findsNothing);
          expect(personIconFinder, findsOneWidget);
        });
      },
    );

    testWidgets('should clear and set zero on tap', (tester) async {
      tester.runAsync(() async {
        await tester.pumpWidget(_makeWidget());

        final buttonFinder = find.byType(SetZeroButton);

        verifyZeroInteractions(mockInclinometer);

        await tester.tap(buttonFinder);
        await tester.pump();
        await tester.tap(buttonFinder);
        await tester.pump();

        verifyInOrder([
          mockInclinometer.setZero(),
          mockInclinometer.clearZero()
        ]);

      });
    });
  });
}
