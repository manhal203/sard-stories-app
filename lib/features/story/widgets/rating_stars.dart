import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final int rating;

  const RatingStars({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    final stars = List<Widget>.generate(5, (index) {
      return Icon(
        index < rating ? Icons.star : Icons.star_border,
        color: Colors.amber,
        size: 20,
      );
    });

    return Row(children: stars);
  }
}