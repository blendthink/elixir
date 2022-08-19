import 'package:args/args.dart' show ArgResults;
import 'package:elixir/cli/extension.dart';
import 'package:elixir/cli/option.dart';

class NumOption extends Option {
  NumOption()
      : super(
          _name,
          abbr: 'n',
          help: 'set pull request num',
          mandatory: true,
        );

  static const _name = 'num';

  static int num(
    ArgResults argResults,
    Never Function(String message) usageException,
  ) {
    final num = argResults.requireParam(_name);
    final numInt = int.parse(num);
    if (numInt <= 0) {
      usageException('num is not a natural number: $num');
    }
    return numInt;
  }
}
