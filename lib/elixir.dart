import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:elixir/cli/runner.dart';
import 'package:elixir/util/log.dart';

Future<void> run(List<String> args) async {
  final exitStatus = await _run(args);
  await exitStatus.flushThenExit();
}

Future<ExitStatus> _run(List<String> args) async {
  try {
    await ElixirCommandRunner().run(args);
    return ExitStatus.success;
  } on UsageException catch (e) {
    log.w(e);
    return ExitStatus.usage;
  } on Exception catch (e) {
    log.e(e);
    return ExitStatus.error;
  }
}

enum ExitStatus {
  success,
  usage,
  error,
}

extension ExitStatusExt on ExitStatus {
  int get code {
    switch (this) {
      case ExitStatus.success:
        return 0;
      case ExitStatus.usage:
        return 64;
      case ExitStatus.error:
        return 1;
    }
  }

  Future<void> flushThenExit() async => Future.wait(
        [
          stdout.close(),
          stderr.close(),
        ],
      ).then((_) => exit(code));
}
