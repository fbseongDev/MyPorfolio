extension Extension<E extends Object> on E {
  T let<T>(T Function(E it) block) {
    return block(this);
  }

  R run<R>(R Function() block) {
    return block();
  }
}

extension NullableExtension<E> on E? {
  bool isNull() => this == null;

  bool isNotNull() => this != null;

  T let<T>(T Function(E? it) block) {
    return block(this);
  }

  R run<R>(R Function() block) {
    return block();
  }
}
