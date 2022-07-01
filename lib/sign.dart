import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:sign/cli/runner.dart';

import 'package:sign/util/log.dart';

Future<void> run(List<String> args) async {
  final exitStatus = await _run(args);
  await exitStatus.flushThenExit();
}

Future<_ExitStatus> _run(List<String> args) async {
  try {
    await SignCommandRunner().run(args);
    return _ExitStatus.success;
  } on UsageException catch (e) {
    log.w(e);
    return _ExitStatus.usage;
  } on Exception catch (e) {
    log.e(e);
    return _ExitStatus.error;
  }
}

enum _ExitStatus {
  success(0),
  usage(64),
  error(1),
  ;

  final int code;

  const _ExitStatus(this.code);

  Future<void> flushThenExit() async {
    return Future.wait([stdout.close(), stderr.close()])
        .then((_) => exit(code));
  }
}
