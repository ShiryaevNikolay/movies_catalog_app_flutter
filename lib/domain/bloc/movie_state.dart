import 'package:flutter/cupertino.dart';

@immutable
abstract class MovieState {}

class MovieInitialState extends MovieState {}

class MovieLoadingState extends MovieState {}

class MovieSuccessState<T> extends MovieState {
  List<dynamic> loadedMovie;
  MovieSuccessState({@required this.loadedMovie}) : assert(loadedMovie != null);
}

class MovieFailureState extends MovieState {}