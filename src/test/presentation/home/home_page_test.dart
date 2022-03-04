import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:off_road_inclinometer/application/app_settings.dart';
import 'package:off_road_inclinometer/application/application.dart';
import 'package:off_road_inclinometer/application/inclination/gauge_palette.dart';
import 'package:off_road_inclinometer/application/inclination/inclinometer.dart';
import 'package:off_road_inclinometer/presentation/common/app_settings.dart';
import 'package:off_road_inclinometer/presentation/home/full_screen_button.dart';
import 'package:off_road_inclinometer/presentation/home/home_page.dart';
import 'package:off_road_inclinometer/presentation/home/indicators.dart';
import 'package:off_road_inclinometer/presentation/home/set_zero_button.dart';
import 'package:off_road_inclinometer/presentation/home/settings_button.dart';

import '../../util.dart';
import 'home_page_test.mocks.dart';

@GenerateMocks([Inclinometer])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('HomePage', () {
    late Inclinometer mockInclinometer;

    setUp(() async {
      Application.gauge = await rootBundle.load('assets/gauge.riv');
      mockInclinometer = MockInclinometer();

      when(mockInclinometer.pitch).thenReturn(StreamController<double>.broadcast());
      when(mockInclinometer.roll).thenReturn(StreamController<double>.broadcast());

      GetIt.instance.registerSingleton(mockInclinometer);
    });

    _makeWidget() {
      return wrapTestWidget(
        child: AppSettings(
          settings: Settings(
            themeMode: ThemeMode.dark, 
            style: GaugeStyle.digital,
          ),
          changeSettings: (settings) {},
          child: HomePage(
            inclinometer: mockInclinometer,
          ),
        ),
      );
    }

    testWidgets('should contain indicators and 3 buttons', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(_makeWidget());

        final indicatorsFinder = find.byType(Indicators);
        final fullScreenButtonFinder = find.byType(FullScreenButton);
        final settingsButtonFinder = find.byType(SettingsButton);
        final setZeroButtonFinder = find.byType(SetZeroButton);

        expect(indicatorsFinder, findsOneWidget);
        expect(fullScreenButtonFinder, findsOneWidget);
        expect(settingsButtonFinder, findsOneWidget);
        expect(setZeroButtonFinder, findsOneWidget);
      });
    });
  });
}
