import 'package:args/args.dart';
import 'package:sign/cli/option.dart';

class VersionFlag extends Flag {
  static const _name = 'version';

  VersionFlag()
      : super(
          _name,
          abbr: 'v',
          help: 'Print this package version.',
          negatable: false,
        );

  static bool enabled(ArgResults argResults) {
    return argResults.wasParsed(_name);
  }
}
