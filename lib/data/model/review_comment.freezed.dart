// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'review_comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReviewComment _$ReviewCommentFromJson(Map<String, dynamic> json) {
  return _ReviewComment.fromJson(json);
}

/// @nodoc
mixin _$ReviewComment {
  String get path => throw _privateConstructorUsedError;
  String get originalCommitId => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  int? get line => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewCommentCopyWith<ReviewComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCommentCopyWith<$Res> {
  factory $ReviewCommentCopyWith(
          ReviewComment value, $Res Function(ReviewComment) then) =
      _$ReviewCommentCopyWithImpl<$Res>;
  $Res call({String path, String originalCommitId, String body, int? line});
}

/// @nodoc
class _$ReviewCommentCopyWithImpl<$Res>
    implements $ReviewCommentCopyWith<$Res> {
  _$ReviewCommentCopyWithImpl(this._value, this._then);

  final ReviewComment _value;
  // ignore: unused_field
  final $Res Function(ReviewComment) _then;

  @override
  $Res call({
    Object? path = freezed,
    Object? originalCommitId = freezed,
    Object? body = freezed,
    Object? line = freezed,
  }) {
    return _then(_value.copyWith(
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      originalCommitId: originalCommitId == freezed
          ? _value.originalCommitId
          : originalCommitId // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      line: line == freezed
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_ReviewCommentCopyWith<$Res>
    implements $ReviewCommentCopyWith<$Res> {
  factory _$$_ReviewCommentCopyWith(
          _$_ReviewComment value, $Res Function(_$_ReviewComment) then) =
      __$$_ReviewCommentCopyWithImpl<$Res>;
  @override
  $Res call({String path, String originalCommitId, String body, int? line});
}

/// @nodoc
class __$$_ReviewCommentCopyWithImpl<$Res>
    extends _$ReviewCommentCopyWithImpl<$Res>
    implements _$$_ReviewCommentCopyWith<$Res> {
  __$$_ReviewCommentCopyWithImpl(
      _$_ReviewComment _value, $Res Function(_$_ReviewComment) _then)
      : super(_value, (v) => _then(v as _$_ReviewComment));

  @override
  _$_ReviewComment get _value => super._value as _$_ReviewComment;

  @override
  $Res call({
    Object? path = freezed,
    Object? originalCommitId = freezed,
    Object? body = freezed,
    Object? line = freezed,
  }) {
    return _then(_$_ReviewComment(
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      originalCommitId: originalCommitId == freezed
          ? _value.originalCommitId
          : originalCommitId // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      line: line == freezed
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_ReviewComment implements _ReviewComment {
  const _$_ReviewComment(
      {required this.path,
      required this.originalCommitId,
      required this.body,
      this.line});

  factory _$_ReviewComment.fromJson(Map<String, dynamic> json) =>
      _$$_ReviewCommentFromJson(json);

  @override
  final String path;
  @override
  final String originalCommitId;
  @override
  final String body;
  @override
  final int? line;

  @override
  String toString() {
    return 'ReviewComment(path: $path, originalCommitId: $originalCommitId, body: $body, line: $line)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReviewComment &&
            const DeepCollectionEquality().equals(other.path, path) &&
            const DeepCollectionEquality()
                .equals(other.originalCommitId, originalCommitId) &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality().equals(other.line, line));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(path),
      const DeepCollectionEquality().hash(originalCommitId),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(line));

  @JsonKey(ignore: true)
  @override
  _$$_ReviewCommentCopyWith<_$_ReviewComment> get copyWith =>
      __$$_ReviewCommentCopyWithImpl<_$_ReviewComment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReviewCommentToJson(this);
  }
}

abstract class _ReviewComment implements ReviewComment {
  const factory _ReviewComment(
      {required final String path,
      required final String originalCommitId,
      required final String body,
      final int? line}) = _$_ReviewComment;

  factory _ReviewComment.fromJson(Map<String, dynamic> json) =
      _$_ReviewComment.fromJson;

  @override
  String get path => throw _privateConstructorUsedError;
  @override
  String get originalCommitId => throw _privateConstructorUsedError;
  @override
  String get body => throw _privateConstructorUsedError;
  @override
  int? get line => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewCommentCopyWith<_$_ReviewComment> get copyWith =>
      throw _privateConstructorUsedError;
}
