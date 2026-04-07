class AuthorModel {
  final String authorName;
  final String summary;
  final String color;
  final int authorId;

  AuthorModel({
    required this.authorName,
    required this.summary,
    required this.color,
    required this.authorId,
  });

  factory AuthorModel.fromMap(Map<String, dynamic> json) {
    return AuthorModel(
      authorName: json['authorName'],
      summary: json['summary'],
      color: json['color'],
      authorId: json['authorId'],
    );
  }

}
