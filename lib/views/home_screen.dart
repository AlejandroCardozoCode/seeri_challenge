import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seeri/bloc/movies/movies_bloc.dart';
import 'package:seeri/bloc/movies/movies_state.dart';
import 'package:seeri/theme/theme.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CarouselMoviesWidget(),
        const ButtonsGenderWidget(),
        Expanded(
          child: BlocBuilder<MoviesBloc, MoviesState>(
            builder: (context, state) {
              return MoviesGridWidget(
                movies: state.genreMoviesList,
              );
            },
          ),
        )
      ],
    );
  }
}
