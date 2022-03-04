import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:off_road_inclinometer/application/application.dart';
import 'package:off_road_inclinometer/application/routes/routes.dart';
import 'package:off_road_inclinometer/presentation/home/settings_button.dart';

import '../../util.dart';
import 'settings_button_test.mocks.dart';

@GenerateMocks([FluroRouter])
void main() {
  group('SettingsButton', () {
    late MockFluroRouter mockRouter;

    setUp(() {
      mockRouter = MockFluroRouter();
      
      when(mockRouter.navigateTo(any, any)).thenAnswer((realInvocation) => Future.value(null),);

      Application.router = mockRouter;
    });

    _makeWidget() {
      return wrapTestWidget(child: const SettingsButton());
    }

    testWidgets('should contain a settings icon', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(_makeWidget());

        final buttonFinder = find.byType(SettingsButton);

        expect(buttonFinder, findsOneWidget);

        final iconFinder = find.byIcon(Icons.settings);

        expect(iconFinder, findsOneWidget);
      });
    });

    testWidgets('should navigate to settings route when tapped', (tester) async {
      await tester.pumpWidget(_makeWidget());

      final buttonFinder = find.byType(SettingsButton);

      await tester.tap(buttonFinder);

      verify(mockRouter.navigateTo(any, Routes.settings));
    });
  });
}