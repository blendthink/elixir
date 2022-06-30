import 'package:sign/data/model/indicate.dart';
import 'package:sign/data/model/indicate_type.dart';

class AnalyzeConverter {
  final regex =
      RegExp(r'^ *(info|warning|error) • (.*) • (.*):(\d*):(\d*) • (.*)');

  List<Indicate> convert(String analyzeResult) {
    final lines = analyzeResult.split('\n');

    final indicates = lines.map((line) {
      final match = regex.firstMatch(line);
      if (match == null) return null;

      final type = IndicateType.values.byName(match.group(1)!);
      final message = match.group(2)!;
      final path = match.group(3)!;
      final row = int.parse(match.group(4)!);
      final column = int.parse(match.group(5)!);
      final summary = match.group(6)!;
      return Indicate(
        type: type,
        message: message,
        path: path,
        row: row,
        column: column,
        summary: summary,
      );
    }).whereType<Indicate>();

    return indicates.toList();
  }
}
