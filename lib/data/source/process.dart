import 'dart:io';

import 'package:elixir/util/log.dart';

class ProcessRunner {
  const ProcessRunner(this._executable);

  final String _executable;

  Future<String> run(
    List<String> args, {
    bool ignoreError = false,
  }) async {
    log.i("$_executable ${args.join(' ')}");

    final result = await Process.run(_executable, args);

    final stdout = result.stdout as String;
    final stderr = result.stderr as String;

    if (stdout.isNotEmpty) log.i(stdout.trim());
    if (stderr.isNotEmpty) log.e(stderr);

    if (result.exitCode != 0 && !ignoreError) {
      throw ProcessException(result.exitCode);
    }

    return stdout;
  }
}

class ProcessException implements Exception {
  const ProcessException(this.exitCode);

  final int exitCode;

  @override
  String toString() => 'failed with exit code $exitCode';
}
