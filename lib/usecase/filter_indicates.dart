import 'package:signpost/data/model/indicate.dart';
import 'package:signpost/data/repository/github.dart';

class FilterIndicatesUseCase {
  final GitHubRepository _gitHubRepository;

  const FilterIndicatesUseCase({
    GitHubRepository gitHubRepository = const GitHubRepository(),
  }) : _gitHubRepository = gitHubRepository;

  Future<Iterable<Indicate>> call({
    required String repo,
    required int num,
    required Iterable<Indicate> indicates,
  }) async {
    final user = await _gitHubRepository.getUser();
    final comments =
        await _gitHubRepository.getReviewComments(repo: repo, num: num);

    final userComments =
        comments.where((comment) => comment.user.id == user.id);

    return indicates.where((indicate) {
      // If commitId, path, line, and body are all the same, then it is excluded from the list.
      return !userComments.any((comment) =>
          comment.commitId == indicate.commitId &&
          comment.path == indicate.path &&
          comment.line == indicate.line &&
          comment.body == indicate.body);
    });
  }
}
