import 'dart:convert';

import 'package:sign/data/model/review_comment.dart';
import 'package:sign/data/model/user.dart';
import 'package:sign/data/source/process.dart';

class GitHubRepository {
  final ProcessRunner _runner;

  const GitHubRepository({
    ProcessRunner runner = const ProcessRunner('gh'),
  }) : _runner = runner;

  /// gh api \
  ///   -H "Accept: application/vnd.github.v3+json" \
  ///   /user
  Future<User> getUser() async {
    final result = await _runner.run([
      'api',
      '-H',
      'Accept: application/vnd.github.v3+json',
      '/user',
    ]);

    return User.fromJson(jsonDecode(result));
  }

  /// gh api \
  ///   -H "Accept: application/vnd.github.v3+json" \
  ///   /repos/{repo}/pulls/{num}/comments
  Future<Iterable<ReviewComment>> getReviewComments({
    required String repo,
    required int num,
  }) async {
    final result = await _runner.run([
      'api',
      '-H',
      'Accept: application/vnd.github.v3+json',
      '/repos/$repo/pulls/$num/comments',
    ]);

    return (jsonDecode(result) as List)
        .map((json) => ReviewComment.fromJson(json));
  }
}
