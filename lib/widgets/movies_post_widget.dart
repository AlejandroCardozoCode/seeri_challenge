import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:seeri/bloc/movies/movies_bloc.dart';
import 'package:seeri/bloc/movies/movies_state.dart';
import 'package:seeri/theme/theme.dart';

import '../models/models.dart';

class MoviesPostWidget extends StatelessWidget {
  final bool isFavorite;
  final MovieModel movie;
  const MoviesPostWidget({super.key, required this.isFavorite, required this.movie});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        return Center(
          child: SizedBox(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200,
                  width: 150,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      FadeInImage(
                        placeholder: const AssetImage("assets/img/placeholder.png"),
                        image: NetworkImage(movie.getFullPathImagePoster),
                        fit: BoxFit.cover,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          child: getIcon(),
                          onTap: () {
                            BlocProvider.of<MoviesBloc>(context).add(AddFavorite(movie));
                          },
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  movie.title,
                  style: const TextStyle(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingBarIndicator(
                        rating: (movie.voteAverage * 5) / 10,
                        unratedColor: Colors.grey[600],
                        itemCount: 5,
                        itemSize: 20,
                        itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            )),
                    Text(
                      movie.voteAverage.toStringAsFixed(1),
                      style: const TextStyle(color: Colors.yellow),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Icon getIcon() {
    if (isFavorite) {
      return const Icon(
        Icons.favorite,
        color: Colors.red,
        size: 30,
      );
    }
    return const Icon(
      Icons.favorite_border,
      color: Colors.white,
      size: 30,
    );
  }
}
