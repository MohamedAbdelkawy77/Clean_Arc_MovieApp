import 'dart:convert';
import 'package:movieapp/Core/Errors/ErrorModel.dart';
import 'package:movieapp/Core/Errors/ExceptionServer.dart';
import 'package:movieapp/Core/Networking/Constants.dart';
import 'package:movieapp/Features/Movies/Data/Models/MovieModel.dart';
import 'package:movieapp/Features/Movies/Domain/Entities/Movie.dart';
import 'package:http/http.dart' as http;

abstract class BaseRemoteDatasource {
  Future<List<Movie>> FetchNowPlayingMovies();
  Future<List<Movie>> FetchPopularMovies();
  Future<List<Movie>> FetchGoodMovies();
}

class RemoteDatasource implements BaseRemoteDatasource {
  @override
  Future<List<Movie>> FetchNowPlayingMovies() async {
    final url = Uri.parse(
        "${Constants.BaseUrl}now_playing?api_key=${Constants.apikey}&language=en-US&page=1");
    final response = await http.get(url);
    final Map<String, dynamic> data = json.decode(response.body);
    if (response.statusCode == 200) {
      final List<Map<String, dynamic>> results =
          List<Map<String, dynamic>>.from(data['results']);
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
        "${Constants.BaseUrl}top_rated?api_key=${Constants.apikey}&language=en-US&page=1");
    final response = await http.get(url);
    final data = json.decode(response.body);
    if (response.statusCode == 200) {
      final List<dynamic> results = data['results'];
      return results
          .map((movieJson) => Moviemodel.fromJson(movieJson))
          .toList();
    } else {
      Errormodel errormodel = Errormodel.fromJson(data);
      throw Exceptionserver(errorModel: errormodel);
    }
  }

  @override
  Future<List<Movie>> FetchPopularMovies() async {
    final url = Uri.parse(
        "${Constants.BaseUrl}popular?api_key=${Constants.apikey}&language=en-US&page=1");
    final response = await http.get(url);
    final data = json.decode(response.body);
    if (response.statusCode == 200) {
      final List<Map<String, dynamic>> results = (data["results"] as List)
          .map((e) => e as Map<String, dynamic>)
          .toList();
      return results
          .map((movieJson) => Moviemodel.fromJson(movieJson))
          .toList();
    } else {
      Errormodel errormodel = Errormodel.fromJson(data);
      throw Exceptionserver(errorModel: errormodel);
    }
  }
}
