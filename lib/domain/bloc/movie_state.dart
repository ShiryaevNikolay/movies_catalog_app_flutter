import 'package:flutter/cupertino.dart';

@immutable
abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieSuccess<T> extends MovieState {
  MovieSuccess(this.items);
  final Iterable<T> items;
}

class MovieFailure extends MovieState {
  MovieFailure(this.errorMessage);
  final String errorMessage;
}