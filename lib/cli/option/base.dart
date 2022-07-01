import 'package:args/args.dart' show ArgResults;
import 'package:sign/cli/extension.dart';
import 'package:sign/cli/option.dart';

class BaseOption extends Option {
  static const _name = 'base';

  BaseOption()
      : super(
          _name,
          abbr: 'b',
          help: 'set pull request base',
          mandatory: true,
        );

  static String base(
    ArgResults argResults,
    Never Function(String message) usageException,
  ) {
    final base = argResults.requireParam<String>(_name);
    if (base.isEmpty) {
      usageException('base is empty');
    }
    return base;
  }
}
