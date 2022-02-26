import 'package:native_device_orientation/native_device_orientation.dart';

bool isLandscape(NativeDeviceOrientation orientation) {
  return orientation == NativeDeviceOrientation.landscapeLeft ||
      orientation == NativeDeviceOrientation.landscapeRight;
}
