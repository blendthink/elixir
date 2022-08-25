import 'package:args/args.dart' show ArgResults;
import 'package:elixir/cli/extension.dart';
import 'package:elixir/cli/option.dart';

class HeadOption extends Option {
  HeadOption()
      : super(
          _name,
          abbr: 'c',
          help: 'set pull request head',
          mandatory: true,
        );

  static const _name = 'head';

  static String head(
    ArgResults argResults,
    Never Function(String message) usageException,
  ) {
    final head = argResults.requireParam(_name);
    if (head.isEmpty) {
      usageException('head is empty');
    }
    return head;
  }
}
