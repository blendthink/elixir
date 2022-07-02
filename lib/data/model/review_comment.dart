import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:elixir/data/model/user.dart';

part 'review_comment.freezed.dart';

part 'review_comment.g.dart';

@freezed
class ReviewComment with _$ReviewComment {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ReviewComment({
    required String path,
    required String commitId,
    required User user,
    required String body,
    required int line,
  }) = _ReviewComment;

  factory ReviewComment.fromJson(Map<String, dynamic> json) =>
      _$ReviewCommentFromJson(json);
}
