import 'package:film_catalog_app_flutter/domain/cubit/movie_cubit.dart';
import 'package:film_catalog_app_flutter/domain/cubit/movie_state.dart';
import 'package:film_catalog_app_flutter/ui/view/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieList extends StatefulWidget {

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {

  int _page = 1;
  MovieCubit _cubit;
  ScrollController _scrollController = ScrollController();
  var _refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<MovieCubit>(context);
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        return currentState(context, state);
      }
    );
  }

  Widget currentState(BuildContext context, MovieState state) {
    if (state is MovieUninitialized) {
      if (state.isLoading) {
        return _buildLoadingState();
      }
      if (state.hasError) {
        return _buildFailureState(context);
      }
    }

    if (state is MovieInitialized) {
      return _buildSuccessState(state);
    }
    return _buildInitialState(context);
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

  ListView _buildSuccessState(MovieInitialized state) {
    return ListView.builder(
          itemCount: state.movies.length + 1,
          itemBuilder: (context, index) {
            if (index < state.movies.length) {
              return MovieCard(state.movies[index]);
            } else if (state.isLoading) {
              return Padding(
                padding: EdgeInsets.all(20),
                child: Center(child: CircularProgressIndicator()),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Center(child: Text("Данных нет", style: TextStyle(color: Colors.white),)),
              );
            }
          },
          controller: _scrollController,
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

  Future<Null> refreshList() async {
    _refreshKey.currentState.show(atTop: false);
    _page++;
    _cubit.loadNextPage(_page);
    return null;
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll == maxScroll) {
      _page++;
      _cubit.loadNextPage(_page);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
