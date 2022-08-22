class Comment {
  const Comment({
    required this.path,
    required this.position,
    required this.body,
  });

  final String path;
  final int position;
  final String body;

  Map<String, dynamic> toJson() => {
        'path': path,
        'position': position,
        'body': body,
      };
}
