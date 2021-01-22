// import 'package:film_catalog_app_flutter/domain/bloc/movie_bloc.dart';
import 'package:film_catalog_app_flutter/domain/cubit/movie_cubit.dart';
import 'package:film_catalog_app_flutter/domain/cubit/movie_state.dart';
import 'package:film_catalog_app_flutter/ui/view/search_view.dart';
import 'package:film_catalog_app_flutter/ui/widget/movie_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MovieCubit _cubit;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<MovieCubit>(context);

    _cubit.fetchMovie();
  }

  @override
  Widget build(BuildContext context) {

    // Получаем высоту статус бара
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {

        if (state is MovieInitialized && state.hasError) {
          _scaffoldKey.currentState.hideCurrentSnackBar();
          _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Проверьте ваше соединение с интернетом и попробуйте ещё раз")));
        }
        
        return Scaffold(
          key: _scaffoldKey,
          body: Center(
            child: Column(
              children: [
                Container(height: statusBarHeight, color: Colors.black,),
                SearchView(),
                Expanded(
                  child: Container(
                    color: Colors.black,
                    child: MovieList(),
                    // child: MoviesWidget()
                  )
                )
              ],
            ),
          ),
        );
      }
    );
  }
}