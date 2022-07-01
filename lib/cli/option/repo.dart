import 'package:args/args.dart' show ArgResults;
import 'package:sign/cli/extension.dart';
import 'package:sign/cli/option.dart';

class RepoOption extends Option {
  static const _name = 'repo';

  RepoOption()
      : super(
          _name,
          abbr: 'r',
          help: 'set pull request repo',
          mandatory: true,
        );

  static String repo(
    ArgResults argResults,
    Never Function(String message) usageException,
  ) {
    final repo = argResults.requireParam<String>(_name);
    if (!RegExp(r'^.+/.+').hasMatch(repo)) {
      usageException('repo is not GitHub Repository: $repo');
    }
    return repo;
  }
}
