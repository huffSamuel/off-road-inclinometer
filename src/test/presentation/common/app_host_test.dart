import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:off_road_inclinometer/presentation/common/app_host.dart';

import '../../util.dart';

void main() {
  group('AppHost', () {
    Widget _makeWidget() {
        return wrapTestWidget(
          child: AppHost(),
        );
    }
  });
}