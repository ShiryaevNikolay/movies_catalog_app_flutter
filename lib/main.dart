// import 'package:film_catalog_app_flutter/data/service/network_service.dart';
import 'package:film_catalog_app_flutter/domain/cubit/movie_cubit.dart';
import 'package:film_catalog_app_flutter/domain/repository/repository.dart';
import 'package:film_catalog_app_flutter/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final _mRepository = Repository();
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieCubit>(
      create: (context) => MovieCubit(_mRepository),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'Movie catalog',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomePage(),
      )
    );
  }
}
