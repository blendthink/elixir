import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sign/data/indicate_type.dart';

part 'indicate.freezed.dart';

part 'indicate.g.dart';

@freezed
abstract class Indicate with _$Indicate {
  const factory Indicate({
    required IndicateType type,
    required String message,
    required String path,
    required int row,
    required int column,
    required String lintRule,
  }) = _Indicate;

  factory Indicate.fromJson(Map<String, Object?> json) =>
      _$IndicateFromJson(json);
}
