import 'dart:convert';

import 'package:sign/data/model/user.dart';
import 'package:sign/data/source/process.dart';

class GitHubRepository {
  final ProcessRunner _runner;

  GitHubRepository({
    ProcessRunner runner = const ProcessRunner('gh'),
  }) : _runner = runner;

  Future<User> getUser() async {
    final result = await _runner.run([
      'api',
      '-H',
      'Accept: application/vnd.github.v3+json',
      '/user',
    ]);

    return User.fromJson(jsonDecode(result));
  }
}
