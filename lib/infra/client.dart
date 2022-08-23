import 'package:http/http.dart';

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

  Future<String> postRequest({
    required String path,
    required Map<String, String> data,
  }) async {
    final url = Uri.https(_authority, path);
    final response = await post(url, body: data);
    final statusCode = response.statusCode;
    switch (statusCode) {
      case 200:
        return response.body;
      case 403:
        throw Exception();
      case 422:
        throw Exception();
      default:
        throw Exception();
    }
  }

  @override
  void close() {
    _client.close();
    super.close();
  }
}
