import 'package:cat_trivia/models/fact/fact.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api.g.dart';

@RestApi(baseUrl: "https://cat-fact.herokuapp.com/")
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) {
    dio.options = BaseOptions(
        receiveTimeout: 30000,
        connectTimeout: 30000,
        contentType: 'application/json');
    return _RestClient(dio, baseUrl: baseUrl);
  }

  @GET("/facts/random?animal_type=cat&amount=1")
  Future<Fact> getFact();
}
