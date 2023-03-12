import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/movies/movies_bloc.dart';
import '../bloc/movies/movies_state.dart';
import '../widgets/widgets.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchBarWidget(),
        Expanded(
          child: BlocBuilder<MoviesBloc, MoviesState>(
            builder: (context, state) {
              return MoviesGridWidget(
                movies: state.searchResult,
              );
            },
          ),
        )
      ],
    );
  }
}
