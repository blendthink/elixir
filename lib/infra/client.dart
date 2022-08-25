import 'package:elixir/data/model/exception/github.dart';
import 'package:http/http.dart'
    show BaseClient, Client, BaseRequest, StreamedResponse;

class GitHubClient extends BaseClient {
  GitHubClient({
    required Client client,
    required String token,
  })  : _client = client,
        _token = token;

  final Client _client;
  final String _token;

  final _authority = 'api.github.com';

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    request.headers['Accept'] = 'application/vnd.github+json';
    request.headers['Authorization'] = 'token $_token';
    return _client.send(request);
  }

  Future<String> getRequest({
    required String path,
  }) async {
    final url = Uri.https(_authority, path);
    final response = await super.get(url);
    _checkStatusCode(response.statusCode);
    return response.body;
  }

  Future<String> postRequest({
    required String path,
    required String data,
  }) async {
    final url = Uri.https(_authority, path);
    final response = await super.post(url, body: data);
    _checkStatusCode(response.statusCode);
    return response.body;
  }

  Future<void> deleteRequest({
    required String path,
  }) async {
    final url = Uri.https(_authority, path);
    final response = await super.delete(url);
    _checkStatusCode(response.statusCode);
  }

  void _checkStatusCode(int statusCode) {
    switch (statusCode) {
      case 200:
      case 201:
      case 204:
        return;
      case 400:
        throw const BadRequest();
      case 401:
        throw const RequiresAuthentication();
      case 403:
        throw const Forbidden();
      case 404:
        throw const NotFound();
      case 422:
        throw const ValidationFailed();
      case 429:
        throw const TooManyRequests();
      case 500:
        throw const InternalError();
      case 503:
        throw const ServiceUnavailable();
      default:
        throw const Unknown();
    }
  }

  @override
  void close() => _client.close();
}
