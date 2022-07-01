// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnostics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Diagnostics _$$_DiagnosticsFromJson(Map<String, dynamic> json) =>
    _$_Diagnostics(
      type: $enumDecode(_$DiagnosticsTypeEnumMap, json['type']),
      message: json['message'] as String,
      path: json['path'] as String,
      row: json['row'] as int,
      column: json['column'] as int,
      summary: json['summary'] as String,
    );

Map<String, dynamic> _$$_DiagnosticsToJson(_$_Diagnostics instance) =>
    <String, dynamic>{
      'type': _$DiagnosticsTypeEnumMap[instance.type],
      'message': instance.message,
      'path': instance.path,
      'row': instance.row,
      'column': instance.column,
      'summary': instance.summary,
    };

const _$DiagnosticsTypeEnumMap = {
  DiagnosticsType.info: 'info',
  DiagnosticsType.warning: 'warning',
  DiagnosticsType.error: 'error',
};
