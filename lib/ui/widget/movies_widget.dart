import 'package:flutter/material.dart';

class MoviesWidget extends StatefulWidget {

  @override
  _MoviesWidgetState createState() => _MoviesWidgetState();
}

class _MoviesWidgetState extends State<MoviesWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("movies"),
    );
  }
}