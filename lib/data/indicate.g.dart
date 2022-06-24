// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'indicate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Indicate _$$_IndicateFromJson(Map<String, dynamic> json) => _$_Indicate(
      type: $enumDecode(_$IndicateTypeEnumMap, json['type']),
      message: json['message'] as String,
      path: json['path'] as String,
      row: json['row'] as int,
      column: json['column'] as int,
      lintRule: json['lintRule'] as String,
    );

Map<String, dynamic> _$$_IndicateToJson(_$_Indicate instance) =>
    <String, dynamic>{
      'type': _$IndicateTypeEnumMap[instance.type],
      'message': instance.message,
      'path': instance.path,
      'row': instance.row,
      'column': instance.column,
      'lintRule': instance.lintRule,
    };

const _$IndicateTypeEnumMap = {
  IndicateType.info: 'info',
  IndicateType.warning: 'warning',
  IndicateType.error: 'error',
};
