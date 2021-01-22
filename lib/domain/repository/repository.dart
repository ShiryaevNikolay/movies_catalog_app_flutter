import 'package:film_catalog_app_flutter/data/database/database.dart';
import 'package:film_catalog_app_flutter/data/model/movie_network.dart';
import 'package:film_catalog_app_flutter/data/service/network_service.dart';

class Repository {
  
  NetworkService _networkService = NetworkService();
  Database _database = Database();
  
  static final Repository _repository = Repository._internal();

  factory Repository() => _repository;

  Repository._internal();

  Future<List<MovieNetwork>> getMovie(int page) => _networkService.getMovie(page);

  Future<List<MovieNetwork>> searchMovie(String search) => _networkService.searchMovie(search);

  Future<List<MovieDbData>> getFavoriteMovie() => _database.getFavoriteMovie();

  Stream<List<MovieDbData>> watchFavoriteMovie() => _database.watchFavoriteMovie();

  Future<void> insertFavoriteMovie(MovieDbData movie) => _database.insertFavoriteMovie(movie);

  Future<void> deleteFavoriteMovie(MovieDbData movie) => _database.deleteFavoriteMovie(movie);
}