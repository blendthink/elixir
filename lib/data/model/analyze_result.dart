import 'package:meta/meta.dart';

@immutable
class AnalyzeResult {
  const AnalyzeResult({
    required this.severity,
    required this.type,
    required this.errorCode,
    required this.filePath,
    required this.line,
    required this.column,
    required this.length,
    required this.errorMessage,
  });

  final Severity severity;
  final String type;
  final String errorCode;
  final String filePath;
  final int line;
  final int column;
  final int length;
  final String errorMessage;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnalyzeResult &&
          runtimeType == other.runtimeType &&
          severity == other.severity &&
          type == other.type &&
          errorCode == other.errorCode &&
          filePath == other.filePath &&
          line == other.line &&
          column == other.column &&
          length == other.length &&
          errorMessage == other.errorMessage;

  @override
  int get hashCode =>
      severity.hashCode ^
      type.hashCode ^
      errorCode.hashCode ^
      filePath.hashCode ^
      line.hashCode ^
      column.hashCode ^
      length.hashCode ^
      errorMessage.hashCode;
}

enum Severity {
  info,
  warning,
  error,
}
