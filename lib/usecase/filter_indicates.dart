import 'package:elixir/data/model/indicate.dart';
import 'package:elixir/data/repository/github.dart';

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
    final comments =
        await _gitHubRepository.getReviewComments(repo: repo, num: num);

    final elixirComments = comments
        .where((comment) => comment.body.contains('generatedBy: Elixir'));

    return indicates.where((indicate) {
      // If commitId, path, line, and body are all the same, then it is excluded from the list.
      return !elixirComments.any((comment) =>
          comment.originalCommitId == indicate.commitId &&
          comment.path == indicate.path &&
          comment.line == indicate.line &&
          comment.body.contains('hashCode: ${indicate.diagHashCode}'));
    });
  }
}
