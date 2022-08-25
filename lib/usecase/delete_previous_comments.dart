import 'package:elixir/data/keys.dart';
import 'package:elixir/data/repository/github.dart';

class DeletePreviousCommentsUseCase {
  const DeletePreviousCommentsUseCase({
    required GitHubRepository gitHubRepository,
  }) : _gitHubRepository = gitHubRepository;

  final GitHubRepository _gitHubRepository;

  Future<void> call({
    required String repo,
    required int num,
  }) async {
    final previousComments = await _gitHubRepository.listReviewComments(
      repo: repo,
      num: num,
    );

    final filteredPreviousComments =
        previousComments.where((comment) => comment.body.contains(elixirKey));

    for (final comment in filteredPreviousComments) {
      await _gitHubRepository.deleteReviewComment(
        repo: repo,
        commentId: comment.id,
      );
    }
  }
}
