part of 'movies_bloc.dart';

@immutable
abstract class MoviesEvent {}

class Featured extends MoviesEvent {}

class Genres extends MoviesEvent {}

class SetGenre extends MoviesEvent {
  final int genre;
  SetGenre(this.genre);
}

class GenreMovies extends MoviesEvent {}

class SearchMovies extends MoviesEvent {
  final String query;
  SearchMovies(this.query);
}

class GetMovieReviews extends MoviesEvent {
  final String movieId;
  GetMovieReviews(this.movieId);
}

class AddFavorite extends MoviesEvent {
  final MovieModel movie;
  AddFavorite(this.movie);
}

class RecoverFavorites extends MoviesEvent {}
