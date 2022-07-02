import 'package:args/args.dart' show ArgResults;
import 'package:signpost/cli/extension.dart';
import 'package:signpost/cli/option.dart';

class HeadOption extends Option {
  static const _name = 'head';

  HeadOption()
      : super(
          _name,
          abbr: 'h',
          help: 'set pull request head',
          mandatory: true,
        );

  static String head(
    ArgResults argResults,
    Never Function(String message) usageException,
  ) {
    final head = argResults.requireParam<String>(_name);
    if (head.isEmpty) {
      usageException('head is empty');
    }
    return head;
  }
}
