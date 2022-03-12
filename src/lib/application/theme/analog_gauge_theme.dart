import 'package:flutter/material.dart';
import 'package:off_road_inclinometer/application/theme/util.dart';

class AnalogGaugePaint {
  AnalogGaugePaint({
    required this.internalIndicator,
    required this.internalScale,
    required this.externalIndicator,
    required this.gaugeBody,
    required this.externalScale,
  });

  final Color? internalIndicator;
  final Color? internalScale;
  final Color? externalIndicator;
  final Color? gaugeBody;
  final Color? externalScale;

  factory AnalogGaugePaint.fromJson(Map<String, dynamic> json) {
    return AnalogGaugePaint(
      internalIndicator: JsonColor.maybeFromString(json['internalIndicator']),
      internalScale: JsonColor.maybeFromString(json['internalScale']),
      externalIndicator: JsonColor.maybeFromString(json['externalIndicator']),
      gaugeBody: JsonColor.maybeFromString(json['gaugeBody']),
      externalScale: JsonColor.maybeFromString(json['externalScale']),
    );
  }

  AnalogGaugePaint copyWith({
    Color? internalIndicator,
    Color? internalScale,
    Color? externalIndicator,
    Color? gaugeBody,
    Color? externalScale,
  }) {
    return AnalogGaugePaint(
      externalIndicator: externalIndicator ?? this.externalIndicator,
      internalIndicator: internalIndicator ?? this.internalIndicator,
      internalScale: internalScale ?? this.internalScale,
      gaugeBody: gaugeBody ?? this.gaugeBody,
      externalScale: externalScale ?? this.externalScale,
    );
  }

  factory AnalogGaugePaint.fallbackLight() {
    return AnalogGaugePaint(
      internalIndicator: Colors.white,
      internalScale: Colors.black,
      externalIndicator: Colors.red,
      gaugeBody: Colors.white,
      externalScale: Colors.black,
    );
  }

  factory AnalogGaugePaint.fallbackDark() {
    return AnalogGaugePaint(
      internalIndicator: Colors.white,
      internalScale: Colors.black,
      externalIndicator: Colors.red,
      gaugeBody: Colors.white,
      externalScale: Colors.white,
    );
  }
}
