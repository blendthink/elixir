import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sign/data/model/analysis.dart';
import 'package:sign/data/repository/dart.dart';
import 'package:sign/data/source/process.dart';
import 'package:test/test.dart';

import 'dart_test.mocks.dart';

@GenerateMocks([ProcessRunner])
Future<void> main() async {
  final runner = MockProcessRunner();
  final repository = DartRepository(runner: runner);

  test('Diagnostics is empty.', () async {
    when(runner.run(any)).thenAnswer((_) async => '''
Analyzing flutter-mobile-lints...      0.8s
No issues found!''');

    final expected = AnalysisResults(
      version: 0,
      diagnostics: <Diagnostic>[],
    );

    final actual = await repository.analyze(dir: './');
    expect(actual, expected);
  });

  test('One diagnostic exists.', () async {
    when(runner.run(any)).thenAnswer((_) async => '''
Analyzing danger-flutter-lint-demo...  1.7s
{"version":1,"diagnostics":[{"code":"argument_type_not_assignable","severity":"ERROR","type":"COMPILE_TIME_ERROR","location":{"file":"/Users/blendthink/Documents/repositories/danger-flutter-lint-demo/lib/main.dart","range":{"start":{"offset":305,"line":14,"column":14},"end":{"offset":309,"line":14,"column":18}}},"problemMessage":"The argument type 'Null' can't be assigned to the parameter type 'String'.","documentation":"https://dart.dev/diagnostics/argument_type_not_assignable"}]}''');

    final expected = AnalysisResults(
      version: 1,
      diagnostics: <Diagnostic>[
        Diagnostic(
          code: 'argument_type_not_assignable',
          severity: DiagnosticSeverity.error,
          type: DiagnosticType.compileTimeError,
          location: Location(
            file:
                '/Users/blendthink/Documents/repositories/danger-flutter-lint-demo/lib/main.dart',
            range: Range(
              start: Position(offset: 305, line: 14, column: 14),
              end: Position(offset: 309, line: 14, column: 18),
            ),
          ),
          problemMessage:
              "The argument type 'Null' can't be assigned to the parameter type 'String'.",
          documentation:
              'https://dart.dev/diagnostics/argument_type_not_assignable',
        ),
      ],
    );

    final actual = await repository.analyze(dir: './');
    expect(actual, expected);
  });

  test('Multiple diagnostics exist.', () async {
    when(runner.run(any)).thenAnswer((_) async => '''
Analyzing danger-flutter-lint-demo...  1.7s
{"version":1,"diagnostics":[{"code":"argument_type_not_assignable","severity":"ERROR","type":"COMPILE_TIME_ERROR","location":{"file":"/Users/blendthink/Documents/repositories/danger-flutter-lint-demo/lib/main.dart","range":{"start":{"offset":305,"line":14,"column":14},"end":{"offset":309,"line":14,"column":18}}},"problemMessage":"The argument type 'Null' can't be assigned to the parameter type 'String'.","documentation":"https://dart.dev/diagnostics/argument_type_not_assignable"},{"code":"unrecognized_error_code","severity":"WARNING","type":"STATIC_WARNING","location":{"file":"/Users/blendthink/Documents/repositories/danger-flutter-lint-demo/analysis_options.yaml","range":{"start":{"offset":121,"line":5,"column":5},"end":{"offset":125,"line":5,"column":9}}},"problemMessage":"'demo' isn't a recognized error code."},{"code":"always_put_required_named_parameters_first","severity":"INFO","type":"LINT","location":{"file":"/Users/blendthink/Documents/repositories/danger-flutter-lint-demo/lib/main.dart","range":{"start":{"offset":1094,"line":33,"column":45},"end":{"offset":1099,"line":33,"column":50}}},"problemMessage":"Put required named parameters first.","documentation":"https://dart-lang.github.io/linter/lints/always_put_required_named_parameters_first.html"}]}''');

    final expected = AnalysisResults(
      version: 1,
      diagnostics: <Diagnostic>[
        Diagnostic(
          code: 'argument_type_not_assignable',
          severity: DiagnosticSeverity.error,
          type: DiagnosticType.compileTimeError,
          location: Location(
            file:
                '/Users/blendthink/Documents/repositories/danger-flutter-lint-demo/lib/main.dart',
            range: Range(
              start: Position(offset: 305, line: 14, column: 14),
              end: Position(offset: 309, line: 14, column: 18),
            ),
          ),
          problemMessage:
              "The argument type 'Null' can't be assigned to the parameter type 'String'.",
          documentation:
              'https://dart.dev/diagnostics/argument_type_not_assignable',
        ),
        Diagnostic(
          code: 'unrecognized_error_code',
          severity: DiagnosticSeverity.warning,
          type: DiagnosticType.staticWarning,
          location: Location(
            file:
                '/Users/blendthink/Documents/repositories/danger-flutter-lint-demo/analysis_options.yaml',
            range: Range(
              start: Position(offset: 121, line: 5, column: 5),
              end: Position(offset: 125, line: 5, column: 9),
            ),
          ),
          problemMessage: "'demo' isn't a recognized error code.",
        ),
        Diagnostic(
          code: 'always_put_required_named_parameters_first',
          severity: DiagnosticSeverity.info,
          type: DiagnosticType.lint,
          location: Location(
            file:
                '/Users/blendthink/Documents/repositories/danger-flutter-lint-demo/lib/main.dart',
            range: Range(
              start: Position(offset: 1094, line: 33, column: 45),
              end: Position(offset: 1099, line: 33, column: 50),
            ),
          ),
          problemMessage: 'Put required named parameters first.',
          documentation:
              'https://dart-lang.github.io/linter/lints/always_put_required_named_parameters_first.html',
        ),
      ],
    );

    final actual = await repository.analyze(dir: './');
    expect(actual, expected);
  });

  test('Throw ProcessException.', () async {
    when(runner.run(any)).thenThrow(const ProcessException(1));
    expect(
      () async => await repository.analyze(dir: './'),
      throwsA(TypeMatcher<ProcessException>()),
    );
  });
}
