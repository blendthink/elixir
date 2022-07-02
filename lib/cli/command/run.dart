import 'dart:async';
import 'dart:convert';

import 'package:args/args.dart' show ArgResults;
import 'package:args/command_runner.dart';
import 'package:elixir/cli/extension.dart';
import 'package:elixir/cli/option/base.dart';
import 'package:elixir/cli/option/dir.dart';
import 'package:elixir/cli/option/head.dart';
import 'package:elixir/cli/option/num.dart';
import 'package:elixir/cli/option/repo.dart';
import 'package:elixir/usecase/comment_indicates.dart';
import 'package:elixir/usecase/filter_indicates.dart';
import 'package:elixir/usecase/get_indicates.dart';
import 'package:elixir/util/log.dart';

class RunCommand extends Command<dynamic> {
  @override
  String get name => 'run';

  @override
  String get description =>
      'Run `dart analyze` and comment on the GitHub Pull Request.';

  final _encoder = JsonEncoder.withIndent('  ');

  final GetIndicatesUseCase _getIndicates;
  final FilterIndicatesUseCase _filterIndicates;
  final CommentIndicatesUseCase _commentIndicates;

  RunCommand({
    GetIndicatesUseCase getIndicates = const GetIndicatesUseCase(),
    FilterIndicatesUseCase filterIndicates = const FilterIndicatesUseCase(),
    CommentIndicatesUseCase commentIndicates = const CommentIndicatesUseCase(),
  })  : _getIndicates = getIndicates,
        _filterIndicates = filterIndicates,
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
  FutureOr<dynamic>? run() async {
    final repo = RepoOption.repo(argResults, usageException);
    final num = NumOption.num(argResults, usageException);
    final base = BaseOption.base(argResults, usageException);
    final head = HeadOption.head(argResults, usageException);
    final dir = DirOption.dir(argResults, usageException);

    final indicates = await _getIndicates(
      dir: dir,
      base: base,
      head: head,
    );
    if (indicates.isEmpty) {
      return;
    }

    final filteredIndicates = await _filterIndicates(
      repo: repo,
      num: num,
      indicates: indicates,
    );
    if (filteredIndicates.isEmpty) {
      log.i('In this Pull Request ( #$num ), no issues found!');
      return;
    }

    final reviewComments = await _commentIndicates(
      repo: repo,
      num: num,
      indicates: filteredIndicates,
    );
    log.i(_encoder.convert(reviewComments));
  }

  @override
  ArgResults get argResults =>
      super.argResults ??
      usageException('argResults cannot be used before Command.run is called.');
}
