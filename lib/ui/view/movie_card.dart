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
    this._mTitle = movie.mTitle;
    this._mOverview = movie.mOverview;
    this._mImgUrl = movie.mPosterPath;
    this._mReleaseDate = movie.mReleaseDate.split("-");
  }

  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () { 
        Scaffold.of(context).hideCurrentSnackBar();
        Scaffold.of(context).showSnackBar(SnackBar(content: Text(widget._mTitle))); 
      },
      child: Container(
        height: 220,
        margin: EdgeInsets.all(5),
        color: Colors.white,
        child: Row(
          children: [
            Image.network(
              "https://image.tmdb.org/t/p/w500${widget._mImgUrl}", height: 220,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes
                          : null,
                    ),
                  ),
                );
              },
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      child: Text(
                        widget._mTitle,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          widget._mOverview,
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
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}