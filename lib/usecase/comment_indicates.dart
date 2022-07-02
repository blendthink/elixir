import 'package:elixir/data/model/indicate.dart';
import 'package:elixir/data/model/review_comment.dart';
import 'package:elixir/data/repository/github.dart';

class CommentIndicatesUseCase {
  final GitHubRepository _gitHubRepository;

  const CommentIndicatesUseCase({
    GitHubRepository gitHubRepository = const GitHubRepository(),
  }) : _gitHubRepository = gitHubRepository;

  Future<List<ReviewComment>> call({
    required String repo,
    required int num,
    required Iterable<Indicate> indicates,
  }) async {
    final comments = <ReviewComment>[];

    for (final indicate in indicates) {
      final comment = await _gitHubRepository.createReviewComment(
        repo: repo,
        num: num,
        body: indicate.body,
        commitId: indicate.commitId,
        path: indicate.path,
        line: indicate.line,
      );
      comments.add(comment);
      await Future.delayed(Duration(seconds: 10));
    }

    return comments;
  }
}
