class Buffer {
  final int size;
  late List<num?> _buf;

  Buffer(this.size) {
    clear();
  }

  get _count => _buf.where((x) => x != null).length;

  clear() {
    _buf = List.filled(size, null);
  }

  add(num value) {
    if(_count == _buf.length) {
      _buf = [..._buf.skip(1), value];
    } else {
      _buf[_count] = value;
    }
  }

  get average {
    final notNull = _buf.where((x) => x != null);

    return notNull.reduce((x, sum) => x! + sum!)! / notNull.length;
  } 
}
