import 'package:film_catalog_app_flutter/data/model/movie.dart';
import 'package:film_catalog_app_flutter/domain/cubit/movie_state.dart';
import 'package:film_catalog_app_flutter/domain/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieCubit extends Cubit<MovieState> {

  final Repository repository;

  MovieCubit(this.repository) : super(MovieInitialState());

  Future<void> fetchMovie() async {
    try {
      // обвновляем state: показываем индикатор загрузки
      emit(MovieLoadingState());
      // получаем данные
      final List<Movie> _loadedListMovie = await repository.getMovie();
      // обновляем state: показываем данные
      emit(MovieSuccessState(loadedMovie: _loadedListMovie));
    } catch(_) {
      // обрабатываем ошибку
      emit(MovieFailureState());
    }
  }

  Future<void> nextPage() async {
    // TODO: load next page
  }
}