import 'package:flutter_test/flutter_test.dart';
import 'package:native_device_orientation/native_device_orientation.dart';
import 'package:off_road_inclinometer/presentation/common/util.dart';

class Input {
  final NativeDeviceOrientation orientation;
  final bool expected;

  Input(this.orientation, this.expected);
}

void main() {
  group('isLandcape', () {
    final inputs = [
      Input(NativeDeviceOrientation.landscapeLeft, true),
      Input(NativeDeviceOrientation.landscapeRight, true),
      Input(NativeDeviceOrientation.portraitDown, false),
      Input(NativeDeviceOrientation.portraitUp, false)
    ];

    for (final input in inputs) {
      test('${input.orientation} should return ${input.expected}', () {
        final actual = isLandscape(input.orientation);

        expect(actual, equals(input.expected));
      });
    }
  });
}
