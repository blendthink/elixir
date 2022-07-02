import 'package:args/command_runner.dart';
import 'package:elixir/cli/command/run.dart';
import 'package:elixir/cli/extension.dart';
import 'package:elixir/cli/flag/version.dart';
import 'package:elixir/gen/pubspec.dart';
import 'package:elixir/util/log.dart';

class ElixirCommandRunner extends CommandRunner {
  ElixirCommandRunner()
      : super(
          'Elixir',
          'Tool for commenting `dart analyze` results to GitHub PullRequest.',
        ) {
    argParser.addFlags([
      VersionFlag(),
    ]);
    addCommand(RunCommand());
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
