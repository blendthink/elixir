import 'package:args/args.dart' show ArgResults;
import 'package:elixir/cli/extension.dart';
import 'package:elixir/cli/option.dart';

class RepoOption extends Option {
  RepoOption()
      : super(
          _name,
          abbr: 'r',
          help: 'set pull request repo',
          mandatory: true,
        );

  static const _name = 'repo';

  static String repo(
    ArgResults argResults,
    Never Function(String message) usageException,
  ) {
    final repo = argResults.requireParam(_name);
    if (!RegExp('^.+/.+').hasMatch(repo)) {
      usageException('repo is not GitHub Repository: $repo');
    }
    return repo;
  }
}
