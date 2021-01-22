import 'package:film_catalog_app_flutter/data/database/database.dart';
import 'package:film_catalog_app_flutter/data/model/movie_network.dart';
import 'package:film_catalog_app_flutter/domain/cubit/movie_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckFavorite extends StatefulWidget {

  final MovieNetwork _movie;

  CheckFavorite(this._movie);

  @override
  _CheckFavoriteState createState() => _CheckFavoriteState();
}

class _CheckFavoriteState extends State<CheckFavorite> {

  bool _isChecked = false;
  MovieCubit _cubit;

  @override
  void initState() {
    _cubit = BlocProvider.of<MovieCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _cubit.watchFavoriteMovie(),
      builder: (context, AsyncSnapshot<List<MovieDbData>> snapshot) {

        final movies = snapshot.data ?? List();

        MovieDbData favoriteMovie;

        print("MOVIES: $movies");

        int i = 0;

        _isChecked = false;
        for (; i < movies.length;) {
          if (widget._movie.mId == movies[i].movieId) {
            print("TRUE");
            _isChecked = true;
            favoriteMovie = movies[i];
            break;
          }
          i++;
        }

        return IconButton(
          icon: _isChecked 
              ? Icon(Icons.favorite, color: Theme.of(context).accentColor, size: 20,)
              : Icon(Icons.favorite_border, color: Theme.of(context).accentColor, size: 20,), 
          onPressed: () { toggleCheckbox(favoriteMovie); }
        );
      }
    );
  }

  void toggleCheckbox(MovieDbData movie) {
    setState(() {
      _isChecked = !_isChecked;
      if (_isChecked) {
        print("INSERT");
        _cubit.insertFavoriteMovie(new MovieDbData(id: null, movieId: widget._movie.mId));
      } else {
        print("DELETE");
        _cubit.deleteFavoriteMovie(movie);
      }
    });
  }
}