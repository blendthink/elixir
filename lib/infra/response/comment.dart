class ReviewComment {
  ReviewComment({
    required this.id,
    required this.body,
  });

  factory ReviewComment.fromJson(Map<String, dynamic> map) => ReviewComment(
        id: map['id'] as int,
        body: map['body'] as String,
      );

  final int id;
  final String body;
}
