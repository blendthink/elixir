import 'package:freezed_annotation/freezed_annotation.dart';

part 'analysis.freezed.dart';

part 'analysis.g.dart';

@freezed
abstract class AnalysisResults with _$AnalysisResults {
  const factory AnalysisResults({
    required int version,
    required List<Diagnostic> diagnostics,
  }) = _AnalysisResults;

  factory AnalysisResults.fromJson(Map<String, Object?> json) =>
      _$AnalysisResultsFromJson(json);
}

@freezed
abstract class Diagnostic with _$Diagnostic {
  const factory Diagnostic({
    required String code,
    required DiagnosticSeverity severity,
    required DiagnosticType type,
    required Location location,
    required String problemMessage,
    String? correctionMessage,
    List<ContextMessage>? contextMessages,
    Url? documentation,
  }) = _Diagnostic;

  factory Diagnostic.fromJson(Map<String, Object?> json) =>
      _$DiagnosticFromJson(json);
}

enum DiagnosticSeverity {
  @JsonValue('NONE')
  none('NONE'),
  @JsonValue('INFO')
  info('INFO'),
  @JsonValue('WARNING')
  warning('WARNING'),
  @JsonValue('ERROR')
  error('ERROR'),
  ;

  final String key;

  const DiagnosticSeverity(this.key);

  @override
  String toString() => key;
}

enum DiagnosticType {
  @JsonValue('TODO')
  todo('TODO'),
  @JsonValue('HINT')
  hint('HINT'),
  @JsonValue('COMPILE_TIME_ERROR')
  compileTimeError('COMPILE_TIME_ERROR'),
  @JsonValue('CHECKED_MODE_COMPILE_TIME_ERROR')
  checkedModeCompileTimeError('CHECKED_MODE_COMPILE_TIME_ERROR'),
  @JsonValue('STATIC_WARNING')
  staticWarning('STATIC_WARNING'),
  @JsonValue('STATIC_TYPE_WARNING')
  staticTypeWarning('STATIC_TYPE_WARNING'),
  @JsonValue('SYNTACTIC_ERROR')
  syntacticError('SYNTACTIC_ERROR'),
  @JsonValue('LINT')
  lint('LINT'),
  ;

  final String key;

  const DiagnosticType(this.key);

  @override
  String toString() => key;
}

typedef FilePath = String;
typedef Url = String;

@freezed
abstract class Location with _$Location {
  const factory Location({
    required FilePath file,
    required Range range,
  }) = _Location;

  factory Location.fromJson(Map<String, Object?> json) =>
      _$LocationFromJson(json);
}

@freezed
abstract class Range with _$Range {
  const factory Range({
    required Position start,
    required Position end,
  }) = _Range;

  factory Range.fromJson(Map<String, Object?> json) => _$RangeFromJson(json);
}

@freezed
abstract class Position with _$Position {
  const factory Position({
    required int offset,
    required int line,
    required int column,
  }) = _Position;

  factory Position.fromJson(Map<String, Object?> json) =>
      _$PositionFromJson(json);
}

@freezed
abstract class ContextMessage with _$ContextMessage {
  const factory ContextMessage({
    required Location location,
    required String message,
  }) = _ContextMessage;

  factory ContextMessage.fromJson(Map<String, Object?> json) =>
      _$ContextMessageFromJson(json);
}
