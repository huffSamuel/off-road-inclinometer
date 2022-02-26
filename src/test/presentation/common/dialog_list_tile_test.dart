import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:off_road_inclinometer/presentation/common/dialog_list_tile.dart';

void main() {
  const title = 'title';
  const value = 'value';
  const dialog = 'dialog';
  const key = ValueKey('key');

  _makeWidget() {
    return MaterialApp(
      home: Scaffold(
        body: DialogListTile(
          key: key,
          title: const Text(title),
          currentValue: const Text(value),
          builder: (context) => const SimpleDialog(children: [Text(dialog)]),
        ),
      ),
    );
  }

  group('DialogListTile', () {
    testWidgets('should have a title and value', (tester) async {
      await tester.pumpWidget(_makeWidget());

      final titleFinder = find.text(title);
      final valueFinder = find.text(value);

      expect(titleFinder, findsOneWidget);
      expect(valueFinder, findsOneWidget);
    });

    testWidgets('should open a dialog when tapped', (tester) async {
      await tester.pumpWidget(_makeWidget());
      await tester.tap(find.byKey(key));
      await tester.pumpAndSettle();

      final dialogFinder = find.byType(SimpleDialog);
      final contentFinder = find.text(dialog);

      expect(dialogFinder, findsOneWidget);
      expect(contentFinder, findsOneWidget);
    });
  });
}
