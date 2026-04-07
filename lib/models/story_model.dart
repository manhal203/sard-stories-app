class StoryModel {
  final int id;
  final String title;
  final String description;
  final String content;
  final String age;
  final int review;
  final String image;
  final int authorId;

  StoryModel({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.age,
    required this.review,
    required this.image,
    required this.authorId,
  });

  factory StoryModel.fromMap(Map<String, dynamic> json) {
    return StoryModel(
      id: json['id'] ,
      title: json['title'],
      description: json['description'],
      content: json['content'],
      age: json['age'],
      review: json['review'],
      image: json['image'],
      authorId: json['authorId'] ,
    );
  }
}