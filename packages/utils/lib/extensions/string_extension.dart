extension StringExtension on String {
  List<String> tokenize(Pattern tokenExp) {
    if(this == ''){
      return [this];
    }

    final result = <String>[];
    int lastIndex = 0;

    for (final match in tokenExp.allMatches(this)) {
      if (match.start > lastIndex) {
        result.add(substring(lastIndex, match.start));
      }
      result.add(match.group(0)!);
      lastIndex = match.end;
    }

    if (lastIndex < length) {
      result.add(substring(lastIndex));
    }

    return result;
  }
}
