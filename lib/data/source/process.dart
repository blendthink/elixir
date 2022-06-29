import 'dart:io';

import 'package:sign/util/log.dart';

class ProcessRunner {
  final String _executable;

  const ProcessRunner(this._executable);

  Future<String> run(
    List<String> args,
  ) async {
    log.i("$_executable ${args.join(' ')}");

    final result = await Process.run(_executable, args);

    final stdout = result.stdout as String;
    final stderr = result.stderr as String;

    if (stdout.isNotEmpty) log.i(stdout.trim());
    if (stderr.isNotEmpty) log.e(stderr);

    if (result.exitCode != 0) {
      throw ProcessException._(result);
    }

    return stdout;
  }
}

class ProcessException implements Exception {
  final ProcessResult result;

  ProcessException._(this.result);

  @override
  String toString() => 'failed with exit code ${result.exitCode}';
}
