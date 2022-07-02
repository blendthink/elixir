import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:elixir/data/model/analysis.dart';
import 'package:elixir/data/model/indicate.dart';
import 'package:elixir/data/repository/dart.dart';

import 'package:elixir/data/repository/git.dart';

class GetIndicatesUseCase {
  final DartRepository _dartRepository;
  final GitRepository _gitRepository;

  const GetIndicatesUseCase({
    DartRepository dartRepository = const DartRepository(),
    GitRepository gitRepository = const GitRepository(),
  })  : _dartRepository = dartRepository,
        _gitRepository = gitRepository;

  Future<Iterable<Indicate>> call({
    required Directory dir,
    required String base,
    required String head,
  }) async {
    final result = await _dartRepository.analyze(dir: dir);

    final indicates = await Future.wait(result.diagnostics.map((diag) async {
      // If severity is none, then it is excluded from the list.
      if (diag.severity == DiagnosticSeverity.none) return null;

      final body = diag.body;
      final path = p.relative(diag.location.file);
      final line = diag.location.range.start.line;

      final commitId = await _gitRepository.getLatestCommitId(
        base: base,
        head: head,
        path: path,
        line: line,
      );

      // If there are no commits between {base} and {head}, then the commit id is empty.
      // In this case, it is excluded from the list.
      if (commitId.isEmpty) return null;

      return Indicate(body: body, commitId: commitId, path: path, line: line);
    }));

    return indicates.whereType<Indicate>();
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
> $problemMessage''';
}
