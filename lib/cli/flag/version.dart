import 'package:args/args.dart';
import 'package:elixir/cli/option.dart';

class VersionFlag extends Flag {
  VersionFlag()
      : super(
          _name,
          abbr: 'v',
          help: 'Print this package version.',
          negatable: false,
        );

  static const _name = 'version';

  static bool enabled(ArgResults argResults) => argResults.wasParsed(_name);
}
