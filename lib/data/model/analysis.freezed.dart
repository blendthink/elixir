// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'analysis.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnalysisResults _$AnalysisResultsFromJson(Map<String, dynamic> json) {
  return _AnalysisResults.fromJson(json);
}

/// @nodoc
mixin _$AnalysisResults {
  int get version => throw _privateConstructorUsedError;
  List<Diagnostic> get diagnostics => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnalysisResultsCopyWith<AnalysisResults> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalysisResultsCopyWith<$Res> {
  factory $AnalysisResultsCopyWith(
          AnalysisResults value, $Res Function(AnalysisResults) then) =
      _$AnalysisResultsCopyWithImpl<$Res>;
  $Res call({int version, List<Diagnostic> diagnostics});
}

/// @nodoc
class _$AnalysisResultsCopyWithImpl<$Res>
    implements $AnalysisResultsCopyWith<$Res> {
  _$AnalysisResultsCopyWithImpl(this._value, this._then);

  final AnalysisResults _value;
  // ignore: unused_field
  final $Res Function(AnalysisResults) _then;

  @override
  $Res call({
    Object? version = freezed,
    Object? diagnostics = freezed,
  }) {
    return _then(_value.copyWith(
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      diagnostics: diagnostics == freezed
          ? _value.diagnostics
          : diagnostics // ignore: cast_nullable_to_non_nullable
              as List<Diagnostic>,
    ));
  }
}

/// @nodoc
abstract class _$$_AnalysisResultsCopyWith<$Res>
    implements $AnalysisResultsCopyWith<$Res> {
  factory _$$_AnalysisResultsCopyWith(
          _$_AnalysisResults value, $Res Function(_$_AnalysisResults) then) =
      __$$_AnalysisResultsCopyWithImpl<$Res>;
  @override
  $Res call({int version, List<Diagnostic> diagnostics});
}

/// @nodoc
class __$$_AnalysisResultsCopyWithImpl<$Res>
    extends _$AnalysisResultsCopyWithImpl<$Res>
    implements _$$_AnalysisResultsCopyWith<$Res> {
  __$$_AnalysisResultsCopyWithImpl(
      _$_AnalysisResults _value, $Res Function(_$_AnalysisResults) _then)
      : super(_value, (v) => _then(v as _$_AnalysisResults));

  @override
  _$_AnalysisResults get _value => super._value as _$_AnalysisResults;

  @override
  $Res call({
    Object? version = freezed,
    Object? diagnostics = freezed,
  }) {
    return _then(_$_AnalysisResults(
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      diagnostics: diagnostics == freezed
          ? _value._diagnostics
          : diagnostics // ignore: cast_nullable_to_non_nullable
              as List<Diagnostic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AnalysisResults implements _AnalysisResults {
  const _$_AnalysisResults(
      {required this.version, required final List<Diagnostic> diagnostics})
      : _diagnostics = diagnostics;

  factory _$_AnalysisResults.fromJson(Map<String, dynamic> json) =>
      _$$_AnalysisResultsFromJson(json);

  @override
  final int version;
  final List<Diagnostic> _diagnostics;
  @override
  List<Diagnostic> get diagnostics {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diagnostics);
  }

  @override
  String toString() {
    return 'AnalysisResults(version: $version, diagnostics: $diagnostics)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnalysisResults &&
            const DeepCollectionEquality().equals(other.version, version) &&
            const DeepCollectionEquality()
                .equals(other._diagnostics, _diagnostics));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(version),
      const DeepCollectionEquality().hash(_diagnostics));

  @JsonKey(ignore: true)
  @override
  _$$_AnalysisResultsCopyWith<_$_AnalysisResults> get copyWith =>
      __$$_AnalysisResultsCopyWithImpl<_$_AnalysisResults>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnalysisResultsToJson(this);
  }
}

abstract class _AnalysisResults implements AnalysisResults {
  const factory _AnalysisResults(
      {required final int version,
      required final List<Diagnostic> diagnostics}) = _$_AnalysisResults;

  factory _AnalysisResults.fromJson(Map<String, dynamic> json) =
      _$_AnalysisResults.fromJson;

  @override
  int get version => throw _privateConstructorUsedError;
  @override
  List<Diagnostic> get diagnostics => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AnalysisResultsCopyWith<_$_AnalysisResults> get copyWith =>
      throw _privateConstructorUsedError;
}

Diagnostic _$DiagnosticFromJson(Map<String, dynamic> json) {
  return _Diagnostic.fromJson(json);
}

/// @nodoc
mixin _$Diagnostic {
  String get code => throw _privateConstructorUsedError;
  DiagnosticSeverity get severity => throw _privateConstructorUsedError;
  DiagnosticType get type => throw _privateConstructorUsedError;
  Location get location => throw _privateConstructorUsedError;
  String get problemMessage => throw _privateConstructorUsedError;
  String? get correctionMessage => throw _privateConstructorUsedError;
  List<ContextMessage>? get contextMessages =>
      throw _privateConstructorUsedError;
  String? get documentation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiagnosticCopyWith<Diagnostic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagnosticCopyWith<$Res> {
  factory $DiagnosticCopyWith(
          Diagnostic value, $Res Function(Diagnostic) then) =
      _$DiagnosticCopyWithImpl<$Res>;
  $Res call(
      {String code,
      DiagnosticSeverity severity,
      DiagnosticType type,
      Location location,
      String problemMessage,
      String? correctionMessage,
      List<ContextMessage>? contextMessages,
      String? documentation});

  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class _$DiagnosticCopyWithImpl<$Res> implements $DiagnosticCopyWith<$Res> {
  _$DiagnosticCopyWithImpl(this._value, this._then);

  final Diagnostic _value;
  // ignore: unused_field
  final $Res Function(Diagnostic) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? severity = freezed,
    Object? type = freezed,
    Object? location = freezed,
    Object? problemMessage = freezed,
    Object? correctionMessage = freezed,
    Object? contextMessages = freezed,
    Object? documentation = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      severity: severity == freezed
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as DiagnosticSeverity,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DiagnosticType,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      problemMessage: problemMessage == freezed
          ? _value.problemMessage
          : problemMessage // ignore: cast_nullable_to_non_nullable
              as String,
      correctionMessage: correctionMessage == freezed
          ? _value.correctionMessage
          : correctionMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      contextMessages: contextMessages == freezed
          ? _value.contextMessages
          : contextMessages // ignore: cast_nullable_to_non_nullable
              as List<ContextMessage>?,
      documentation: documentation == freezed
          ? _value.documentation
          : documentation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $LocationCopyWith<$Res> get location {
    return $LocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value));
    });
  }
}

/// @nodoc
abstract class _$$_DiagnosticCopyWith<$Res>
    implements $DiagnosticCopyWith<$Res> {
  factory _$$_DiagnosticCopyWith(
          _$_Diagnostic value, $Res Function(_$_Diagnostic) then) =
      __$$_DiagnosticCopyWithImpl<$Res>;
  @override
  $Res call(
      {String code,
      DiagnosticSeverity severity,
      DiagnosticType type,
      Location location,
      String problemMessage,
      String? correctionMessage,
      List<ContextMessage>? contextMessages,
      String? documentation});

  @override
  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$_DiagnosticCopyWithImpl<$Res> extends _$DiagnosticCopyWithImpl<$Res>
    implements _$$_DiagnosticCopyWith<$Res> {
  __$$_DiagnosticCopyWithImpl(
      _$_Diagnostic _value, $Res Function(_$_Diagnostic) _then)
      : super(_value, (v) => _then(v as _$_Diagnostic));

  @override
  _$_Diagnostic get _value => super._value as _$_Diagnostic;

  @override
  $Res call({
    Object? code = freezed,
    Object? severity = freezed,
    Object? type = freezed,
    Object? location = freezed,
    Object? problemMessage = freezed,
    Object? correctionMessage = freezed,
    Object? contextMessages = freezed,
    Object? documentation = freezed,
  }) {
    return _then(_$_Diagnostic(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      severity: severity == freezed
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as DiagnosticSeverity,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DiagnosticType,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      problemMessage: problemMessage == freezed
          ? _value.problemMessage
          : problemMessage // ignore: cast_nullable_to_non_nullable
              as String,
      correctionMessage: correctionMessage == freezed
          ? _value.correctionMessage
          : correctionMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      contextMessages: contextMessages == freezed
          ? _value._contextMessages
          : contextMessages // ignore: cast_nullable_to_non_nullable
              as List<ContextMessage>?,
      documentation: documentation == freezed
          ? _value.documentation
          : documentation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Diagnostic implements _Diagnostic {
  const _$_Diagnostic(
      {required this.code,
      required this.severity,
      required this.type,
      required this.location,
      required this.problemMessage,
      this.correctionMessage,
      final List<ContextMessage>? contextMessages,
      this.documentation})
      : _contextMessages = contextMessages;

  factory _$_Diagnostic.fromJson(Map<String, dynamic> json) =>
      _$$_DiagnosticFromJson(json);

  @override
  final String code;
  @override
  final DiagnosticSeverity severity;
  @override
  final DiagnosticType type;
  @override
  final Location location;
  @override
  final String problemMessage;
  @override
  final String? correctionMessage;
  final List<ContextMessage>? _contextMessages;
  @override
  List<ContextMessage>? get contextMessages {
    final value = _contextMessages;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? documentation;

  @override
  String toString() {
    return 'Diagnostic(code: $code, severity: $severity, type: $type, location: $location, problemMessage: $problemMessage, correctionMessage: $correctionMessage, contextMessages: $contextMessages, documentation: $documentation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Diagnostic &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.severity, severity) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality()
                .equals(other.problemMessage, problemMessage) &&
            const DeepCollectionEquality()
                .equals(other.correctionMessage, correctionMessage) &&
            const DeepCollectionEquality()
                .equals(other._contextMessages, _contextMessages) &&
            const DeepCollectionEquality()
                .equals(other.documentation, documentation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(severity),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(problemMessage),
      const DeepCollectionEquality().hash(correctionMessage),
      const DeepCollectionEquality().hash(_contextMessages),
      const DeepCollectionEquality().hash(documentation));

  @JsonKey(ignore: true)
  @override
  _$$_DiagnosticCopyWith<_$_Diagnostic> get copyWith =>
      __$$_DiagnosticCopyWithImpl<_$_Diagnostic>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiagnosticToJson(this);
  }
}

abstract class _Diagnostic implements Diagnostic {
  const factory _Diagnostic(
      {required final String code,
      required final DiagnosticSeverity severity,
      required final DiagnosticType type,
      required final Location location,
      required final String problemMessage,
      final String? correctionMessage,
      final List<ContextMessage>? contextMessages,
      final String? documentation}) = _$_Diagnostic;

  factory _Diagnostic.fromJson(Map<String, dynamic> json) =
      _$_Diagnostic.fromJson;

  @override
  String get code => throw _privateConstructorUsedError;
  @override
  DiagnosticSeverity get severity => throw _privateConstructorUsedError;
  @override
  DiagnosticType get type => throw _privateConstructorUsedError;
  @override
  Location get location => throw _privateConstructorUsedError;
  @override
  String get problemMessage => throw _privateConstructorUsedError;
  @override
  String? get correctionMessage => throw _privateConstructorUsedError;
  @override
  List<ContextMessage>? get contextMessages =>
      throw _privateConstructorUsedError;
  @override
  String? get documentation => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DiagnosticCopyWith<_$_Diagnostic> get copyWith =>
      throw _privateConstructorUsedError;
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
mixin _$Location {
  String get file => throw _privateConstructorUsedError;
  Range get range => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res>;
  $Res call({String file, Range range});

  $RangeCopyWith<$Res> get range;
}

/// @nodoc
class _$LocationCopyWithImpl<$Res> implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  final Location _value;
  // ignore: unused_field
  final $Res Function(Location) _then;

  @override
  $Res call({
    Object? file = freezed,
    Object? range = freezed,
  }) {
    return _then(_value.copyWith(
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String,
      range: range == freezed
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as Range,
    ));
  }

  @override
  $RangeCopyWith<$Res> get range {
    return $RangeCopyWith<$Res>(_value.range, (value) {
      return _then(_value.copyWith(range: value));
    });
  }
}

/// @nodoc
abstract class _$$_LocationCopyWith<$Res> implements $LocationCopyWith<$Res> {
  factory _$$_LocationCopyWith(
          _$_Location value, $Res Function(_$_Location) then) =
      __$$_LocationCopyWithImpl<$Res>;
  @override
  $Res call({String file, Range range});

  @override
  $RangeCopyWith<$Res> get range;
}

/// @nodoc
class __$$_LocationCopyWithImpl<$Res> extends _$LocationCopyWithImpl<$Res>
    implements _$$_LocationCopyWith<$Res> {
  __$$_LocationCopyWithImpl(
      _$_Location _value, $Res Function(_$_Location) _then)
      : super(_value, (v) => _then(v as _$_Location));

  @override
  _$_Location get _value => super._value as _$_Location;

  @override
  $Res call({
    Object? file = freezed,
    Object? range = freezed,
  }) {
    return _then(_$_Location(
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String,
      range: range == freezed
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as Range,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Location implements _Location {
  const _$_Location({required this.file, required this.range});

  factory _$_Location.fromJson(Map<String, dynamic> json) =>
      _$$_LocationFromJson(json);

  @override
  final String file;
  @override
  final Range range;

  @override
  String toString() {
    return 'Location(file: $file, range: $range)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Location &&
            const DeepCollectionEquality().equals(other.file, file) &&
            const DeepCollectionEquality().equals(other.range, range));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(file),
      const DeepCollectionEquality().hash(range));

  @JsonKey(ignore: true)
  @override
  _$$_LocationCopyWith<_$_Location> get copyWith =>
      __$$_LocationCopyWithImpl<_$_Location>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocationToJson(this);
  }
}

abstract class _Location implements Location {
  const factory _Location(
      {required final String file, required final Range range}) = _$_Location;

  factory _Location.fromJson(Map<String, dynamic> json) = _$_Location.fromJson;

  @override
  String get file => throw _privateConstructorUsedError;
  @override
  Range get range => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LocationCopyWith<_$_Location> get copyWith =>
      throw _privateConstructorUsedError;
}

Range _$RangeFromJson(Map<String, dynamic> json) {
  return _Range.fromJson(json);
}

/// @nodoc
mixin _$Range {
  Position get start => throw _privateConstructorUsedError;
  Position get end => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RangeCopyWith<Range> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RangeCopyWith<$Res> {
  factory $RangeCopyWith(Range value, $Res Function(Range) then) =
      _$RangeCopyWithImpl<$Res>;
  $Res call({Position start, Position end});

  $PositionCopyWith<$Res> get start;
  $PositionCopyWith<$Res> get end;
}

/// @nodoc
class _$RangeCopyWithImpl<$Res> implements $RangeCopyWith<$Res> {
  _$RangeCopyWithImpl(this._value, this._then);

  final Range _value;
  // ignore: unused_field
  final $Res Function(Range) _then;

  @override
  $Res call({
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_value.copyWith(
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as Position,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as Position,
    ));
  }

  @override
  $PositionCopyWith<$Res> get start {
    return $PositionCopyWith<$Res>(_value.start, (value) {
      return _then(_value.copyWith(start: value));
    });
  }

  @override
  $PositionCopyWith<$Res> get end {
    return $PositionCopyWith<$Res>(_value.end, (value) {
      return _then(_value.copyWith(end: value));
    });
  }
}

/// @nodoc
abstract class _$$_RangeCopyWith<$Res> implements $RangeCopyWith<$Res> {
  factory _$$_RangeCopyWith(_$_Range value, $Res Function(_$_Range) then) =
      __$$_RangeCopyWithImpl<$Res>;
  @override
  $Res call({Position start, Position end});

  @override
  $PositionCopyWith<$Res> get start;
  @override
  $PositionCopyWith<$Res> get end;
}

/// @nodoc
class __$$_RangeCopyWithImpl<$Res> extends _$RangeCopyWithImpl<$Res>
    implements _$$_RangeCopyWith<$Res> {
  __$$_RangeCopyWithImpl(_$_Range _value, $Res Function(_$_Range) _then)
      : super(_value, (v) => _then(v as _$_Range));

  @override
  _$_Range get _value => super._value as _$_Range;

  @override
  $Res call({
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_$_Range(
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as Position,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as Position,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Range implements _Range {
  const _$_Range({required this.start, required this.end});

  factory _$_Range.fromJson(Map<String, dynamic> json) =>
      _$$_RangeFromJson(json);

  @override
  final Position start;
  @override
  final Position end;

  @override
  String toString() {
    return 'Range(start: $start, end: $end)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Range &&
            const DeepCollectionEquality().equals(other.start, start) &&
            const DeepCollectionEquality().equals(other.end, end));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(start),
      const DeepCollectionEquality().hash(end));

  @JsonKey(ignore: true)
  @override
  _$$_RangeCopyWith<_$_Range> get copyWith =>
      __$$_RangeCopyWithImpl<_$_Range>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RangeToJson(this);
  }
}

abstract class _Range implements Range {
  const factory _Range(
      {required final Position start, required final Position end}) = _$_Range;

  factory _Range.fromJson(Map<String, dynamic> json) = _$_Range.fromJson;

  @override
  Position get start => throw _privateConstructorUsedError;
  @override
  Position get end => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RangeCopyWith<_$_Range> get copyWith =>
      throw _privateConstructorUsedError;
}

Position _$PositionFromJson(Map<String, dynamic> json) {
  return _Position.fromJson(json);
}

/// @nodoc
mixin _$Position {
  int get offset => throw _privateConstructorUsedError;
  int get line => throw _privateConstructorUsedError;
  int get column => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PositionCopyWith<Position> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PositionCopyWith<$Res> {
  factory $PositionCopyWith(Position value, $Res Function(Position) then) =
      _$PositionCopyWithImpl<$Res>;
  $Res call({int offset, int line, int column});
}

/// @nodoc
class _$PositionCopyWithImpl<$Res> implements $PositionCopyWith<$Res> {
  _$PositionCopyWithImpl(this._value, this._then);

  final Position _value;
  // ignore: unused_field
  final $Res Function(Position) _then;

  @override
  $Res call({
    Object? offset = freezed,
    Object? line = freezed,
    Object? column = freezed,
  }) {
    return _then(_value.copyWith(
      offset: offset == freezed
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      line: line == freezed
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as int,
      column: column == freezed
          ? _value.column
          : column // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_PositionCopyWith<$Res> implements $PositionCopyWith<$Res> {
  factory _$$_PositionCopyWith(
          _$_Position value, $Res Function(_$_Position) then) =
      __$$_PositionCopyWithImpl<$Res>;
  @override
  $Res call({int offset, int line, int column});
}

/// @nodoc
class __$$_PositionCopyWithImpl<$Res> extends _$PositionCopyWithImpl<$Res>
    implements _$$_PositionCopyWith<$Res> {
  __$$_PositionCopyWithImpl(
      _$_Position _value, $Res Function(_$_Position) _then)
      : super(_value, (v) => _then(v as _$_Position));

  @override
  _$_Position get _value => super._value as _$_Position;

  @override
  $Res call({
    Object? offset = freezed,
    Object? line = freezed,
    Object? column = freezed,
  }) {
    return _then(_$_Position(
      offset: offset == freezed
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      line: line == freezed
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as int,
      column: column == freezed
          ? _value.column
          : column // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Position implements _Position {
  const _$_Position(
      {required this.offset, required this.line, required this.column});

  factory _$_Position.fromJson(Map<String, dynamic> json) =>
      _$$_PositionFromJson(json);

  @override
  final int offset;
  @override
  final int line;
  @override
  final int column;

  @override
  String toString() {
    return 'Position(offset: $offset, line: $line, column: $column)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Position &&
            const DeepCollectionEquality().equals(other.offset, offset) &&
            const DeepCollectionEquality().equals(other.line, line) &&
            const DeepCollectionEquality().equals(other.column, column));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(offset),
      const DeepCollectionEquality().hash(line),
      const DeepCollectionEquality().hash(column));

  @JsonKey(ignore: true)
  @override
  _$$_PositionCopyWith<_$_Position> get copyWith =>
      __$$_PositionCopyWithImpl<_$_Position>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PositionToJson(this);
  }
}

abstract class _Position implements Position {
  const factory _Position(
      {required final int offset,
      required final int line,
      required final int column}) = _$_Position;

  factory _Position.fromJson(Map<String, dynamic> json) = _$_Position.fromJson;

  @override
  int get offset => throw _privateConstructorUsedError;
  @override
  int get line => throw _privateConstructorUsedError;
  @override
  int get column => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PositionCopyWith<_$_Position> get copyWith =>
      throw _privateConstructorUsedError;
}

ContextMessage _$ContextMessageFromJson(Map<String, dynamic> json) {
  return _ContextMessage.fromJson(json);
}

/// @nodoc
mixin _$ContextMessage {
  Location get location => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContextMessageCopyWith<ContextMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContextMessageCopyWith<$Res> {
  factory $ContextMessageCopyWith(
          ContextMessage value, $Res Function(ContextMessage) then) =
      _$ContextMessageCopyWithImpl<$Res>;
  $Res call({Location location, String message});

  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class _$ContextMessageCopyWithImpl<$Res>
    implements $ContextMessageCopyWith<$Res> {
  _$ContextMessageCopyWithImpl(this._value, this._then);

  final ContextMessage _value;
  // ignore: unused_field
  final $Res Function(ContextMessage) _then;

  @override
  $Res call({
    Object? location = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $LocationCopyWith<$Res> get location {
    return $LocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value));
    });
  }
}

/// @nodoc
abstract class _$$_ContextMessageCopyWith<$Res>
    implements $ContextMessageCopyWith<$Res> {
  factory _$$_ContextMessageCopyWith(
          _$_ContextMessage value, $Res Function(_$_ContextMessage) then) =
      __$$_ContextMessageCopyWithImpl<$Res>;
  @override
  $Res call({Location location, String message});

  @override
  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$_ContextMessageCopyWithImpl<$Res>
    extends _$ContextMessageCopyWithImpl<$Res>
    implements _$$_ContextMessageCopyWith<$Res> {
  __$$_ContextMessageCopyWithImpl(
      _$_ContextMessage _value, $Res Function(_$_ContextMessage) _then)
      : super(_value, (v) => _then(v as _$_ContextMessage));

  @override
  _$_ContextMessage get _value => super._value as _$_ContextMessage;

  @override
  $Res call({
    Object? location = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_ContextMessage(
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContextMessage implements _ContextMessage {
  const _$_ContextMessage({required this.location, required this.message});

  factory _$_ContextMessage.fromJson(Map<String, dynamic> json) =>
      _$$_ContextMessageFromJson(json);

  @override
  final Location location;
  @override
  final String message;

  @override
  String toString() {
    return 'ContextMessage(location: $location, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContextMessage &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_ContextMessageCopyWith<_$_ContextMessage> get copyWith =>
      __$$_ContextMessageCopyWithImpl<_$_ContextMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContextMessageToJson(this);
  }
}

abstract class _ContextMessage implements ContextMessage {
  const factory _ContextMessage(
      {required final Location location,
      required final String message}) = _$_ContextMessage;

  factory _ContextMessage.fromJson(Map<String, dynamic> json) =
      _$_ContextMessage.fromJson;

  @override
  Location get location => throw _privateConstructorUsedError;
  @override
  String get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ContextMessageCopyWith<_$_ContextMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
