import 'package:meta/meta.dart';

@immutable
abstract class GitHubException implements Exception {
  const GitHubException(this.message);

  final String message;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GitHubException &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}

/// 403
class Forbidden extends GitHubException {
  const Forbidden() : super('Forbidden');
}

/// 422
class ValidationFailed extends GitHubException {
  const ValidationFailed() : super('Validation Failed');
}

/// Other
class Unknown extends GitHubException {
  const Unknown() : super('Unknown');
}
