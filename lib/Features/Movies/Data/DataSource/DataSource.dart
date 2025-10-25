import 'dart:convert';
import 'package:movieapp/Features/Movies/Data/Models/MovieModel.dart';
import 'package:movieapp/Features/Movies/Domain/Entities/Movie.dart';
import 'package:http/http.dart' as http;
abstract class BaseDatasource {
  Future<List<Movie>> FetchNowPlayingMovies();
  Future<List<Movie>> FetchPopularMovies();
  Future<List<Movie>> FetchGoodMovies();
}

class Datasource implements BaseDatasource {
  Future<List<Movie>> FetchNowPlayingMovies( ) async {
    final url = Uri.parse("");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<Map<String,dynamic>> results = data['results'];
      return results.map((movieJson) => Moviemodel.fromJson(movieJson)).toList();
    } else {
      throw Exception("Failed to load movies: ${response.statusCode}");
    }
  }
  
  @override
  Future<List<Movie>> FetchGoodMovies()async {
    final url = Uri.parse("");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<Map<String,dynamic>> results = data['results'];
      return results.map((movieJson) => Moviemodel.fromJson(movieJson)).toList();
    } else {
      throw Exception("Failed to load movies: ${response.statusCode}");
    }
  }
  
  @override
  Future<List<Movie>> FetchPopularMovies()async {
    final url = Uri.parse("");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<Map<String,dynamic>> results = data['results'];
      return results.map((movieJson) => Moviemodel.fromJson(movieJson)).toList();
    } else {
      throw Exception("Failed to load movies: ${response.statusCode}");
    }
  }
}
