import 'package:flutter/material.dart';

import 'widgets.dart';

class MovieInfoWidget extends StatelessWidget {
  const MovieInfoWidget({
    super.key,
    required this.movieGenre,
    required this.movieRate,
    required this.movieTittle,
    required this.movieDescription,
  });

  final String movieGenre;
  final double movieRate;
  final String movieTittle;
  final String movieDescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            MovieTagWidget(
              text: movieGenre,
              color: Colors.white,
              useIcon: false,
            ),
            MovieTagWidget(
              text: movieRate.toStringAsFixed(1),
              color: Colors.yellow,
              useIcon: true,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            movieTittle,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(movieDescription),
        ),
      ],
    );
  }
}
