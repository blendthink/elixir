import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sign/data/model/diagnostics_type.dart';

part 'diagnostics.freezed.dart';

part 'diagnostics.g.dart';

@freezed
abstract class Diagnostics with _$Diagnostics {
  const factory Diagnostics({
    required DiagnosticsType type,
    @Assert('message.isNotEmpty') required String message,
    @Assert('path.isNotEmpty') required String path,
    @Assert('row >= 1') required int row,
    @Assert('column >= 1') required int column,
    @Assert('summary.isNotEmpty') required String summary,
  }) = _Diagnostics;

  factory Diagnostics.fromJson(Map<String, Object?> json) =>
      _$DiagnosticsFromJson(json);
}

extension DiagnosticsExt on Diagnostics {
  String get _title {
    switch (type) {
      case DiagnosticsType.info:
        return ':speech_balloon: **Info**';
      case DiagnosticsType.warning:
        return ':warning: **Warning**';
      case DiagnosticsType.error:
        return ':fire: **Error**';
    }
  }

  String get comment => '''
> $_title : `$summary`
> $message''';
}
