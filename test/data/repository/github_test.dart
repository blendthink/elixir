import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:elixir/data/model/review_comment.dart';
import 'package:elixir/data/repository/github.dart';
import 'package:elixir/data/source/process.dart';
import 'package:test/test.dart';

import 'github_test.mocks.dart';

@GenerateMocks([ProcessRunner])
Future<void> main() async {
  final runner = MockProcessRunner();
  final repository = GitHubRepository(runner: runner);

  group('getReviewComments', () {
    test('One review comment exists.', () async {
      when(runner.run(any)).thenAnswer((_) async =>
          '''[{"url":"https://api.github.com/repos/octocat/Hello-World/pulls/comments/1","pull_request_review_id":42,"id":10,"node_id":"MDI0OlB1bGxSZXF1ZXN0UmV2aWV3Q29tbWVudDEw","diff_hunk":"@@ -16,33 +16,40 @@ public class Connection : IConnection...","path":"file1.txt","position":1,"original_position":4,"commit_id":"6dcb09b5b57875f334f61aebed695e2e4193db5e","original_commit_id":"9c48853fa3dc5c1c3d6f1f1cd1f2743e72652840","in_reply_to_id":8,"user":{"login":"octocat","id":1,"node_id":"MDQ6VXNlcjE=","avatar_url":"https://github.com/images/error/octocat_happy.gif","gravatar_id":"","url":"https://api.github.com/users/octocat","html_url":"https://github.com/octocat","followers_url":"https://api.github.com/users/octocat/followers","following_url":"https://api.github.com/users/octocat/following{/other_user}","gists_url":"https://api.github.com/users/octocat/gists{/gist_id}","starred_url":"https://api.github.com/users/octocat/starred{/owner}{/repo}","subscriptions_url":"https://api.github.com/users/octocat/subscriptions","organizations_url":"https://api.github.com/users/octocat/orgs","repos_url":"https://api.github.com/users/octocat/repos","events_url":"https://api.github.com/users/octocat/events{/privacy}","received_events_url":"https://api.github.com/users/octocat/received_events","type":"User","site_admin":false},"body":"Great stuff!","created_at":"2011-04-14T16:00:49Z","updated_at":"2011-04-14T16:00:49Z","html_url":"https://github.com/octocat/Hello-World/pull/1#discussion-diff-1","pull_request_url":"https://api.github.com/repos/octocat/Hello-World/pulls/1","author_association":"NONE","_links":{"self":{"href":"https://api.github.com/repos/octocat/Hello-World/pulls/comments/1"},"html":{"href":"https://github.com/octocat/Hello-World/pull/1#discussion-diff-1"},"pull_request":{"href":"https://api.github.com/repos/octocat/Hello-World/pulls/1"}},"start_line":1,"original_start_line":1,"start_side":"RIGHT","line":2,"original_line":2,"side":"RIGHT"}]''');

      final expected = [
        ReviewComment(
          path: 'file1.txt',
          originalCommitId: '9c48853fa3dc5c1c3d6f1f1cd1f2743e72652840',
          body: 'Great stuff!',
          line: 2,
        ),
      ];

      final actual = await repository.getReviewComments(
          repo: 'octocat/Hello-World', num: 1);
      expect(actual, expected);
    });

    test('Throw ProcessException.', () async {
      when(runner.run(any)).thenThrow(const ProcessException(1));
      expect(
        () async => await repository.getReviewComments(
            repo: 'octocat/Hello-World', num: 1),
        throwsA(TypeMatcher<ProcessException>()),
      );
    });
  });

  group('createReviewComment', () {
    test('Success.', () async {
      when(runner.run(any)).thenAnswer((_) async =>
          '''{"url":"https://api.github.com/repos/octocat/Hello-World/pulls/comments/1","pull_request_review_id":42,"id":10,"node_id":"MDI0OlB1bGxSZXF1ZXN0UmV2aWV3Q29tbWVudDEw","diff_hunk":"@@ -16,33 +16,40 @@ public class Connection : IConnection...","path":"file1.txt","position":1,"original_position":4,"commit_id":"6dcb09b5b57875f334f61aebed695e2e4193db5e","original_commit_id":"9c48853fa3dc5c1c3d6f1f1cd1f2743e72652840","in_reply_to_id":8,"user":{"login":"octocat","id":1,"node_id":"MDQ6VXNlcjE=","avatar_url":"https://github.com/images/error/octocat_happy.gif","gravatar_id":"","url":"https://api.github.com/users/octocat","html_url":"https://github.com/octocat","followers_url":"https://api.github.com/users/octocat/followers","following_url":"https://api.github.com/users/octocat/following{/other_user}","gists_url":"https://api.github.com/users/octocat/gists{/gist_id}","starred_url":"https://api.github.com/users/octocat/starred{/owner}{/repo}","subscriptions_url":"https://api.github.com/users/octocat/subscriptions","organizations_url":"https://api.github.com/users/octocat/orgs","repos_url":"https://api.github.com/users/octocat/repos","events_url":"https://api.github.com/users/octocat/events{/privacy}","received_events_url":"https://api.github.com/users/octocat/received_events","type":"User","site_admin":false},"body":"Great stuff!","created_at":"2011-04-14T16:00:49Z","updated_at":"2011-04-14T16:00:49Z","html_url":"https://github.com/octocat/Hello-World/pull/1#discussion-diff-1","pull_request_url":"https://api.github.com/repos/octocat/Hello-World/pulls/1","author_association":"NONE","_links":{"self":{"href":"https://api.github.com/repos/octocat/Hello-World/pulls/comments/1"},"html":{"href":"https://github.com/octocat/Hello-World/pull/1#discussion-diff-1"},"pull_request":{"href":"https://api.github.com/repos/octocat/Hello-World/pulls/1"}},"start_line":1,"original_start_line":1,"start_side":"RIGHT","line":2,"original_line":2,"side":"RIGHT"}''');

      final expected = ReviewComment(
        path: 'file1.txt',
        originalCommitId: '9c48853fa3dc5c1c3d6f1f1cd1f2743e72652840',
        body: 'Great stuff!',
        line: 2,
      );

      final actual = await repository.createReviewComment(
        repo: 'octocat/Hello-World',
        num: 1,
        body: 'Great stuff!',
        commitId: '9c48853fa3dc5c1c3d6f1f1cd1f2743e72652840',
        path: 'file1.txt',
        line: 2,
      );
      expect(actual, expected);
    });

    test('Throw ProcessException.', () async {
      when(runner.run(any)).thenThrow(const ProcessException(1));
      expect(
        () async => await repository.createReviewComment(
          repo: 'octocat/Hello-World',
          num: 1,
          body: 'Great stuff!',
          commitId: '9c48853fa3dc5c1c3d6f1f1cd1f2743e72652840',
          path: 'file1.txt',
          line: 2,
        ),
        throwsA(TypeMatcher<ProcessException>()),
      );
    });
  });
}
