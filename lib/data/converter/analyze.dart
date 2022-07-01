import 'package:sign/data/model/diagnostics.dart';
import 'package:sign/data/model/diagnostics_type.dart';

class AnalyzeConverter {
  final _regex =
      RegExp(r'^ *(info|warning|error) • (.*) • (.*):(\d*):(\d*) • (.*)');

  List<Diagnostics> convert(String analyzeResult) {
    final lines = analyzeResult.split('\n');

    final diagnoses = lines.map((line) {
      final match = _regex.firstMatch(line);
      if (match == null) return null;

      final type = DiagnosticsType.values.byName(match.group(1)!);
      final message = match.group(2)!;
      final path = match.group(3)!;
      final row = int.parse(match.group(4)!);
      final column = int.parse(match.group(5)!);
      final summary = match.group(6)!;
      return Diagnostics(
        type: type,
        message: message,
        path: path,
        row: row,
        column: column,
        summary: summary,
      );
    }).whereType<Diagnostics>();

    return diagnoses.toList();
  }
}
