import 'dart:io';

import 'package:elixir/data/model/analyze_result.dart';
import 'package:elixir/data/parser/analyze_result_parser.dart';
import 'package:elixir/data/source/process.dart';

const _parser = AnalyzeResultParser();

class DartRepository {
  const DartRepository({
    ProcessRunner runner = const ProcessRunner('dart'),
  }) : _runner = runner;

  final ProcessRunner _runner;

  Future<Iterable<AnalyzeResult>> analyze({
    required Directory dir,
  }) async {
    final result = await _runner.run(
      ['analyze', '--format=machine', dir.path],
      ignoreError: true,
    );

    return result.split('\n').map(_parser.parse).whereType<AnalyzeResult>();
  }
}
