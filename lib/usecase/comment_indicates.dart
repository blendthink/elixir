import 'package:sign/data/model/indicate.dart';
import 'package:sign/data/model/review_comment.dart';
import 'package:sign/data/repository/github.dart';

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
    return await Future.wait(indicates.map((indicate) async {
      return await _gitHubRepository.createReviewComment(
        repo: repo,
        num: num,
        body: indicate.body,
        commitId: indicate.commitId,
        path: indicate.path,
        line: indicate.line,
      );
    }));
  }
}
