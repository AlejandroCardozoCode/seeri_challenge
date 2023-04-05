import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seeri/theme/theme.dart';
import 'package:seeri/widgets/appbar_widget.dart';

import '../bloc/movies/movies_bloc.dart';
import '../bloc/movies/movies_state.dart';
import '../widgets/movies_genre_grid_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        return child(state);
      },
    );
  }

  Widget child(MoviesState state) {
    if (state.favoriteMovies.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Agrega una película a favoritos para verla aquí",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      );
    }
    return MoviesGridWidget(
      movies: state.favoriteMovies,
    );
  }
}
