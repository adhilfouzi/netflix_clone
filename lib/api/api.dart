import 'dart:convert';
import 'package:netflix_clone/constants/constants.dart';
import 'package:netflix_clone/models/tv.dart';
import '../models/movie.dart';
import 'package:http/http.dart' as http;
import '../models/search.dart';

class Api {
  static const trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';
  static const popularUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';
  static const topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';
  static const nowPlayingUrl =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=${Constants.apiKey}';
  static const upComingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';
  static const topRatedTvSeriesUrl =
      'https://api.themoviedb.org/3/tv/top_rated?api_key=${Constants.apiKey}';
  static const popularTvSeriesUrl =
      'https://api.themoviedb.org/3/tv/popular?api_key=${Constants.apiKey}';

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(trendingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something Happend');
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(topRatedUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something Happend');
    }
  }

  Future<List<Movie>> getpopularMovies() async {
    final response = await http.get(Uri.parse(popularUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something Happend');
    }
  }

  Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(upComingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something Happend');
    }
  }

  Future<List<Movie>> getnowPlayingMovies() async {
    final response = await http.get(Uri.parse(nowPlayingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something Happend');
    }
  }

  Future<List<TvSeries>> getTopRatedSeries() async {
    final response = await http.get(Uri.parse(topRatedTvSeriesUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((tv) => TvSeries.fromJson(tv)).toList();
    } else {
      throw Exception('Something Happend');
    }
  }

  Future<List<TvSeries>> getpopularSeries() async {
    final response = await http.get(Uri.parse(popularTvSeriesUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((tv) => TvSeries.fromJson(tv)).toList();
    } else {
      throw Exception('Something Happend');
    }
  }

  Future<List<SearchMovie>> search(value) async {
    final searchsUrl =
        'https://api.themoviedb.org/3/search/movie?query=$value&include_adult=false&language=en-US&api_key=${Constants.apiKey}';

    final response = await http.get(Uri.parse(searchsUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData
          .map((movie) => SearchMovie.fromJson(movie))
          .where((movie) =>
              // ignore: unnecessary_null_comparison
              movie.posterPath != null && movie.posterPath.isNotEmpty)
          .toList();
    } else {
      throw Exception('Something Happened');
    }
  }
}
