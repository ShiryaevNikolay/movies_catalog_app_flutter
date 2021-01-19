import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {

  String _mTitle = "";

  MovieCard (dynamic movie) {
    this._mTitle = movie["title"];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      color: Colors.white,
      child: Row(
        children: [
          Text("IMG"),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text("$_mTitle")
              ]
            )
          )
        ],
      )
    );
  }
}