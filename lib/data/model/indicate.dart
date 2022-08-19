class Indicate {
  const Indicate({
    required this.body,
    required this.commitId,
    required this.path,
    required this.line,
  });

  final String body;
  final String commitId;
  final String path;
  final int line;
}
