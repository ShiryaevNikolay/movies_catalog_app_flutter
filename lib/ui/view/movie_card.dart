import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {

  String _mTitle = "";
  String _mOverview = "";

  MovieCard (dynamic movie) {
    this._mTitle = movie["title"];
    this._mOverview = movie["overview"];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      color: Colors.white,
      child: Row(
        children: [
          Text("IMG"),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _mTitle,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      _mOverview,
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  )
                ]
              )
            ),
          )
        ],
      )
    );
  }
}