// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'review_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReviewComment _$$_ReviewCommentFromJson(Map<String, dynamic> json) =>
    _$_ReviewComment(
      path: json['path'] as String,
      originalCommitId: json['original_commit_id'] as String,
      body: json['body'] as String,
      line: json['line'] as int,
    );

Map<String, dynamic> _$$_ReviewCommentToJson(_$_ReviewComment instance) =>
    <String, dynamic>{
      'path': instance.path,
      'original_commit_id': instance.originalCommitId,
      'body': instance.body,
      'line': instance.line,
    };
