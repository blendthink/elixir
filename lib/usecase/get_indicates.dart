import 'package:path/path.dart' as p;
import 'package:sign/data/model/analysis.dart';
import 'package:sign/data/model/indicate.dart';
import 'package:sign/data/repository/dart.dart';

import 'package:sign/data/repository/git.dart';

class GetIndicatesUseCase {
  final DartRepository _dartRepository;
  final GitRepository _gitRepository;

  const GetIndicatesUseCase({
    DartRepository dartRepository = const DartRepository(),
    GitRepository gitRepository = const GitRepository(),
  })  : _dartRepository = dartRepository,
        _gitRepository = gitRepository;

  Future<List<Indicate>> call({
    required String base,
    required String head,
  }) async {
    final result = await _dartRepository.analyze();

    return Future.wait(result.diagnostics.map((diagnostic) async {
      final body = diagnostic.body;
      final path = p.relative(diagnostic.location.file);
      final line = diagnostic.location.range.start.line;

      final commitId = await _gitRepository.getLatestCommitId(
        base: base,
        head: head,
        path: path,
        line: line,
      );
      return Indicate(body: body, commitId: commitId, path: path, line: line);
    }));
  }
}

extension DiagnosticExt on Diagnostic {
  String get _title {
    switch (severity) {
      case DiagnosticSeverity.none:
        return ':eyes: **None**';
      case DiagnosticSeverity.info:
        return ':speech_balloon: **Info**';
      case DiagnosticSeverity.warning:
        return ':warning: **Warning**';
      case DiagnosticSeverity.error:
        return ':rotating_light: **Error**';
    }
  }

  String get body => '''
> $_title `$code`
> $problemMessage
''';
}
