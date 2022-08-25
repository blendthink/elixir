import 'dart:convert';

import 'package:elixir/data/model/comment.dart';
import 'package:elixir/infra/client.dart';
import 'package:elixir/infra/response/comment.dart';

class GitHubRepository {
  const GitHubRepository({
    required GitHubClient client,
  }) : _client = client;

  final GitHubClient _client;

  /// List review comments on a pull request
  /// https://docs.github.com/en/rest/pulls/comments#list-review-comments-on-a-pull-request
  Future<List<ReviewComment>> listReviewComments({
    required String repo,
    required int num,
  }) async {
    final result = await _client.getRequest(
      path: 'repos/$repo/pulls/$num/comments',
    );
    final json = jsonDecode(result) as Iterable;
    return List<ReviewComment>.from(
      json.map((e) => ReviewComment.fromJson(e as Map<String, dynamic>)),
    );
  }

  /// Create a review for a pull request
  /// https://docs.github.com/en/rest/pulls/reviews#create-a-review-for-a-pull-request
  Future<String> createReview({
    required String repo,
    required int num,
    required List<Comment> comments,
  }) async {
    final data = _Data(
      body: '',
      event: 'COMMENT',
      comments: comments,
    );
    return _client.postRequest(
      path: 'repos/$repo/pulls/$num/reviews',
      data: jsonEncode(data),
    );
  }

  /// Delete a review comment for a pull request
  /// https://docs.github.com/en/rest/pulls/comments#delete-a-review-comment-for-a-pull-request
  Future<void> deleteReviewComment({
    required String repo,
    required int commentId,
  }) async =>
      _client.deleteRequest(
        path: 'repos/$repo/pulls/comments/$commentId',
      );
}

class _Data {
  _Data({
    required this.body,
    required this.event,
    required this.comments,
  });

  final String body;
  final String event;
  final List<Comment> comments;

  Map<String, dynamic> toJson() => {
        'body': body,
        'event': event,
        'comments': comments,
      };
}
