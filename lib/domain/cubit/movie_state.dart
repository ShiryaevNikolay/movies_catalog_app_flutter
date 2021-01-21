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

  MovieInitialized({this.movies, this.isLoading, this.hasError});

  factory MovieInitialized.success(List<dynamic> movies) => 
    MovieInitialized(
      movies: movies,
      isLoading: false,
      hasError: false
    );

  factory MovieInitialized.failure(List<dynamic> movies) => 
    MovieInitialized(
      movies: movies,
      isLoading: false, 
      hasError: true
    );

  MovieInitialized copyWith({List<dynamic> movies, bool isLoading, bool hasError}) =>
    MovieInitialized(
      movies: movies ?? this.movies,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError
    );
}

class MovieSearched extends MovieState {
  final List<dynamic> movies;
  final String text;
  final bool isLoading;
  final bool hasError;

  MovieSearched({this.movies, this.isLoading, this.hasError, this.text});

  factory MovieSearched.successSearch(List<dynamic> movies) =>
    MovieSearched(
      movies: movies,
      isLoading: false,
      hasError: false
    );

  factory MovieSearched.loadingSearch() => 
    MovieSearched(
      movies: [],
      isLoading: true,
      hasError: false
    );

  factory MovieSearched.failureSearch(String text) => 
    MovieSearched(
      movies: [],
      isLoading: false,
      hasError: true,
      text: text
    );

}