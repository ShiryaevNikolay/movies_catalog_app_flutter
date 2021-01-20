// import 'package:film_catalog_app_flutter/domain/bloc/movie_bloc.dart';
// import 'package:film_catalog_app_flutter/domain/bloc/movie_event.dart';
// import 'package:film_catalog_app_flutter/domain/bloc/movie_state.dart';
import 'package:film_catalog_app_flutter/domain/cubit/movie_cubit.dart';
import 'package:film_catalog_app_flutter/domain/cubit/movie_state.dart';
import 'package:film_catalog_app_flutter/ui/view/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieList extends StatelessWidget {
  const MovieList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final _cubit = BlocProvider.of<MovieCubit>(context);

    _cubit.fetchMovie();

    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        if (state is MovieInitialState) {
          return _buildInitialState(context);
        }
        if (state is MovieLoadingState) {
          return _buildLoadingState();
        }
        if (state is MovieSuccessState) {
          return _buildSuccessState(state);
        }
        if (state is MovieFailureState) {
          return _buildFailureState(context);
        }
        return _buildInitialState(context);
      }
    );
  }

  Center _buildFailureState(BuildContext context) {
    return Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error, size: 50, color: Theme.of(context).accentColor,),
                Text("Нам не удалось обработать ваш запрос. Попробуйте ещё раз", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),)
              ]
            ),
          )
        );
  }

  ListView _buildSuccessState(MovieSuccessState state) {
    return ListView.builder(
          itemCount: state.loadedMovie.length,
          itemBuilder: (context, index) => MovieCard(state.loadedMovie[index])
        );
  }

  Center _buildLoadingState() {
    return Center(
          child: CircularProgressIndicator(),
        );
  }

  Container _buildInitialState(BuildContext context) {
    return Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Text("Список пуст. Попробуйте обновить", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),)
          )
        );
  }
}
