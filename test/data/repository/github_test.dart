import 'package:elixir/data/repository/github.dart';
import 'package:elixir/infra/client.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'github_test.mocks.dart';

@GenerateMocks([GitHubClient])
Future<void> main() async {
  final client = MockGitHubClient();
  final repository = GitHubRepository(client: client);

  group('createReview', () {
    test('One review comment exists.', () async {
      const expected = '''
{
  "id": 80,
  "node_id": "MDE3OlB1bGxSZXF1ZXN0UmV2aWV3ODA=",
  "user": {
    "login": "octocat",
    "id": 1,
    "node_id": "MDQ6VXNlcjE=",
    "avatar_url": "https://github.com/images/error/octocat_happy.gif",
    "gravatar_id": "",
    "url": "https://api.github.com/users/octocat",
    "html_url": "https://github.com/octocat",
    "followers_url": "https://api.github.com/users/octocat/followers",
    "following_url": "https://api.github.com/users/octocat/following{/other_user}",
    "gists_url": "https://api.github.com/users/octocat/gists{/gist_id}",
    "starred_url": "https://api.github.com/users/octocat/starred{/owner}{/repo}",
    "subscriptions_url": "https://api.github.com/users/octocat/subscriptions",
    "organizations_url": "https://api.github.com/users/octocat/orgs",
    "repos_url": "https://api.github.com/users/octocat/repos",
    "events_url": "https://api.github.com/users/octocat/events{/privacy}",
    "received_events_url": "https://api.github.com/users/octocat/received_events",
    "type": "User",
    "site_admin": false
  },
  "body": "This is close to perfect! Please address the suggested inline change.",
  "state": "CHANGES_REQUESTED",
  "html_url": "https://github.com/octocat/Hello-World/pull/12#pullrequestreview-80",
  "pull_request_url": "https://api.github.com/repos/octocat/Hello-World/pulls/12",
  "_links": {
    "html": {
      "href": "https://github.com/octocat/Hello-World/pull/12#pullrequestreview-80"
    },
    "pull_request": {
      "href": "https://api.github.com/repos/octocat/Hello-World/pulls/12"
    }
  },
  "submitted_at": "2019-11-17T17:43:43Z",
  "commit_id": "ecdd80bb57125d7ba9641ffaa4d7d2c19d3f3091",
  "author_association": "COLLABORATOR"
}''';
      when(client.postRequest(path: anyNamed('path'), data: anyNamed('data')))
          .thenAnswer(
        (_) async => expected,
      );
      final actual = await repository.createReview(
        repo: 'octocat/Hello-World',
        num: 12,
        issueCount: 2,
        comments: [],
      );
      expect(actual, expected);
    });

    test('Throw Exception.', () async {
      final expected = Exception();
      when(client.postRequest(path: anyNamed('path'), data: anyNamed('data')))
          .thenThrow(expected);
      expect(
        () => repository.createReview(
          repo: 'octocat/Hello-World',
          num: 12,
          issueCount: 2,
          comments: [],
        ),
        throwsException,
      );
    });
  });
}
