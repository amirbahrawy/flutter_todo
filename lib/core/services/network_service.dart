import 'package:dio/dio.dart';

abstract class NetworkService {
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });
}

class NetworkServiceImpl implements NetworkService {
  final Dio dio;

  NetworkServiceImpl()
      : dio = Dio(BaseOptions(baseUrl: 'https://dummyjson.com/'));

  @override
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return await dio.get(
      url,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }
}
