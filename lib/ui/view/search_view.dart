import 'package:film_catalog_app_flutter/domain/cubit/movie_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatefulWidget {

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  MovieCubit _cubit;

  final _textSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    _cubit = BlocProvider.of<MovieCubit>(context);

    _textSearchController.addListener(() { 
      _listenerText(_textSearchController.text);
    });

    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          _buildTextField()
        ],
      ),
    );
  }

  Expanded _buildTextField() {
    return Expanded(
      child: TextField(
        controller: _textSearchController,
        // onChanged: _listenerText,
        maxLines: 1,
        decoration: InputDecoration(
                    hintText: "Поиск по названию фильма",
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: _textSearchController.text.length > 0
                      ? IconButton(
                        icon: Icon(Icons.clear,), 
                        onPressed: () { _textSearchController.clear(); }
                      )
                      : null,
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(100)
                    )
                  ),
      )
    );
  }

  void _listenerText(String text) {
    Future<void>.delayed(Duration(seconds: 1));

    if (text.length > 0) {
      _cubit.searchMovie(text);
    } else {
      _cubit.fetchMovie();
    }
  }
}