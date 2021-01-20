import 'dart:async';

import 'package:film_catalog_app_flutter/data/model/movie.dart';
import 'package:film_catalog_app_flutter/domain/bloc/movie_event.dart';
import 'package:film_catalog_app_flutter/domain/bloc/movie_state.dart';
import 'package:film_catalog_app_flutter/domain/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MovieBloc extends Bloc<MovieEvent, MovieState> {

  final Repository repository;

  MovieBloc(this.repository) : super(MovieInitialState());

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is MovieLoadEvent) {
      yield MovieLoadingState();
      try {
        final List<Movie> _loadedMovieList = await repository.getMovie();
        yield MovieSuccessState(loadedMovie: _loadedMovieList);
      } catch (_) {
        yield MovieFailureState();
      }
    }
  }
}