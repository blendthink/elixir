import 'package:sign/util/range.dart';

class DiffRangeConverter {
  final _regex = RegExp(r'@@ (-(\d+)(,(\d+))?)? ?(\+(\d+)(,(\d+))?)? @@.*');

  List<Range> convert(String pathDiff) {
    final matches = _regex.allMatches(pathDiff);
    if (matches.isEmpty) return [];

    final lines = matches.map((match) {
      final firstLine = int.tryParse(match.group(6) ?? '');
      if (firstLine == null) return null;

      final length = int.tryParse(match.group(8) ?? '') ?? 1;
      if (length <= 0) return null;

      return firstLine.convertToRange(length);
    }).whereType<Range>();

    return lines.toList();
  }
}
