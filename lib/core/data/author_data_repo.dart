import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sard/models/author_model.dart';

class AuthorDataRepo {
  List<AuthorModel>? _authorDataRepo;

  Future<List<AuthorModel>> getAuthors() async {
    if (_authorDataRepo != null) return _authorDataRepo!;

    final response = await rootBundle.loadString('assets/data/author.json');
    final Map<String, dynamic> decodedData = jsonDecode(response);

    final List<dynamic> authorsList = decodedData['author'];

    _authorDataRepo = authorsList
        .map((item) => AuthorModel.fromMap(item))
        .toList();

    return _authorDataRepo!;
  }

  Future<AuthorModel> getAuthorById(int id) async {
    final authors = await getAuthors();

    return authors.firstWhere(
      (author) => author.authorId == id,
      orElse: () => throw Exception("Author not found"),
    );
  }
}
