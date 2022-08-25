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

/// 400
class BadRequest extends GitHubException {
  const BadRequest() : super('Bad Request');
}

/// 401
class RequiresAuthentication extends GitHubException {
  const RequiresAuthentication() : super('Requires authentication');
}

/// 403
class Forbidden extends GitHubException {
  const Forbidden() : super('Forbidden');
}

/// 404
class NotFound extends GitHubException {
  const NotFound() : super('Resource not found');
}

/// 422
class ValidationFailed extends GitHubException {
  const ValidationFailed() : super('Validation Failed');
}

/// 429
class TooManyRequests extends GitHubException {
  const TooManyRequests() : super('Too Many Requests');
}

/// 500
class InternalError extends GitHubException {
  const InternalError() : super('Internal Error');
}

/// 503
class ServiceUnavailable extends GitHubException {
  const ServiceUnavailable() : super('Service unavailable');
}

/// Other
class Unknown extends GitHubException {
  const Unknown() : super('Unknown');
}
