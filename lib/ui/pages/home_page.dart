import 'package:film_catalog_app_flutter/domain/bloc/movie_bloc.dart';
import 'package:film_catalog_app_flutter/domain/repository/repository.dart';
import 'package:film_catalog_app_flutter/ui/view/search_view.dart';
import 'package:film_catalog_app_flutter/ui/widget/movie_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _mRepository = Repository();

  @override
  Widget build(BuildContext context) {

    // Получаем высоту статус бара
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return BlocProvider<MovieBloc>(
      create: (context) => MovieBloc(_mRepository),
      child: Scaffold(
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
      ),
    );
  }
}