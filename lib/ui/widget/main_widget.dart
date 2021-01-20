import 'package:film_catalog_app_flutter/domain/bloc/movie_bloc.dart';
import 'package:film_catalog_app_flutter/domain/bloc/movie_state.dart';
import 'package:flutter/material.dart';

class MainWidget extends StatelessWidget {
  const MainWidget(this.bloc, {Key key}) : super(key: key);

  final MovieBloc bloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieState>(
      stream: bloc.outputStateStream,
      builder: (context, AsyncSnapshot<MovieState> snapshot) {
        final state = snapshot.data;
        
        if (state is MovieLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is MovieSuccess) {
          final items = state.items;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items.elementAt(index);
              return ListTile(title: Text(item),);
            }
          );
        }

        if (state is MovieFailure) {
          return Center(child: Text(state.errorMessage),);
        }

        return SizedBox();
      }
    );
  }
}