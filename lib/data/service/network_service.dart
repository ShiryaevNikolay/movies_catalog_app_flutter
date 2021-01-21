import 'dart:convert';

import 'package:film_catalog_app_flutter/data/model/movie.dart';
import 'package:http/http.dart' as http;

class NetworkService {

  final _apiKey = '6ccd72a2a8fc239b13f209408fc31c33';

  int _page = 0;

  Future<List<Movie>> getMovie() async {

    _page++;

    final response = await http.get('https://api.themoviedb.org/3/discover/movie?api_key=$_apiKey&page=$_page');

    if (response.statusCode == 200) {
      final List<dynamic> movieJson = json.decode(response.body)["results"];
      return movieJson.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception("Ошибка");
    }
  }

  Future<List<Movie>> searchMovie() async {
    final response = await http.get('https://api.themoviedb.org/3/search/movie?api_key=$_apiKey&page');

    if (response.statusCode == 200) {
      final List<dynamic> movieJson = json.decode(response.body)["results"];
      return movieJson.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception("Ошибка");
    }
  }
}