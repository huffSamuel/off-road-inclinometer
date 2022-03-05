import 'package:equatable/equatable.dart';

import 'analog_gauge_theme.dart';

class GaugeStyle extends Equatable {
  final String name;
  final AnalogGaugeTheme? theme;

  const GaugeStyle(this.name, {this.theme});

  static GaugeStyle digital =
      GaugeStyle('Digital', theme: AnalogGaugeTheme.standard);
  static GaugeStyle defaultAnalog =
      GaugeStyle('Default Analog', theme: AnalogGaugeTheme.standard);

  static List<GaugeStyle> all = [
    digital,
    ...AnalogGaugeTheme.all.map((x) => GaugeStyle.analog(x.name, x)),
  ];

  factory GaugeStyle.analog(String name, AnalogGaugeTheme theme) {
    return GaugeStyle(name, theme: theme);
  }

  @override
  List<Object?> get props => [name];
}
