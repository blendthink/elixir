// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'indicate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Indicate _$$_IndicateFromJson(Map<String, dynamic> json) => _$_Indicate(
      diagHash: json['diagHash'] as String,
      body: json['body'] as String,
      commitId: json['commitId'] as String,
      path: json['path'] as String,
      line: json['line'] as int,
    );

Map<String, dynamic> _$$_IndicateToJson(_$_Indicate instance) =>
    <String, dynamic>{
      'diagHash': instance.diagHash,
      'body': instance.body,
      'commitId': instance.commitId,
      'path': instance.path,
      'line': instance.line,
    };
