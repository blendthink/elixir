import 'dart:io';

import 'package:elixir/data/model/analyze_result.dart';
import 'package:elixir/data/repository/dart.dart';
import 'package:elixir/data/source/process.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:path/path.dart';
import 'package:test/test.dart';

import 'dart_test.mocks.dart';

@GenerateMocks([ProcessRunner])
Future<void> main() async {
  final runner = MockProcessRunner();
  final repository = DartRepository(runner: runner);
  final dir = Directory('./');

  test('Diagnostic is empty.', () async {
    when(runner.run(any, ignoreError: anyNamed('ignoreError')))
        .thenAnswer((_) async => '');
    const expected = Iterable<AnalyzeResult>.empty();
    final actual = await repository.analyze(dir: dir);
    expect(actual, expected);
  });

  test('One diagnostic exists.', () async {
    when(runner.run(any, ignoreError: anyNamed('ignoreError'))).thenAnswer(
      (_) async =>
          '''ERROR|SYNTACTIC_ERROR|EXPECTED_TOKEN|$current/lib/main.dart|5|23|1|Expected to find ';'.''',
    );
    const expected = <AnalyzeResult>[
      AnalyzeResult(
        severity: Severity.error,
        type: 'SYNTACTIC_ERROR',
        errorCode: 'EXPECTED_TOKEN',
        filePath: 'lib/main.dart',
        line: 5,
        column: 23,
        length: 1,
        errorMessage: """Expected to find ';'.""",
      ),
    ];
    final actual = await repository.analyze(dir: dir);
    expect(actual, expected);
  });

  test('Multiple diagnostics exist.', () async {
    when(runner.run(any, ignoreError: anyNamed('ignoreError'))).thenAnswer(
      (_) async => '''
ERROR|SYNTACTIC_ERROR|EXPECTED_TOKEN|$current/lib/main.dart|5|23|1|Expected to find ';'.
WARNING|STATIC_WARNING|UNSUPPORTED_OPTION_WITH_LEGAL_VALUE|$current/analysis_options.yaml|4|3|3|The option 'foo' isn't supported by 'linter'. Try using the only supported option: ''rules''.
INFO|HINT|UNUSED_LOCAL_VARIABLE|$current/lib/main.dart|4|9|3|The value of the local variable 'foo' isn't used.''',
    );

    const expected = <AnalyzeResult>[
      AnalyzeResult(
        severity: Severity.error,
        type: 'SYNTACTIC_ERROR',
        errorCode: 'EXPECTED_TOKEN',
        filePath: 'lib/main.dart',
        line: 5,
        column: 23,
        length: 1,
        errorMessage: """Expected to find ';'.""",
      ),
      AnalyzeResult(
        severity: Severity.warning,
        type: 'STATIC_WARNING',
        errorCode: 'UNSUPPORTED_OPTION_WITH_LEGAL_VALUE',
        filePath: 'analysis_options.yaml',
        line: 4,
        column: 3,
        length: 3,
        errorMessage:
            """The option 'foo' isn't supported by 'linter'. Try using the only supported option: ''rules''.""",
      ),
      AnalyzeResult(
        severity: Severity.info,
        type: 'HINT',
        errorCode: 'UNUSED_LOCAL_VARIABLE',
        filePath: 'lib/main.dart',
        line: 4,
        column: 9,
        length: 3,
        errorMessage: """The value of the local variable 'foo' isn't used.""",
      ),
    ];
    final actual = await repository.analyze(dir: dir);
    expect(actual, expected);
  });
}
