import 'dart:io';

import 'package:elixir/data/model/analyze_result.dart';
import 'package:elixir/data/model/indicate.dart';
import 'package:elixir/data/repository/dart.dart';
import 'package:elixir/data/repository/git.dart';

class GetIndicatesUseCase {
  const GetIndicatesUseCase({
    DartRepository dartRepository = const DartRepository(),
    GitRepository gitRepository = const GitRepository(),
  })  : _dartRepository = dartRepository,
        _gitRepository = gitRepository;

  final DartRepository _dartRepository;
  final GitRepository _gitRepository;

  Future<Iterable<Indicate>> call({
    required Directory dir,
    required String base,
    required String head,
  }) async {
    final results = await _dartRepository.analyze(dir: dir);

    final indicates = await Future.wait(
      results.map(
        (result) async {
          final message = result.message;
          final path = result.filePath;
          final line = result.line;

          final commitId = await _gitRepository.getLatestCommitId(
            base: base,
            head: head,
            path: path,
            line: line,
          );

          // If no diffs between {base} and {head}, then the commit id is empty.
          // In this case, it is excluded from the list.
          if (commitId.isEmpty) {
            return null;
          }

          return Indicate(
            message: message,
            path: path,
            position: line,
          );
        },
      ),
    );

    return indicates.whereType<Indicate>();
  }
}

extension _AnalyzeResultExt on AnalyzeResult {
  String get _emoji {
    switch (severity) {
      case Severity.info:
        return 'speech_balloon';
      case Severity.warning:
        return 'warning';
      case Severity.error:
        return 'rotating_light';
    }
  }

  String get message => '''
<tr>
  <td>:$_emoji:</td>
  <td>$errorMessage</td>
</tr>''';
}
