import 'package:flutter/cupertino.dart';

@immutable
abstract class MovieEvent {}

class MovieLoadEvent extends MovieEvent {}