import 'dart:convert';

import 'package:seeri/services/services.dart';

import '../../models/models.dart';

class MoviesState {
  final List<MovieModel> featuredList;
  final List<GenreModel> genreList;
  final List<MovieModel> genreMoviesList;
  final List<MovieModel> searchResult;
  final List<ReviewModel> movieReviews;
  // shared preferences
  final List<String> favoriteMoviesStringList;
  final List<MovieModel> favoriteMovies;

  int currentGenre = 28;

  MoviesState({
    required this.featuredList,
    required this.genreList,
    required this.currentGenre,
    required this.genreMoviesList,
    required this.searchResult,
    required this.movieReviews,
    required this.favoriteMovies,
    required this.favoriteMoviesStringList,
  });

  MoviesState copyWith({
    List<MovieModel>? featuredList,
    List<GenreModel>? genreList,
    int? currentGenre,
    List<MovieModel>? genreMoviesList,
    List<MovieModel>? searchResult,
    List<ReviewModel>? movieReviews,
    List<MovieModel>? favoriteMovies,
    List<String>? favoriteMoviesStringList,
  }) {
    return MoviesState(
      featuredList: featuredList ?? this.featuredList,
      genreList: genreList ?? this.genreList,
      genreMoviesList: genreMoviesList ?? this.genreMoviesList,
      currentGenre: currentGenre ?? this.currentGenre,
      searchResult: searchResult ?? this.searchResult,
      movieReviews: movieReviews ?? this.movieReviews,
      favoriteMovies: favoriteMovies ?? this.favoriteMovies,
      favoriteMoviesStringList: favoriteMoviesStringList ?? this.favoriteMoviesStringList,
    );
  }

  String getGenreNameById(int genreId) {
    String name = "";
    genreList.forEach((element) {
      if (element.id == genreId) {
        name = element.name;
      }
    });
    return name;
  }

  bool isFavoriteMovie(int movieId) {
    for (var movie in favoriteMovies) {
      if (movie.id == movieId) {
        return true;
      }
    }
    return false;
  }
}
