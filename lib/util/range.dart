import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class Range {
  final int start;
  final int end;

  const Range(this.start, this.end);

  bool contains(int value) => start <= value && end >= value;
}

extension IntToRange on int {
  Range convertToRange(int length) {
    if (length <= 0) ArgumentError.value(length);
    return Range(this, this + length - 1);
  }
}
