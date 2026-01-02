enum CodeLanguage {
  dart,
  kotlin;

  @override
  String toString() => switch (this) {
    dart => 'Dart',
    kotlin => 'Kotlin',
  };
}
