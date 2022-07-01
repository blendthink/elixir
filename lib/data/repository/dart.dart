import 'package:sign/data/source/process.dart';

class DartRepository {
  final ProcessRunner _runner;

  const DartRepository({
    ProcessRunner runner = const ProcessRunner('dart'),
  }) : _runner = runner;

  Future<String> analyze() async {
    return await _runner.run(['analyze']);
  }
}
