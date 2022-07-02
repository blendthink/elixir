import 'dart:convert';
import 'dart:io';

import 'package:elixir/data/model/analysis.dart';
import 'package:elixir/data/source/process.dart';

class DartRepository {
  final ProcessRunner _runner;

  const DartRepository({
    ProcessRunner runner = const ProcessRunner('dart'),
  }) : _runner = runner;

  Future<AnalysisResults> analyze({
    required Directory dir,
  }) async {
    final result = await _runner.run(
      ['analyze', '--format=json', dir.path],
      ignoreError: true,
    );

    final jsonStart = result.indexOf('{');
    final jsonEnd = result.lastIndexOf('}');
    if (jsonStart == -1 || jsonEnd == -1) {
      return AnalysisResults(version: 0, diagnostics: const []);
    }

    final jsonContent = result.substring(jsonStart, jsonEnd + 1);
    return AnalysisResults.fromJson(jsonDecode(jsonContent));
  }
}
