import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/movies/movies_bloc.dart';
import '../theme/theme.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: TextField(
        onSubmitted: (value) {
          BlocProvider.of<MoviesBloc>(context).add(SearchMovies(value));
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: ThemeApp.black_3,
          hintText: "Ingresa el nombre de una película",
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
