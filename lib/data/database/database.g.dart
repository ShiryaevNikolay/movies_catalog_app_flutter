// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class MovieDbData extends DataClass implements Insertable<MovieDbData> {
  final int id;
  final int movieId;
  MovieDbData({@required this.id, @required this.movieId});
  factory MovieDbData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return MovieDbData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      movieId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}movie_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || movieId != null) {
      map['movie_id'] = Variable<int>(movieId);
    }
    return map;
  }

  MovieDbCompanion toCompanion(bool nullToAbsent) {
    return MovieDbCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      movieId: movieId == null && nullToAbsent
          ? const Value.absent()
          : Value(movieId),
    );
  }

  factory MovieDbData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MovieDbData(
      id: serializer.fromJson<int>(json['id']),
      movieId: serializer.fromJson<int>(json['movieId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'movieId': serializer.toJson<int>(movieId),
    };
  }

  MovieDbData copyWith({int id, int movieId}) => MovieDbData(
        id: id ?? this.id,
        movieId: movieId ?? this.movieId,
      );
  @override
  String toString() {
    return (StringBuffer('MovieDbData(')
          ..write('id: $id, ')
          ..write('movieId: $movieId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, movieId.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is MovieDbData &&
          other.id == this.id &&
          other.movieId == this.movieId);
}

class MovieDbCompanion extends UpdateCompanion<MovieDbData> {
  final Value<int> id;
  final Value<int> movieId;
  const MovieDbCompanion({
    this.id = const Value.absent(),
    this.movieId = const Value.absent(),
  });
  MovieDbCompanion.insert({
    this.id = const Value.absent(),
    @required int movieId,
  }) : movieId = Value(movieId);
  static Insertable<MovieDbData> custom({
    Expression<int> id,
    Expression<int> movieId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (movieId != null) 'movie_id': movieId,
    });
  }

  MovieDbCompanion copyWith({Value<int> id, Value<int> movieId}) {
    return MovieDbCompanion(
      id: id ?? this.id,
      movieId: movieId ?? this.movieId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (movieId.present) {
      map['movie_id'] = Variable<int>(movieId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MovieDbCompanion(')
          ..write('id: $id, ')
          ..write('movieId: $movieId')
          ..write(')'))
        .toString();
  }
}

class $MovieDbTable extends MovieDb with TableInfo<$MovieDbTable, MovieDbData> {
  final GeneratedDatabase _db;
  final String _alias;
  $MovieDbTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _movieIdMeta = const VerificationMeta('movieId');
  GeneratedIntColumn _movieId;
  @override
  GeneratedIntColumn get movieId => _movieId ??= _constructMovieId();
  GeneratedIntColumn _constructMovieId() {
    return GeneratedIntColumn(
      'movie_id',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, movieId];
  @override
  $MovieDbTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'movie_db';
  @override
  final String actualTableName = 'movie_db';
  @override
  VerificationContext validateIntegrity(Insertable<MovieDbData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('movie_id')) {
      context.handle(_movieIdMeta,
          movieId.isAcceptableOrUnknown(data['movie_id'], _movieIdMeta));
    } else if (isInserting) {
      context.missing(_movieIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MovieDbData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return MovieDbData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MovieDbTable createAlias(String alias) {
    return $MovieDbTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $MovieDbTable _movieDb;
  $MovieDbTable get movieDb => _movieDb ??= $MovieDbTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [movieDb];
}
