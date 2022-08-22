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
    required Iterable<Comment> comments,
  }) async =>
      _client.postRequest(
        path: 'repos/$repo/pulls/$num/reviews',
        data: {
          'body': '$issueCount issue found.',
          'event': 'COMMENT',
          'comments': jsonEncode(comments),
        },
      );
}
