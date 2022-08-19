import 'package:elixir/data/model/analyze_result.dart';
import 'package:elixir/data/parser/analyze_result_parser.dart';
import 'package:path/path.dart';
import 'package:test/test.dart';

void main() {
  const parser = AnalyzeResultParser();
  test('error', () {
    const expected = AnalyzeResult(
      severity: Severity.error,
      type: 'SYNTACTIC_ERROR',
      errorCode: 'EXPECTED_TOKEN',
      filePath: 'lib/main.dart',
      line: 5,
      column: 23,
      length: 1,
      errorMessage: """Expected to find ';'.""",
    );
    final actual = parser.parse(
      '''ERROR|SYNTACTIC_ERROR|EXPECTED_TOKEN|$current/lib/main.dart|5|23|1|Expected to find ';'.''',
    );
    expect(actual, expected);
  });
  test('warning', () {
    const expected = AnalyzeResult(
      severity: Severity.warning,
      type: 'STATIC_WARNING',
      errorCode: 'UNSUPPORTED_OPTION_WITH_LEGAL_VALUE',
      filePath: 'analysis_options.yaml',
      line: 4,
      column: 3,
      length: 3,
      errorMessage:
          """The option 'foo' isn't supported by 'linter'. Try using the only supported option: ''rules''.""",
    );
    final actual = parser.parse(
      '''WARNING|STATIC_WARNING|UNSUPPORTED_OPTION_WITH_LEGAL_VALUE|$current/analysis_options.yaml|4|3|3|The option 'foo' isn't supported by 'linter'. Try using the only supported option: ''rules''.''',
    );
    expect(actual, expected);
  });
  test('info', () {
    const expected = AnalyzeResult(
      severity: Severity.info,
      type: 'HINT',
      errorCode: 'UNUSED_LOCAL_VARIABLE',
      filePath: 'lib/main.dart',
      line: 4,
      column: 9,
      length: 3,
      errorMessage: """The value of the local variable 'foo' isn't used.""",
    );
    final actual = parser.parse(
      '''INFO|HINT|UNUSED_LOCAL_VARIABLE|$current/lib/main.dart|4|9|3|The value of the local variable 'foo' isn't used.''',
    );
    expect(actual, expected);
  });
  test('null', () {
    final actual = parser.parse('');
    expect(actual, null);
  });
}
