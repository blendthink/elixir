import 'package:elixir/data/source/process.dart';

class GitRepository {
  const GitRepository({
    ProcessRunner runner = const ProcessRunner('git'),
  }) : _runner = runner;

  final ProcessRunner _runner;

  /// git log {base}..{head} --format=%H -n 1 -L {line},+1:{path}
  ///
  /// If there is no commit between {base} and {head}: ''
  ///
  /// If a commit exists between {base} and {head}: e.g.:
  /// '6d87458a8089ae5d025b087bfb9b0809d2060411'
  Future<String> getLatestCommitId({
    required String base,
    required String head,
    required String path,
    required int line,
  }) async {
    final result = await _runner.run([
      'log',
      '$base..$head',
      '--format=%H',
      '-n',
      '1',
      '-L',
      '$line,+1:$path',
    ]);

    final regex = RegExp(r'^([\d|a-z]{40})');
    final match = regex.firstMatch(result);
    if (match == null) {
      return '';
    }

    return match.group(1) ?? '';
  }
}
