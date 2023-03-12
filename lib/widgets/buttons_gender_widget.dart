import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seeri/bloc/movies/movies_bloc.dart';
import 'package:seeri/bloc/movies/movies_state.dart';
import 'package:seeri/theme/theme.dart';

class ButtonsGenderWidget extends StatelessWidget {
  const ButtonsGenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        print(state.genreList.length);
        return Container(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: state.genreList.map((item) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<MoviesBloc>(context).add(SetGenre(item.id));
                    BlocProvider.of<MoviesBloc>(context).add(GenreMovies());
                  },
                  child: Text(item.name),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
