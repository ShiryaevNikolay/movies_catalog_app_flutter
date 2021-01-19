import 'package:date_format/date_format.dart';
import 'package:film_catalog_app_flutter/ui/view/favorite_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MovieCard extends StatefulWidget {

  String _mTitle = "";
  String _mOverview = "";
  String _mImgUrl = "";
  List<String> _mReleaseDate;

  MovieCard (dynamic movie) {
    this._mTitle = movie["title"];
    this._mOverview = movie["overview"];
    this._mImgUrl = movie["poster_path"];
    this._mReleaseDate = movie["release_date"].split("-");
  }

  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      color: Colors.white,
      child: Row(
        children: [
          Image.network("https://image.tmdb.org/t/p/w185${widget._mImgUrl}", width: 150,),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget._mTitle,
                    maxLines: 2,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Expanded(
                      child: Text(
                        widget._mOverview,
                        maxLines: 3,
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.calendar_today, size: 20, color: Colors.grey[600],),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              formatDate(DateTime(int.parse(widget._mReleaseDate[0]), int.parse(widget._mReleaseDate[1]), int.parse(widget._mReleaseDate[2])), [d, ' ', MM, ' ', yyyy]),
                              style: TextStyle(
                                fontSize: 12, 
                                fontWeight: FontWeight.w300
                              ),
                            )
                          )
                        ]
                      ),
                      CheckFavorite()
                    ]
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