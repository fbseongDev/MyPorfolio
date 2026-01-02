extension ListExtension<E> on List<E> {
  List<E> insertBetween(E item) {
    if (length < 2) return [...this];

    final List<E> result = [];
    for (int i = 0; i < length; i++) {
      result.add(this[i]);
      if (i != length - 1) {
        result.add(item);
      }
    }
    return result;
  }
}