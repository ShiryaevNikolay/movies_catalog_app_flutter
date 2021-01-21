import 'package:flutter/cupertino.dart';

abstract class MovieState {}

class MovieUninitialized extends MovieState {

  final bool isLoading;
  final bool hasError;

  MovieUninitialized({this.isLoading, this.hasError});

  factory MovieUninitialized.loading() => 
    MovieUninitialized(
      isLoading: true,
      hasError: false
    );

  factory MovieUninitialized.failure() => 
    MovieUninitialized(
      isLoading: false,
      hasError: true
    );
}

class MovieInitialized extends MovieState {
  final List<dynamic> movies;
  final bool isLoading;
  final bool hasError;
  final bool hasReachedMax;

  MovieInitialized({this.movies, this.isLoading, this.hasError, this.hasReachedMax});

  factory MovieInitialized.success(List<dynamic> movies) => 
    MovieInitialized(
      movies: movies,
      isLoading: false,
      hasError: false, 
      hasReachedMax: false
    );

  factory MovieInitialized.failure() => MovieInitialized(isLoading: false, hasError: true, hasReachedMax: false);

  MovieInitialized copyWith({List<dynamic> movies, bool isLoading, bool hasError, bool hasReachedMax}) =>
    MovieInitialized(
      movies: movies ?? this.movies,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax
    );
}