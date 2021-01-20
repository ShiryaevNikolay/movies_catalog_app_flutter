import 'package:film_catalog_app_flutter/domain/bloc/movie_bloc.dart';
import 'package:film_catalog_app_flutter/ui/view/search_view.dart';
import 'package:film_catalog_app_flutter/ui/widget/main_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieBloc _bloc = MovieBloc();
  
  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // Получаем высоту статус бара
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(height: statusBarHeight, color: Colors.black,),
            SearchView(),
            Expanded(
              child: Container(
                color: Colors.black,
                child: MainWidget(widget._bloc),
                // child: MoviesWidget()
              )
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget._bloc.close();
    super.dispose();
  }
}