import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/movies/movies_bloc.dart';
import '../bloc/movies/movies_state.dart';
import '../models/models.dart';
import '../theme/theme.dart';
import '../widgets/widgets.dart';

class MovieScreen extends StatelessWidget {
  final String movieTittle;
  final String movieGenre;
  final double movieRate;
  final String movieDescription;
  final String movieImageBanner;
  const MovieScreen({
    super.key,
    required this.movieTittle,
    required this.movieGenre,
    required this.movieRate,
    required this.movieDescription,
    required this.movieImageBanner,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeApp.black_1,
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            CustomMovieAppWidget(
              bannerImage: movieImageBanner,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  MovieInfoWidget(
                    movieGenre: movieGenre,
                    movieRate: movieRate,
                    movieTittle: movieTittle,
                    movieDescription: movieDescription,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Reseñas",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  BlocBuilder<MoviesBloc, MoviesState>(
                    builder: (context, state) {
                      List<ReviewModel> reviews = state.movieReviews;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.movieReviews.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ReviewWidget(
                            imageUrl: reviews[index].authorDetails.getFullPathImagePoster,
                            userName: reviews[index].author,
                            rate: reviews[index].authorDetails.rating.toString(),
                            review: reviews[index].content,
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
