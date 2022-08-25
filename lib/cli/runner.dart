import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:elixir/cli/command/run.dart';
import 'package:elixir/cli/extension.dart';
import 'package:elixir/cli/flag/version.dart';
import 'package:elixir/data/repository/github.dart';
import 'package:elixir/gen/version.gen.dart';
import 'package:elixir/infra/client.dart';
import 'package:elixir/usecase/comment_indicates.dart';
import 'package:elixir/usecase/delete_previous_comments.dart';
import 'package:elixir/util/log.dart';
import 'package:http/http.dart';

class ElixirCommandRunner extends CommandRunner<dynamic> {
  ElixirCommandRunner()
      : super(
          'Elixir',
          'Tool for commenting `dart analyze` results to GitHub PullRequest.',
        ) {
    argParser.addFlags([
      VersionFlag(),
    ]);

    final token = Platform.environment['GITHUB_TOKEN'] ?? '';

    final client = GitHubClient(
      client: Client(),
      token: token,
    );

    final repository = GitHubRepository(client: client);
    final deletePreviousCommentsUseCase = DeletePreviousCommentsUseCase(
      gitHubRepository: repository,
    );
    final commentIndicatesUseCase = CommentIndicatesUseCase(
      gitHubRepository: repository,
    );
    addCommand(
      RunCommand(
        deletePreviousComments: deletePreviousCommentsUseCase,
        commentIndicates: commentIndicatesUseCase,
      ),
    );
  }

  @override
  Future<dynamic> run(Iterable<String> args) async {
    final argResults = parse(args);

    if (VersionFlag.enabled(argResults)) {
      log.i(packageVersion);
      return;
    }

    return Future.sync(() => runCommand(argResults));
  }
}
