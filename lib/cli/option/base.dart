import 'package:args/args.dart' show ArgResults;
import 'package:elixir/cli/extension.dart';
import 'package:elixir/cli/option.dart';

class BaseOption extends Option {
  BaseOption()
      : super(
          _name,
          abbr: 'b',
          help: 'set pull request base',
          mandatory: true,
        );

  static const _name = 'base';

  static String base(
    ArgResults argResults,
    Never Function(String message) usageException,
  ) {
    final base = argResults.requireParam(_name);
    if (base.isEmpty) {
      usageException('base is empty');
    }
    return base;
  }
}
