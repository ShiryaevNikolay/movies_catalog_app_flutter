import 'package:flutter/material.dart';

class CheckFavorite extends StatefulWidget {

  @override
  _CheckFavoriteState createState() => _CheckFavoriteState();
}

class _CheckFavoriteState extends State<CheckFavorite> {

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.5,
      child: InkWell(
        onTap: () { toggleCheckbox(); },
        child: Container(
          padding: EdgeInsets.all(10),
          child: _isChecked 
            ? Icon(Icons.favorite, color: Theme.of(context).accentColor, size: 20,)
            : Icon(Icons.favorite_border, color: Theme.of(context).accentColor, size: 20,)
        )
      )
    );
  }

  void toggleCheckbox() {
    setState(() {
      _isChecked = !_isChecked;
      // TODO: сохранение в бд
    });
  }
}