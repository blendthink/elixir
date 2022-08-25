import 'package:elixir/data/model/analyze_result.dart';
import 'package:path/path.dart' as p;

/// `dart analyze --format=machine`
/// SEVERITY|TYPE|ERROR_CODE|FILE_PATH|LINE|COLUMN|LENGTH|ERROR_MESSAGE
///
/// e.g.:
/// ERROR|COMPILE_TIME_ERROR|UNDEFINED_GETTER|/Users/blendthink/Documents/repositories/danger-plugin-dart-analyze/lib/src/models/dart_analyze_result.dart|25|17|4|The getter 'name' isn't defined for the type 'T'.
class AnalyzeResultParser {
  const AnalyzeResultParser();

  static final _regex = RegExp(
    r'(INFO|WARNING|ERROR)\|(.+)\|(.+)\|(.+)\|(\d+)\|(\d+)\|(\d+)\|(.+)',
  );

  AnalyzeResult? parse(String logLine) {
    final match = _regex.firstMatch(logLine);
    if (match == null) {
      return null;
    }

    final severity = Severity.values.byName(match.group(1)!.toLowerCase());
    final type = match.group(2)!;
    final errorCode = match.group(3)!;
    final filePath = p.relative(match.group(4)!);
    final line = int.parse(match.group(5)!);
    final column = int.parse(match.group(6)!);
    final length = int.parse(match.group(7)!);
    final errorMessage = match.group(8)!;

    return AnalyzeResult(
      severity: severity,
      type: type,
      errorCode: errorCode,
      filePath: filePath,
      line: line,
      column: column,
      length: length,
      errorMessage: errorMessage,
    );
  }
}
