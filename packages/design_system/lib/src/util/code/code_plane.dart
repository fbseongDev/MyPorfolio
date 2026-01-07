import 'package:design_system/src/util/code/code_column.dart';
import 'package:design_system/src/util/code/code_row.dart';
import 'package:utils/utils.dart';

class CodePlane {
  final List<CodeColumn> codeColumns;

  CodePlane(this.codeColumns);

  static CodePlane parse(String code) {
    final codeColumns = code.split('\n').map((row) {
      // 주석이라면
      if (row.startsWith('//')) return CodeColumn([CodeComment(row)]);

      // '큰 따옴표'로 감싸진 문자열을 포함하는지
      final hasContainSQStringExp = RegExp(r"'[^']*'");
      // '작은 따옴표'로 감싸진 문자열을 포함하는지
      final hasContainDQStringExp = RegExp(r'"[^"]*"');
      // '큰 따옴표'로 감싸진 문자열인지
      final isSQStringExp = RegExp(r"^'.*'$");
      // '작은 따옴표'로 감싸진 문자열인지
      final isDQStringExp = RegExp(r'^".*"$');

      // 문자열을 기준으로 구분한 리스트
      final splitByString = row
          .tokenize(hasContainSQStringExp)
          .map((e) => e.tokenize(hasContainDQStringExp))
          .expand((e) => e);

      final words = splitByString
          .map((e) {
            // 문자열이라면 바로 반환
            if (isSQStringExp.hasMatch(e) || isDQStringExp.hasMatch(e)) {
              return [e];
            } else {
              // 문자열이 아니라면 하이라이팅이 다른 문자 구분
              return e
                  // ' '띄워쓰기 구분
                  .split(' ')
                  .insertBetween(' ')
                  // '(' 구분
                  .map((e) => e.split('(').insertBetween('('))
                  .expand((e) => e)
                  // ')' 구분
                  .map((e) => e.split(')').insertBetween(')'))
                  .expand((e) => e)
                  // '.' 구분
                  .map((e) => e.split('.').insertBetween('.'))
                  .expand((e) => e)
                  // ',' 구분
                  .map((e) => e.split(',').insertBetween(','))
                  .expand((e) => e)
                  .toList();
            }
          })
          .expand((e) => e);

      final codeRows = words.toList().asMap().entries.map((entry) {
        // 포맷할 대상 문자
        final word = entry.value;

        // 해당 문자 다음 차례의 문자
        final nextWord = words.elementAtOrNull(entry.key + 1);

        // 문자열인지 체크
        if (isSQStringExp.hasMatch(word) || isDQStringExp.hasMatch(word)) {
          return CodeString(word);
        }

        // 키워드인지 체크
        if (CodeKeyword.keywords.contains(word)) return CodeKeyword(word);

        final isAnnotation = RegExp(r'^@').hasMatch(word);
        if(isAnnotation) return CodeAnnotation(word);

        // 클래스인지 체크
        final isClass =
            RegExp(r'^[A-Z]').hasMatch(word) &&
            (nextWord == '(' ||
                words.let((e) {
                  final prevWord = words.elementAtOrNull(entry.key - 1);
                  final prevOverWord = words.elementAtOrNull(entry.key - 2);

                  if (prevWord == ' ' && prevOverWord == 'class') return true;

                  return false;
                }));
        if (isClass) return CodeClass(word);

        // 메서드인지 체크
        final isMethod = RegExp(r'^[a-z]').hasMatch(word) && nextWord == '(';
        if (isMethod) return CodeMethod(word);

        // 숫자인지 체크
        final isNumber = RegExp(r'^-?\d+(\.\d+)?$').hasMatch(word);
        if (isNumber) return CodeNumber(word);

        return CodeDefault(word);
      }).toList();

      return CodeColumn(codeRows);
    }).toList();

    return CodePlane(codeColumns);
  }

  String get planeText {
    return codeColumns
        .map((e) => e.codeRows.map((e) => e.code).join(''))
        .join('\n');
  }
}
