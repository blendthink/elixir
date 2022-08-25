class Comment {
  const Comment({
    required this.path,
    required this.line,
    required this.body,
  });

  final String path;
  final int line;
  final String body;

  Map<String, dynamic> toJson() => {
        'path': path,
        'line': line,
        'body': body,
      };
}
