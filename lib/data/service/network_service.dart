import 'package:chopper/chopper.dart';

part 'network_service.chopper.dart';

@ChopperApi(baseUrl: 'https://api.themoviedb.org/3')
abstract class NetworkService extends ChopperService {

  @Get(path: '/discover/movie?api_key=6ccd72a2a8fc239b13f209408fc31c33')
  Future<Response> getMovies();

  static NetworkService create() {
    final client = ChopperClient(
      services: [
        _$NetworkService()
      ],
      converter: JsonConverter()
    );
    return _$NetworkService(client);
  }
}