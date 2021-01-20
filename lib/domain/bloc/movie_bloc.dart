import 'dart:async';

import 'package:film_catalog_app_flutter/domain/bloc/movie_event.dart';
import 'package:film_catalog_app_flutter/domain/bloc/movie_state.dart';


class MovieBloc {

  final _inputEventController = StreamController<MovieEvent>();

  final _outputStateController = StreamController<MovieState>.broadcast();

  Sink<MovieEvent> get inputEvetSink => _inputEventController.sink;

  Stream<MovieState> get outputStateStream => _outputStateController.stream;

  MovieBloc() {
    _inputEventController.stream.listen(_onEvent);
    _outputStateController.add(MovieInitial());
  }

  void _onEvent(event) {
    if (event == MovieEventFetch) {
      _outputStateController.add(MovieLoading());
      _fetchItems()
        .then((items) {
          _outputStateController.add(MovieSuccess(items));
        })
        .catchError((error) {
          _outputStateController.add(MovieFailure(error?.toString()));
        });
    }
  }

  void close() {
    _inputEventController.close();
    _outputStateController.close();
  }

  Future _fetchItems() {

  }
}