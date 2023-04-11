import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seeri/bloc/movies/movies_bloc.dart';
import 'package:seeri/bloc/movies/movies_state.dart';

import '../models/models.dart';
import '../views/view.dart';
import 'movies_post_widget.dart';

class MoviesGridWidget extends StatefulWidget {
  const MoviesGridWidget({super.key, required this.movies});
  final List<MovieModel> movies;

  @override
  State<MoviesGridWidget> createState() => _MoviesGridWidgetState();
}

class _MoviesGridWidgetState extends State<MoviesGridWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<MoviesBloc>(context).add(GenreMovies());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: GridView.count(
            physics: BouncingScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            children: widget.movies
                .map(
                  (item) => GestureDetector(
                    onTap: () {
                      BlocProvider.of<MoviesBloc>(context).add(GetMovieReviews(item.id.toString()));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieScreen(
                            movieTittle: item.title,
                            movieGenre: state.getGenreNameById(item.genreIds[0]),
                            movieRate: item.voteAverage,
                            movieDescription: item.overview,
                            movieImageBanner: item.getFullPathImageBackdrop,
                          ),
                        ),
                      );
                    },
                    child: MoviesPostWidget(
                      isFavorite: state.isFavoriteMovie(item.id),
                      movie: item,
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
