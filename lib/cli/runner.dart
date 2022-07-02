import 'package:args/command_runner.dart';
import 'package:signpost/cli/extension.dart';
import 'package:signpost/cli/flag/version.dart';
import 'package:signpost/gen/pubspec.dart';
import 'package:signpost/util/log.dart';

class SignCommandRunner extends CommandRunner {
  SignCommandRunner()
      : super(
          'Sign',
          'Tool for commenting `dart analyze` results to GitHub PullRequest.',
        ) {
    argParser.addFlags([
      VersionFlag(),
    ]);
  }

  @override
  Future run(Iterable<String> args) async {
    final argResults = parse(args);

    if (VersionFlag.enabled(argResults)) {
      log.i(pubspec.version);
      return;
    }

    return Future.sync(() => runCommand(argResults));
  }
}
