import 'package:sign/data/converter/analyze.dart';
import 'package:sign/data/model/indicate.dart';
import 'package:sign/data/source/process.dart';

class DartRepository {
  final ProcessRunner _runner;

  const DartRepository({
    ProcessRunner runner = const ProcessRunner('dart'),
  }) : _runner = runner;

  Future<List<Indicate>> getIndicates() async {
    final result = await _runner.run(['analyze']);
    return AnalyzeConverter().convert(result);
  }
}
