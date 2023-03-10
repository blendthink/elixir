import 'dart:async';

import 'package:args/args.dart' show ArgResults;
import 'package:args/command_runner.dart';
import 'package:elixir/cli/extension.dart';
import 'package:elixir/cli/option/base.dart';
import 'package:elixir/cli/option/dir.dart';
import 'package:elixir/cli/option/head.dart';
import 'package:elixir/cli/option/num.dart';
import 'package:elixir/cli/option/repo.dart';
import 'package:elixir/usecase/comment_indicates.dart';
import 'package:elixir/usecase/delete_previous_comments.dart';
import 'package:elixir/usecase/get_indicates.dart';
import 'package:elixir/util/log.dart';

class RunCommand extends Command<dynamic> {
  RunCommand({
    required DeletePreviousCommentsUseCase deletePreviousComments,
    required CommentIndicatesUseCase commentIndicates,
    GetIndicatesUseCase getIndicates = const GetIndicatesUseCase(),
  })  : _getIndicates = getIndicates,
        _deletePreviousComments = deletePreviousComments,
        _commentIndicates = commentIndicates {
    argParser.addOptions([
      RepoOption(),
      NumOption(),
      BaseOption(),
      HeadOption(),
      DirOption(),
    ]);
  }

  @override
  String get name => 'run';

  @override
  String get description =>
      'Run `dart analyze` and comment on the GitHub Pull Request.';

  final GetIndicatesUseCase _getIndicates;
  final DeletePreviousCommentsUseCase _deletePreviousComments;
  final CommentIndicatesUseCase _commentIndicates;

  @override
  FutureOr<dynamic>? run() async {
    final repo = RepoOption.repo(argResults, usageException);
    final num = NumOption.num(argResults, usageException);
    final base = BaseOption.base(argResults, usageException);
    final head = HeadOption.head(argResults, usageException);
    final dir = DirOption.dir(argResults, usageException);

    await _deletePreviousComments(repo: repo, num: num);

    final indicates = await _getIndicates(
      dir: dir,
      base: base,
      head: head,
    );
    if (indicates.isEmpty) {
      log.i('In this Pull Request ( #$num ), no issues found!');
      return;
    }

    final result = await _commentIndicates(
      repo: repo,
      num: num,
      indicates: indicates,
    );
    log.i(result);
  }

  @override
  ArgResults get argResults =>
      super.argResults ??
      usageException('argResults cannot be used before Command.run is called.');
}
