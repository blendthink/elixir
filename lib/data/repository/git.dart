import 'package:signpost/data/source/process.dart';

class GitRepository {
  final ProcessRunner _runner;

  const GitRepository({
    ProcessRunner runner = const ProcessRunner('git'),
  }) : _runner = runner;

  /// git log {base}..{head} --format=%H -n 1 -L {line},+1:{path} | grep -E '^([0-9|a-z]){40}'
  ///
  /// If there is no commit between {base} and {head}: ''
  /// If a commit exists between {base} and {head}: e.g. '6d87458a8089ae5d025b087bfb9b0809d2060411'
  Future<String> getLatestCommitId({
    required String base,
    required String head,
    required String path,
    required int line,
  }) async {
    return _runner.run([
      'log',
      '$base..$head',
      '--format=%H',
      '-n',
      '1',
      '-L',
      '$line,+1:$path',
      '|',
      'grep',
      '-E',
      "'^([0-9|a-z]){40}'",
    ]);
  }
}
