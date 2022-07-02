import 'package:args/args.dart' show ArgResults, ArgParser;

import 'package:elixir/cli/option.dart';

extension ArgResultsExt on ArgResults {
  T requireParam<T>(String name) {
    final p = optionalParam<T>(name);
    if (p == null) throw ArgumentError();
    return p;
  }

  T? optionalParam<T>(String name) =>
      this[name] is T ? (this[name] as T) : null;
}

extension ArgParserExt on ArgParser {
  void addFlags(List<Flag> flags) {
    for (final flag in flags) {
      addFlag(
        flag.name,
        abbr: flag.abbr,
        help: flag.help,
        defaultsTo: flag.defaultsTo,
        negatable: flag.negatable,
        callback: flag.callback,
        hide: flag.hide,
        aliases: flag.aliases,
      );
    }
  }

  void addOptions(List<Option> options) {
    for (final option in options) {
      addOption(
        option.name,
        abbr: option.abbr,
        help: option.help,
        valueHelp: option.valueHelp,
        allowed: option.allowed,
        allowedHelp: option.allowedHelp,
        defaultsTo: option.defaultsTo,
        callback: option.callback,
        mandatory: option.mandatory,
        hide: option.hide,
        aliases: option.aliases,
      );
    }
  }
}
