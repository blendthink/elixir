import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:elixir/data/model/review_comment.dart';
import 'package:elixir/data/model/user.dart';
import 'package:elixir/data/repository/github.dart';
import 'package:elixir/data/source/process.dart';
import 'package:test/test.dart';

import 'github_test.mocks.dart';

@GenerateMocks([ProcessRunner])
Future<void> main() async {
  final runner = MockProcessRunner();
  final repository = GitHubRepository(runner: runner);

  group('getUser', () {
    test('User is octocat.', () async {
      when(runner.run(any)).thenAnswer((_) async =>
          '''{"login":"octocat","id":1,"node_id":"MDQ6VXNlcjE=","avatar_url":"https://github.com/images/error/octocat_happy.gif","gravatar_id":"","url":"https://api.github.com/users/octocat","html_url":"https://github.com/octocat","followers_url":"https://api.github.com/users/octocat/followers","following_url":"https://api.github.com/users/octocat/following{/other_user}","gists_url":"https://api.github.com/users/octocat/gists{/gist_id}","starred_url":"https://api.github.com/users/octocat/starred{/owner}{/repo}","subscriptions_url":"https://api.github.com/users/octocat/subscriptions","organizations_url":"https://api.github.com/users/octocat/orgs","repos_url":"https://api.github.com/users/octocat/repos","events_url":"https://api.github.com/users/octocat/events{/privacy}","received_events_url":"https://api.github.com/users/octocat/received_events","type":"User","site_admin":false,"name":"monalisa octocat","company":"GitHub","blog":"https://github.com/blog","location":"San Francisco","email":"octocat@github.com","hireable":false,"bio":"There once was...","twitter_username":"monatheoctocat","public_repos":2,"public_gists":1,"followers":20,"following":0,"created_at":"2008-01-14T04:33:35Z","updated_at":"2008-01-14T04:33:35Z","private_gists":81,"total_private_repos":100,"owned_private_repos":100,"disk_usage":10000,"collaborators":8,"two_factor_authentication":true,"plan":{"name":"Medium","space":400,"private_repos":20,"collaborators":0}}''');

      final expected = User(login: 'octocat', id: 1);

      final actual = await repository.getUser();
      expect(actual, expected);
    });

    test('Throw ProcessException.', () async {
      when(runner.run(any)).thenThrow(const ProcessException(1));
      expect(
        () async => await repository.getUser(),
        throwsA(TypeMatcher<ProcessException>()),
      );
    });
  });

  group('getReviewComments', () {
    test('One review comment exists.', () async {
      when(runner.run(any)).thenAnswer((_) async =>
          '''[{"url":"https://api.github.com/repos/octocat/Hello-World/pulls/comments/1","pull_request_review_id":42,"id":10,"node_id":"MDI0OlB1bGxSZXF1ZXN0UmV2aWV3Q29tbWVudDEw","diff_hunk":"@@ -16,33 +16,40 @@ public class Connection : IConnection...","path":"file1.txt","position":1,"original_position":4,"commit_id":"6dcb09b5b57875f334f61aebed695e2e4193db5e","original_commit_id":"9c48853fa3dc5c1c3d6f1f1cd1f2743e72652840","in_reply_to_id":8,"user":{"login":"octocat","id":1,"node_id":"MDQ6VXNlcjE=","avatar_url":"https://github.com/images/error/octocat_happy.gif","gravatar_id":"","url":"https://api.github.com/users/octocat","html_url":"https://github.com/octocat","followers_url":"https://api.github.com/users/octocat/followers","following_url":"https://api.github.com/users/octocat/following{/other_user}","gists_url":"https://api.github.com/users/octocat/gists{/gist_id}","starred_url":"https://api.github.com/users/octocat/starred{/owner}{/repo}","subscriptions_url":"https://api.github.com/users/octocat/subscriptions","organizations_url":"https://api.github.com/users/octocat/orgs","repos_url":"https://api.github.com/users/octocat/repos","events_url":"https://api.github.com/users/octocat/events{/privacy}","received_events_url":"https://api.github.com/users/octocat/received_events","type":"User","site_admin":false},"body":"Great stuff!","created_at":"2011-04-14T16:00:49Z","updated_at":"2011-04-14T16:00:49Z","html_url":"https://github.com/octocat/Hello-World/pull/1#discussion-diff-1","pull_request_url":"https://api.github.com/repos/octocat/Hello-World/pulls/1","author_association":"NONE","_links":{"self":{"href":"https://api.github.com/repos/octocat/Hello-World/pulls/comments/1"},"html":{"href":"https://github.com/octocat/Hello-World/pull/1#discussion-diff-1"},"pull_request":{"href":"https://api.github.com/repos/octocat/Hello-World/pulls/1"}},"start_line":1,"original_start_line":1,"start_side":"RIGHT","line":2,"original_line":2,"side":"RIGHT"}]''');

      final expected = [
        ReviewComment(
          path: 'file1.txt',
          originalCommitId: '6dcb09b5b57875f334f61aebed695e2e4193db5e',
          user: User(login: 'octocat', id: 1),
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
        originalCommitId: '6dcb09b5b57875f334f61aebed695e2e4193db5e',
        user: User(login: 'octocat', id: 1),
        body: 'Great stuff!',
        line: 2,
      );

      final actual = await repository.createReviewComment(
        repo: 'octocat/Hello-World',
        num: 1,
        body: 'Great stuff!',
        commitId: '6dcb09b5b57875f334f61aebed695e2e4193db5e',
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
          commitId: '6dcb09b5b57875f334f61aebed695e2e4193db5e',
          path: 'file1.txt',
          line: 2,
        ),
        throwsA(TypeMatcher<ProcessException>()),
      );
    });
  });
}
