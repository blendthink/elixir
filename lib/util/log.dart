class Log {
  void i(Object? o) => print(o);
  void w(Object? o) => print('\x1B[33m$o\x1B[0m');
  void e(Object? o) {
    final message = '''
An unexpected error occurred.
Consider creating an issue on https://github.com/blendthink/sign/issues/new.

$o''' ;
    print('\x1B[31m$message\x1B[0m');
  }
}

final log = Log();
