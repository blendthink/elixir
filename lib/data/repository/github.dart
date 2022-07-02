import 'dart:convert';

import 'package:elixir/data/model/review_comment.dart';
import 'package:elixir/data/source/process.dart';

class GitHubRepository {
  final ProcessRunner _runner;

  const GitHubRepository({
    ProcessRunner runner = const ProcessRunner('gh'),
  }) : _runner = runner;

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

  /// gh api \
  ///   --method POST \
  ///   -H "Accept: application/vnd.github.v3+json" \
  ///   /repos/{repo}/pulls/{num}/comments \
  ///   -f body={body} \
  ///   -f commit_id={commitId} \
  ///   -f path={path} \
  ///   -F line={line}
  Future<ReviewComment> createReviewComment({
    required String repo,
    required int num,
    required String body,
    required String commitId,
    required String path,
    required int line,
  }) async {
    final result = await _runner.run([
      'api',
      '--method',
      'POST',
      '-H',
      'Accept: application/vnd.github.v3+json',
      '/repos/$repo/pulls/$num/comments',
      '-f',
      'body=$body',
      '-f',
      'commit_id=$commitId',
      '-f',
      'path=$path',
      '-F',
      'line=$line',
    ]);

    return ReviewComment.fromJson(jsonDecode(result));
  }
}
