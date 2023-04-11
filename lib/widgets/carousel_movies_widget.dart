import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seeri/bloc/movies/movies_state.dart';

import '../bloc/movies/movies_bloc.dart';
import '../views/view.dart';

class CarouselMoviesWidget extends StatefulWidget {
  const CarouselMoviesWidget({super.key});

  @override
  State<CarouselMoviesWidget> createState() => _CarouselMoviesWidgetState();
}

class _CarouselMoviesWidgetState extends State<CarouselMoviesWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<MoviesBloc>(context).add(Featured());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          return SizedBox(
            height: 200,
            child: Swiper(
              autoplay: true,
              viewportFraction: 0.8,
              scale: 0.9,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    BlocProvider.of<MoviesBloc>(context).add(GetMovieReviews(state.featuredList[index].id.toString()));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieScreen(
                            movieTittle: state.featuredList[index].title,
                            movieGenre: state.getGenreNameById(state.featuredList[index].genreIds[0]),
                            movieRate: state.featuredList[index].voteAverage,
                            movieDescription: state.featuredList[index].overview,
                            movieImageBanner: state.featuredList[index].getFullPathImageBackdrop,
                          ),
                        ));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadeInImage(
                      placeholder: const AssetImage("assets/img/placeholder.png"),
                      image: NetworkImage(state.featuredList[index].getFullPathImageBackdrop),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              itemCount: state.featuredList.length,
            ),
          );
        },
      ),
    );
  }
}
