class SimpleMovingAverage {
  final Duration period;
  final Map<DateTime, num> _values = {};

  SimpleMovingAverage(this.period);

  double get value =>
      _values.values.reduce((value, element) => value + element) /
      _values.length;

  void push(num value) {
    final now = DateTime.now();

    _values.removeWhere((key, value) => now.difference(key) > period);
    _values.addAll({now: value});
  }
}
