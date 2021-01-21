import 'package:film_catalog_app_flutter/data/model/movie.dart';
import 'package:film_catalog_app_flutter/data/service/network_service.dart';

class Repository {
  
  static final Repository _repository = Repository._internal();

  factory Repository() => _repository;

  Repository._internal();

  NetworkService _networkService = NetworkService();

  Future<List<Movie>> getMovie(int page) => _networkService.getMovie(page);

  Future<List<Movie>> searchMovie(String search) => _networkService.searchMovie(search);
}