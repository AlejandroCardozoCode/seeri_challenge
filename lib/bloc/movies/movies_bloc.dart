import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:seeri/bloc/movies/movies_state.dart';
import 'package:http/http.dart' as http;
import 'package:seeri/services/shared_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

import '../../models/models.dart';

part 'movies_event.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final _apiKey = dotenv.env["API_KEY"];
  final _baseUrl = "api.themoviedb.org";

  MoviesBloc()
      : super(MoviesState(
          featuredList: [],
          genreList: [],
          genreMoviesList: [],
          currentGenre: 0,
          searchResult: [],
          movieReviews: [],
          favoriteMovies: [],
          favoriteMoviesStringList: [],
        )) {
    // load featured movies
    on<Featured>((event, emit) async {
      var url = Uri.https(_baseUrl, "3/movie/now_playing", {
        'api_key': _apiKey,
        'language': "es-ES",
      });
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
        List<MovieModel> newMovies = [];
        for (var item in jsonResponse["results"]) {
          MovieModel newMovie = MovieModel.fromJson(item);
          newMovies.add(newMovie);
        }
        log("Numero de featured" + state.featuredList.length.toString());
        emit(state.copyWith(featuredList: newMovies));
      } else {
        log('Request failed with status: ${response.statusCode}.');
      }
    });

    // load all genres
    on<Genres>((event, emit) async {
      var url = Uri.https(_baseUrl, "3/genre/movie/list", {'api_key': _apiKey, 'language': "es-ES"});
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
        List<GenreModel> newGenres = [];
        for (var item in jsonResponse["genres"]) {
          GenreModel newGenre = GenreModel(id: item["id"], name: item["name"]);
          newGenres.add(newGenre);
        }
        emit(state.copyWith(genreList: newGenres));
      } else {
        log('Request failed with status: ${response.statusCode}.');
      }
    });

    // load movies by genre
    on<GenreMovies>((event, emit) async {
      var url = Uri.https(_baseUrl, "3/discover/movie", {'api_key': _apiKey, 'with_genres': state.currentGenre == 0 ? 28.toString() : state.currentGenre.toString(), 'language': "es-ES"});
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
        List<MovieModel> newMovies = [];
        for (var item in jsonResponse["results"]) {
          MovieModel newMovie = MovieModel.fromJson(item);
          newMovies.add(newMovie);
        }
        emit(state.copyWith(genreMoviesList: newMovies));
      } else {
        log('Request failed with status: ${response.statusCode}.');
      }
    });

    // search movies
    on<SearchMovies>((event, emit) async {
      var url = Uri.https(_baseUrl, "3/search/movie", {'api_key': _apiKey, 'query': event.query, 'language': "es-ES"});
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
        List<MovieModel> newMovies = [];
        for (var item in jsonResponse["results"]) {
          MovieModel newMovie = MovieModel.fromJson(item);
          newMovies.add(newMovie);
        }
        log("Numero de buscadas" + state.searchResult.length.toString());
        emit(state.copyWith(searchResult: newMovies));
      } else {
        log('Request failed with status: ${response.statusCode}.');
      }
    });

    //get reviews of a movie
    on<GetMovieReviews>((event, emit) async {
      var url = Uri.https(_baseUrl, "3/movie/${event.movieId}/reviews", {
        'api_key': _apiKey,
      });
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
        List<ReviewModel> newReviews = [];

        for (var item in jsonResponse["results"]) {
          ReviewModel newReview = ReviewModel.fromJson(item);
          if (newReview.authorDetails.rating != null) {
            newReviews.add(newReview);
          }
        }
        log("Numero de reviews" + state.searchResult.length.toString());
        emit(state.copyWith(movieReviews: newReviews));
      } else {
        log('Request failed with status: ${response.statusCode}.');
      }
    });

    // add or remove a movie to favorites list
    on<AddFavorite>((event, emit) async {
      SharedPreferencesServices sharedServices = SharedPreferencesServices();

      final prefs = await SharedPreferences.getInstance();
      if (!state.favoriteMovies.contains(event.movie)) {
        List<MovieModel> newFavorites = List<MovieModel>.from(state.favoriteMovies);
        newFavorites.add(event.movie);
        List<String> favoriteMoviesStringList = sharedServices.listToJsonList(newFavorites).map((e) => json.encode(e)).toList();
        await prefs.setStringList('favoriteMoviesStringList', favoriteMoviesStringList);
        log("Numero de favoritas" + state.favoriteMovies.length.toString());
        emit(state.copyWith(
          favoriteMovies: newFavorites,
          favoriteMoviesStringList: favoriteMoviesStringList,
        ));
      } else {
        List<MovieModel> newFavorites = List<MovieModel>.from(state.favoriteMovies);
        newFavorites.remove(event.movie);
        List<String> favoriteMoviesStringList = sharedServices.listToJsonList(newFavorites).map((e) => json.encode(e)).toList();
        await prefs.setStringList('favoriteMoviesStringList', favoriteMoviesStringList);
        log("Numero de buscadas" + state.favoriteMovies.length.toString());
        emit(state.copyWith(
          favoriteMovies: newFavorites,
          favoriteMoviesStringList: favoriteMoviesStringList,
        ));
      }
    });

    // load favorites from sharedPreferences
    on<RecoverFavorites>((event, emit) async {
      SharedPreferencesServices sharedServices = SharedPreferencesServices();
      final prefs = await SharedPreferences.getInstance();

      List<String>? newFavoriteMoviesStringList = prefs.getStringList('favoriteMoviesStringList');

      if (newFavoriteMoviesStringList != null) {
        List<Map<String, dynamic>> mapList = newFavoriteMoviesStringList.map((e) => json.decode(e)).toList().cast<Map<String, dynamic>>();
        List<MovieModel> newFavoriteList = sharedServices.listFromMap(mapList);
        emit(state.copyWith(
          favoriteMovies: newFavoriteList,
          favoriteMoviesStringList: newFavoriteMoviesStringList,
        ));
      }
    });

    // update home genre
    on<SetGenre>((event, emit) {
      emit(state.copyWith(currentGenre: event.genre));
    });
  }
}
