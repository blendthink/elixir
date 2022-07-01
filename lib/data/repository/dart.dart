import 'dart:convert';

import 'package:sign/data/model/analysis.dart';
import 'package:sign/data/source/process.dart';

class DartRepository {
  final ProcessRunner _runner;

  const DartRepository({
    ProcessRunner runner = const ProcessRunner('dart'),
  }) : _runner = runner;

  Future<AnalysisResults> analyze() async {
    final result = await _runner.run(['analyze', '--format=json']);
    return AnalysisResults.fromJson(jsonDecode(result));
  }
}
