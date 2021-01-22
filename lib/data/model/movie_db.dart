import 'package:moor_flutter/moor_flutter.dart';

class MovieDb extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get movieId => integer()();
  // BoolColumn get isFavorite => boolean()();
}