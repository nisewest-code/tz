import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../data.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: "https://api.domainsdb.info/v1/")
abstract class ApiClient{
  factory ApiClient(Dio dio) = _ApiClient;

  @GET("/domains/search")
  Future<ResponseData> searchDomain(@Query("domain") String domain);



}