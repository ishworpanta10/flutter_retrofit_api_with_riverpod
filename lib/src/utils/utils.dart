//Default Value for Optionals in Dart

extension OrDefault<T> on T? {
  T get orDefault {
    final value = this;
    if (value == null) {
      return {
        int: 0,
        String: '',
        double: 0.0,
        Map: {},
        List: [],
      }[T] as T;
    } else {
      return value;
    }
  }
}
