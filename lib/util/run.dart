import 'dart:io';

import 'package:sign/util/log.dart';

String run(
  String executable, {
  List<String> arguments = const [],
  String? workingDirectory,
}) {
  log.i("$executable ${arguments.join(' ')}");
  final result = Process.runSync(executable, arguments);

  final stdout = result.stdout as String;
  final stderr = result.stderr as String;

  if (stdout.isNotEmpty) log.i(stdout.trim());
  if (stderr.isNotEmpty) log.e(result.stderr);

  if (result.exitCode != 0) {
    throw ProcessException._(executable, result.exitCode, stdout, stderr);
  }

  return stdout;
}

class ProcessException implements Exception {
  final String executable;
  final int exitCode;
  final String stdout;
  final String stderr;

  ProcessException._(this.executable, this.exitCode, this.stdout, this.stderr);

  @override
  String toString() => 'failed with exit code $exitCode';
}
