// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'indicate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Indicate _$IndicateFromJson(Map<String, dynamic> json) {
  return _Indicate.fromJson(json);
}

/// @nodoc
mixin _$Indicate {
  String get body => throw _privateConstructorUsedError;
  String get commitId => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  int get line => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IndicateCopyWith<Indicate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IndicateCopyWith<$Res> {
  factory $IndicateCopyWith(Indicate value, $Res Function(Indicate) then) =
      _$IndicateCopyWithImpl<$Res>;
  $Res call({String body, String commitId, String path, int line});
}

/// @nodoc
class _$IndicateCopyWithImpl<$Res> implements $IndicateCopyWith<$Res> {
  _$IndicateCopyWithImpl(this._value, this._then);

  final Indicate _value;
  // ignore: unused_field
  final $Res Function(Indicate) _then;

  @override
  $Res call({
    Object? body = freezed,
    Object? commitId = freezed,
    Object? path = freezed,
    Object? line = freezed,
  }) {
    return _then(_value.copyWith(
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      commitId: commitId == freezed
          ? _value.commitId
          : commitId // ignore: cast_nullable_to_non_nullable
              as String,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      line: line == freezed
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_IndicateCopyWith<$Res> implements $IndicateCopyWith<$Res> {
  factory _$$_IndicateCopyWith(
          _$_Indicate value, $Res Function(_$_Indicate) then) =
      __$$_IndicateCopyWithImpl<$Res>;
  @override
  $Res call({String body, String commitId, String path, int line});
}

/// @nodoc
class __$$_IndicateCopyWithImpl<$Res> extends _$IndicateCopyWithImpl<$Res>
    implements _$$_IndicateCopyWith<$Res> {
  __$$_IndicateCopyWithImpl(
      _$_Indicate _value, $Res Function(_$_Indicate) _then)
      : super(_value, (v) => _then(v as _$_Indicate));

  @override
  _$_Indicate get _value => super._value as _$_Indicate;

  @override
  $Res call({
    Object? body = freezed,
    Object? commitId = freezed,
    Object? path = freezed,
    Object? line = freezed,
  }) {
    return _then(_$_Indicate(
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      commitId: commitId == freezed
          ? _value.commitId
          : commitId // ignore: cast_nullable_to_non_nullable
              as String,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      line: line == freezed
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Indicate implements _Indicate {
  const _$_Indicate(
      {required this.body,
      required this.commitId,
      required this.path,
      required this.line});

  factory _$_Indicate.fromJson(Map<String, dynamic> json) =>
      _$$_IndicateFromJson(json);

  @override
  final String body;
  @override
  final String commitId;
  @override
  final String path;
  @override
  final int line;

  @override
  String toString() {
    return 'Indicate(body: $body, commitId: $commitId, path: $path, line: $line)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Indicate &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality().equals(other.commitId, commitId) &&
            const DeepCollectionEquality().equals(other.path, path) &&
            const DeepCollectionEquality().equals(other.line, line));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(commitId),
      const DeepCollectionEquality().hash(path),
      const DeepCollectionEquality().hash(line));

  @JsonKey(ignore: true)
  @override
  _$$_IndicateCopyWith<_$_Indicate> get copyWith =>
      __$$_IndicateCopyWithImpl<_$_Indicate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IndicateToJson(this);
  }
}

abstract class _Indicate implements Indicate {
  const factory _Indicate(
      {required final String body,
      required final String commitId,
      required final String path,
      required final int line}) = _$_Indicate;

  factory _Indicate.fromJson(Map<String, dynamic> json) = _$_Indicate.fromJson;

  @override
  String get body => throw _privateConstructorUsedError;
  @override
  String get commitId => throw _privateConstructorUsedError;
  @override
  String get path => throw _privateConstructorUsedError;
  @override
  int get line => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_IndicateCopyWith<_$_Indicate> get copyWith =>
      throw _privateConstructorUsedError;
}
