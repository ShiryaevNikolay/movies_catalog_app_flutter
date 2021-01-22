
import 'package:film_catalog_app_flutter/data/model/movie_db.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

@UseMoor(tables: [MovieDb])
class Database extends _$Database {
  Database() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'movie_db.sqlite'));

  @override
  int get schemaVersion => 1;

  Future<List<MovieDbData>> getFavoriteMovie() => select(movieDb).get();
  Stream<List<MovieDbData>> watchFavoriteMovie() => select(movieDb).watch();
  Future insertFavoriteMovie(MovieDbData movie) => into(movieDb).insert(movie);
  Future deleteFavoriteMovie(MovieDbData movie) => delete(movieDb).delete(movie);
}