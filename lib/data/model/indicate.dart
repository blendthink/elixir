import 'package:freezed_annotation/freezed_annotation.dart';

part 'indicate.freezed.dart';

part 'indicate.g.dart';

@freezed
abstract class Indicate with _$Indicate {
  const factory Indicate({
    required String diagHash,
    required String body,
    required String commitId,
    required String path,
    required int line,
  }) = _Indicate;

  factory Indicate.fromJson(Map<String, Object?> json) =>
      _$IndicateFromJson(json);
}
