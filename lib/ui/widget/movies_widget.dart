import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:film_catalog_app_flutter/data/service/network_service.dart';
import 'package:film_catalog_app_flutter/ui/view/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;

class MoviesWidget extends StatefulWidget {

  @override
  _MoviesWidgetState createState() => _MoviesWidgetState();
}

class _MoviesWidgetState extends State<MoviesWidget> {
  @override
  Widget build(BuildContext context) {

    // _getResponse(context);
    // _getMovies();

    return Center(
      child: _buildBody(context),
      // child: Text("Text", style: TextStyle(color: Colors.white),),
    );
  }

  // void _getMovies() {
  //   http.get('https://developers.themoviedb.org/3/discover/movie?api_key=6ccd72a2a8fc239b13f209408fc31c33').then((responce) {
  //     print("Responce status: ${responce.statusCode}");
  //     print("Responce body: ${responce.body}");
  //   }).catchError((error) {
  //     print("Error: $error");
  //   });
  // }

  // void _getResponse(BuildContext context) async {
  //   final response = await Provider.of<NetworkService>(context).getMovies();
  //   print(response);
  // }

  FutureBuilder<Response> _buildBody(BuildContext context) {

    final snackBar = SnackBar(content: Text("Проверьте ваше соединение с интернетом и попробуйте ещё раз"));

    return FutureBuilder<Response>(
      future: Provider.of<NetworkService>(context).getMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {

            Scaffold.of(context).showSnackBar(snackBar);

            return Center(
              child: Container(
                color: Colors.red,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Icon(Icons.error, size: 50, color: Theme.of(context).accentColor,),
                    Text("Нам не удалось обработать ваш запрос. Попробуйте ещё раз", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),)
                  ]
                ),
              )
            );
          }
          Map<String, dynamic> data = json.decode(snapshot.data.bodyString);
          final List<dynamic> movies = data["results"];
          return _buildMovies(context, movies);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _buildMovies(BuildContext context, List movies) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return MovieCard(movies[index]);
      },
    );
  }
}