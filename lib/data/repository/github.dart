import 'dart:convert';

import 'package:elixir/data/model/comment.dart';
import 'package:elixir/infra/client.dart';

class GitHubRepository {
  const GitHubRepository({
    required GitHubClient client,
  }) : _client = client;

  final GitHubClient _client;

  /// Create a review for a pull request
  /// https://docs.github.com/en/rest/pulls/reviews#create-a-review-for-a-pull-request
  Future<String> createReview({
    required String repo,
    required int num,
    required int issueCount,
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
