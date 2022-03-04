import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:off_road_inclinometer/presentation/common/splash.dart';

import '../../util.dart';

void main() {
  group('Splash', () {
    testWidgets('Should have an asset image', (tester) async {
      await tester.pumpWidget(wrapTestWidget(child: const Splash()));

      final imageFinder = find.byType(Image);

      expect(imageFinder, findsOneWidget);
    });
  });
}
