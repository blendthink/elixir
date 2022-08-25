import 'package:args/args.dart';

abstract class Flag extends _BaseOption<bool> {
  Flag(
    String name, {
    String? abbr,
    String? help,
    bool? defaultsTo = false,
    bool negatable = true,
    void Function(bool?)? callback,
    bool hide = false,
    List<String> aliases = const [],
  }) : super(
          name,
          abbr,
          help,
          null,
          null,
          null,
          defaultsTo,
          callback == null ? null : (value) => callback(value),
          OptionType.flag,
          negatable: negatable,
          hide: hide,
          aliases: aliases,
        );
}

abstract class Option extends _BaseOption<String> {
  Option(
    String name, {
    String? abbr,
    String? help,
    String? valueHelp,
    Iterable<String>? allowed,
    Map<String, String>? allowedHelp,
    String? defaultsTo,
    void Function(String?)? callback,
    bool mandatory = false,
    bool hide = false,
    List<String> aliases = const [],
  }) : super(
          name,
          abbr,
          help,
          valueHelp,
          allowed,
          allowedHelp,
          defaultsTo,
          callback,
          OptionType.single,
          mandatory: mandatory,
          hide: hide,
          aliases: aliases,
        );
}

abstract class _BaseOption<T> {
  _BaseOption(
    this.name,
    this.abbr,
    this.help,
    this.valueHelp,
    this.allowed,
    this.allowedHelp,
    this.defaultsTo,
    this.callback,
    this.type, {
    this.negatable = false,
    this.splitCommas,
    this.mandatory = false,
    this.hide = false,
    this.aliases = const [],
  });

  final String name;
  final String? abbr;
  final String? help;
  final String? valueHelp;
  final Iterable<String>? allowed;
  final Map<String, String>? allowedHelp;
  final T? defaultsTo;
  final void Function(T?)? callback;
  final OptionType type;
  final bool negatable;
  final bool? splitCommas;
  final bool mandatory;
  final bool hide;
  final List<String> aliases;
}
