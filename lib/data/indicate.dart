import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sign/data/indicate_type.dart';

part 'indicate.freezed.dart';

part 'indicate.g.dart';

@freezed
abstract class Indicate with _$Indicate {
  const factory Indicate({
    required IndicateType type,
    @Assert('message.isNotEmpty') required String message,
    @Assert('path.isNotEmpty') required String path,
    @Assert('row >= 1') required int row,
    @Assert('column >= 1') required int column,
    @Assert('summary.isNotEmpty') required String summary,
  }) = _Indicate;

  factory Indicate.fromJson(Map<String, Object?> json) =>
      _$IndicateFromJson(json);
}

extension IndicateExt on Indicate {
  String get _title {
    switch (type) {
      case IndicateType.info:
        return ':speech_balloon: **Info**';
      case IndicateType.warning:
        return ':warning: **Warning**';
      case IndicateType.error:
        return ':fire: **Error**';
    }
  }

  String get comment => '''
> $_title : `$summary`
> $message''';
}
