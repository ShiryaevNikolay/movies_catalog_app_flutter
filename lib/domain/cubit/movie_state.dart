import 'package:flutter/cupertino.dart';

abstract class MovieState {}

class MovieInitialState extends MovieState {}

class MovieLoadingState extends MovieState {}

class MovieSuccessState extends MovieState {
  List<dynamic> loadedMovie;
  MovieSuccessState({@required this.loadedMovie}) : assert(loadedMovie != null);
}

class MovieFailureState extends MovieState {}