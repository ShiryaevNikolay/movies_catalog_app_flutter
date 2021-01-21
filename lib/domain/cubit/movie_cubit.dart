import 'package:film_catalog_app_flutter/data/model/movie_network.dart';
import 'package:film_catalog_app_flutter/domain/cubit/movie_state.dart';
import 'package:film_catalog_app_flutter/domain/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieCubit extends Cubit<MovieState> {

  final Repository repository;

  MovieCubit(this.repository) : super(MovieUninitialized());

  Future<void> fetchMovie() async {
    try {
      // обвновляем state: показываем индикатор загрузки
      emit(MovieUninitialized.loading());
      // получаем данные
      final List<MovieNetwork> _loadedListMovie = await repository.getMovie(1);
      // обновляем state: показываем данные
      emit(MovieInitialized.success(_loadedListMovie));
    } catch(_) {
      // обрабатываем ошибку
      emit(MovieUninitialized.failure());
    }
  }

  Future<void> loadNextPage(int page) async {
    try {
      // обвновляем state: показываем индикатор загрузки
      emit((state as MovieInitialized).copyWith(isLoading: true));
      // получаем данные
      final List<MovieNetwork> _loadedListMovie = await repository.getMovie(page);
      // обновляем state: показываем данные
      emit(MovieInitialized.success((state as MovieInitialized).movies + _loadedListMovie));
    } catch(_) {
      // обрабатываем ошибку
      emit(MovieInitialized.failure((state as MovieInitialized).movies));
    }
  }

  Future<void> searchMovie(String search) async {
    try {
      emit(MovieSearched.loadingSearch());

      final List<MovieNetwork> _loadedListMovie = await repository.searchMovie(search);

      print(_loadedListMovie[0]);

      emit(MovieSearched.successSearch(_loadedListMovie));
    } catch (_) {
      emit(MovieSearched.failureSearch(search));
    }
  }
}