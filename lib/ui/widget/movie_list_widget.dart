// import 'package:film_catalog_app_flutter/domain/bloc/movie_bloc.dart';
// import 'package:film_catalog_app_flutter/domain/bloc/movie_event.dart';
// import 'package:film_catalog_app_flutter/domain/bloc/movie_state.dart';
import 'package:film_catalog_app_flutter/domain/cubit/movie_cubit.dart';
import 'package:film_catalog_app_flutter/domain/cubit/movie_state.dart';
import 'package:film_catalog_app_flutter/ui/view/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_view/widgets/bottom_loader.dart';

class MovieList extends StatefulWidget {

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {

  int _page = 1;
  MovieCubit _cubit;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    
    _cubit = BlocProvider.of<MovieCubit>(context);

    _cubit.fetchMovie();

    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        if (state is MovieUninitialized) {
          if (state.isLoading) {
            return _buildLoadingState();
          }
          if (state.hasError) {
            return _buildFailureState(context);
          }
        }

        if (state is MovieInitialized) {
          if (state.hasError) {
            // показываем snackbar ошибки
            Scaffold.of(context).hideCurrentSnackBar();
            Scaffold.of(context).showSnackBar(SnackBar(content: Text("Проверьте ваше соединение с интернетом и попробуйте ещё раз"))); 
          }
          return _buildSuccessState(state);
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

  ListView _buildSuccessState(MovieInitialized state) {
    return ListView.builder(
          itemCount: state.movies.length + 1,
          itemBuilder: (context, index) => index >= state.movies.length
            ? BottomLoader()
            : MovieCard(state.movies[index]),
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
