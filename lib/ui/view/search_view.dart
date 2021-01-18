import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {

  final _textSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
        maxLines: 1,
        decoration: InputDecoration(
          hintText: "Поиск по названию фильма",
          prefixIcon: Icon(Icons.search),
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
}