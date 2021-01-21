import 'package:film_catalog_app_flutter/domain/cubit/movie_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {

  MovieCubit _cubit;
  
  var _inputDecoration = InputDecoration(
                    hintText: "Поиск по названию фильма",
                    prefixIcon: Icon(Icons.search),
                    // suffixIcon: Icon(Icons.clear),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(100)
                    )
                  );

  @override
  Widget build(BuildContext context) {

    _cubit = BlocProvider.of<MovieCubit>(context);

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
        onChanged: _listenerText,
        maxLines: 1,
        decoration: _inputDecoration,
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