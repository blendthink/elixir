import 'package:args/command_runner.dart';
import 'package:elixir/cli/command/run.dart';
import 'package:elixir/cli/extension.dart';
import 'package:elixir/cli/flag/version.dart';
import 'package:elixir/gen/version.dart';
import 'package:elixir/util/log.dart';

class ElixirCommandRunner extends CommandRunner<dynamic> {
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
  Future<dynamic> run(Iterable<String> args) async {
    final argResults = parse(args);

    if (VersionFlag.enabled(argResults)) {
      log.i(version);
      return;
    }

    return Future.sync(() => runCommand(argResults));
  }
}
