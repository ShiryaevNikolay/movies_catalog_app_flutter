import 'package:film_catalog_app_flutter/ui/view/search_view.dart';
import 'package:film_catalog_app_flutter/ui/widget/movies_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    // Получаем высоту статус бара
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: statusBarHeight),
            SearchView(),
            Expanded(
              child: Container(
                color: Colors.black,
                child: MoviesWidget()
              )
            )
          ],
        ),
      ),
    );
  }
}