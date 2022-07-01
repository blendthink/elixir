import 'package:args/args.dart' show ArgResults;
import 'package:sign/cli/extension.dart';
import 'package:sign/cli/option.dart';

class NumOption extends Option {
  static const _name = 'num';

  NumOption()
      : super(
          _name,
          abbr: 'n',
          help: 'set pull request num',
          mandatory: true,
        );

  static int num(
    ArgResults argResults,
    Never Function(String message) usageException,
  ) {
    final num = argResults.requireParam<int>(_name);
    if (num <= 0) {
      usageException('num is not a natural number: $num');
    }
    return num;
  }
}
