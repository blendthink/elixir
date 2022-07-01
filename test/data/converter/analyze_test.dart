import 'package:sign/data/converter/analyze.dart';
import 'package:sign/data/model/diagnostics.dart';
import 'package:sign/data/model/diagnostics_type.dart';
import 'package:test/test.dart';

void main() {
  final converter = AnalyzeConverter();

  test('to diagnostics', () {
    final analyzeResult = '''
Analyzing danger-flutter-lint-demo...                           

warning • 'demo' isn't a recognized error code • analysis_options.yaml:5:5 • unrecognized_error_code
  error • The argument type 'Null' can't be assigned to the parameter type 'String' • lib/main.dart:14:14 • argument_type_not_assignable
   info • Put required named parameters first • lib/main.dart:33:45 • always_put_required_named_parameters_first
''';

    final expected = <Diagnostics>[
      Diagnostics(
        type: DiagnosticsType.warning,
        message: "'demo' isn't a recognized error code",
        path: 'analysis_options.yaml',
        row: 5,
        column: 5,
        summary: 'unrecognized_error_code',
      ),
      Diagnostics(
        type: DiagnosticsType.error,
        message:
            "The argument type 'Null' can't be assigned to the parameter type 'String'",
        path: 'lib/main.dart',
        row: 14,
        column: 14,
        summary: 'argument_type_not_assignable',
      ),
      Diagnostics(
        type: DiagnosticsType.info,
        message: 'Put required named parameters first',
        path: 'lib/main.dart',
        row: 33,
        column: 45,
        summary: 'always_put_required_named_parameters_first',
      ),
    ];

    expect(converter.convert(analyzeResult), expected);
  });
}
