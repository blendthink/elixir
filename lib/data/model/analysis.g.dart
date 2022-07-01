// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AnalysisResults _$$_AnalysisResultsFromJson(Map<String, dynamic> json) =>
    _$_AnalysisResults(
      version: json['version'] as int,
      diagnostics: (json['diagnostics'] as List<dynamic>)
          .map((e) => Diagnostic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AnalysisResultsToJson(_$_AnalysisResults instance) =>
    <String, dynamic>{
      'version': instance.version,
      'diagnostics': instance.diagnostics,
    };

_$_Diagnostic _$$_DiagnosticFromJson(Map<String, dynamic> json) =>
    _$_Diagnostic(
      code: json['code'] as String,
      severity: $enumDecode(_$DiagnosticSeverityEnumMap, json['severity']),
      type: $enumDecode(_$DiagnosticTypeEnumMap, json['type']),
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      problemMessage: json['problemMessage'] as String,
      correctionMessage: json['correctionMessage'] as String?,
      contextMessages: (json['contextMessages'] as List<dynamic>?)
          ?.map((e) => ContextMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      documentation: json['documentation'] as String?,
    );

Map<String, dynamic> _$$_DiagnosticToJson(_$_Diagnostic instance) =>
    <String, dynamic>{
      'code': instance.code,
      'severity': _$DiagnosticSeverityEnumMap[instance.severity],
      'type': _$DiagnosticTypeEnumMap[instance.type],
      'location': instance.location,
      'problemMessage': instance.problemMessage,
      'correctionMessage': instance.correctionMessage,
      'contextMessages': instance.contextMessages,
      'documentation': instance.documentation,
    };

const _$DiagnosticSeverityEnumMap = {
  DiagnosticSeverity.none: 'NONE',
  DiagnosticSeverity.info: 'INFO',
  DiagnosticSeverity.warning: 'WARNING',
  DiagnosticSeverity.error: 'ERROR',
};

const _$DiagnosticTypeEnumMap = {
  DiagnosticType.todo: 'TODO',
  DiagnosticType.hint: 'HINT',
  DiagnosticType.compileTimeError: 'COMPILE_TIME_ERROR',
  DiagnosticType.checkedModeCompileTimeError: 'CHECKED_MODE_COMPILE_TIME_ERROR',
  DiagnosticType.staticWarning: 'STATIC_WARNING',
  DiagnosticType.staticTypeWarning: 'STATIC_TYPE_WARNING',
  DiagnosticType.syntacticError: 'SYNTACTIC_ERROR',
  DiagnosticType.lint: 'LINT',
};

_$_Location _$$_LocationFromJson(Map<String, dynamic> json) => _$_Location(
      file: json['file'] as String,
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LocationToJson(_$_Location instance) =>
    <String, dynamic>{
      'file': instance.file,
      'range': instance.range,
    };

_$_Range _$$_RangeFromJson(Map<String, dynamic> json) => _$_Range(
      start: Position.fromJson(json['start'] as Map<String, dynamic>),
      end: Position.fromJson(json['end'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RangeToJson(_$_Range instance) => <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
    };

_$_Position _$$_PositionFromJson(Map<String, dynamic> json) => _$_Position(
      offset: json['offset'] as int,
      line: json['line'] as int,
      column: json['column'] as int,
    );

Map<String, dynamic> _$$_PositionToJson(_$_Position instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'line': instance.line,
      'column': instance.column,
    };

_$_ContextMessage _$$_ContextMessageFromJson(Map<String, dynamic> json) =>
    _$_ContextMessage(
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$$_ContextMessageToJson(_$_ContextMessage instance) =>
    <String, dynamic>{
      'location': instance.location,
      'message': instance.message,
    };
