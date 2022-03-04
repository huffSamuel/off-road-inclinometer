import 'package:flutter_test/flutter_test.dart';
import 'package:off_road_inclinometer/domain/buffer.dart';

class _AverageTestInput {
  final List<int> numbers;
  final double expected;

  _AverageTestInput(this.numbers, this.expected);
}

void main() {
  group('Buffer', () {
    late Buffer buffer;

    setUp(() {
      buffer = Buffer(5);
    });


    final averageTests = [
      _AverageTestInput([1], 1),
      _AverageTestInput([1,1,1,1,1], 1),
      _AverageTestInput([1,2,2,2,2,2,2], 2),
      _AverageTestInput([2, 4, 2, 4], 3),
    ];

    for(final _avgTest in averageTests) {
      test('average of ${_avgTest.numbers} is ${_avgTest.expected}', () {
        for(final n in _avgTest.numbers) {
          buffer.add(n);
        }

        expect(buffer.average, equals(_avgTest.expected));
      });
    }
  });
}