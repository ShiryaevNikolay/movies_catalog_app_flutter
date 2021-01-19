// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$NetworkService extends NetworkService {
  _$NetworkService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = NetworkService;

  @override
  Future<Response<dynamic>> getMovies() {
    final $url =
        'https://api.themoviedb.org/3/discover/movie?api_key=6ccd72a2a8fc239b13f209408fc31c33';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
