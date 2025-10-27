import 'dart:convert';
import 'package:movieapp/Core/Errors/ErrorModel.dart';
import 'package:movieapp/Core/Errors/ExceptionServer.dart';
import 'package:movieapp/Features/Movies/Data/Models/MovieModel.dart';
import 'package:movieapp/Features/Movies/Domain/Entities/Movie.dart';
import 'package:http/http.dart' as http;

abstract class BaseRemoteDatasource {
  Future<List<Movie>> FetchNowPlayingMovies();
  Future<List<Movie>> FetchPopularMovies();
  Future<List<Movie>> FetchGoodMovies();
}

class RemoteDatasource implements BaseRemoteDatasource {
  Future<List<Movie>> FetchNowPlayingMovies() async {
    final url = Uri.parse(
        "https://api.themoviedb.org/3/movie/now_playing?api_key=a961a1c0e0d72aca2b97335285874bcd&language=en-US&page=1");
    final response = await http.get(url);
    final Map<String, dynamic> data = json.decode(response.body);
    if (response.statusCode == 200) {
      final List<Map<String, dynamic>> results = data['results'];
      return List<Movie>.from((results).map((e) => Moviemodel.fromJson(e)));
      // results.map((movieJson) => Moviemodel.fromJson(movieJson)).toList();
    } else {
      Errormodel errormodel = Errormodel.fromJson(data);
      throw Exceptionserver(errorModel: errormodel);
    }
  }

  @override
  Future<List<Movie>> FetchGoodMovies() async {
    final url = Uri.parse(
        "https://api.themoviedb.org/3/movie/top_rated?api_key=a961a1c0e0d72aca2b97335285874bcd&language=en-US&page=1");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<Map<String, dynamic>> results = data['results'];
      return results
          .map((movieJson) => Moviemodel.fromJson(movieJson))
          .toList();
    } else {
      throw Exception("Failed to load movies: ${response.statusCode}");
    }
  }

  @override
  Future<List<Movie>> FetchPopularMovies() async {
    final url = Uri.parse(
        "https://api.themoviedb.org/3/movie/popular?api_key=a961a1c0e0d72aca2b97335285874bcd&language=en-US&page=1");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<Map<String, dynamic>> results = data['results'];
      return results
          .map((movieJson) => Moviemodel.fromJson(movieJson))
          .toList();
    } else {
      throw Exception("Failed to load movies: ${response.statusCode}");
    }
  }
}
