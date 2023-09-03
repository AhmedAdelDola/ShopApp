import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = Dio();

  static init()
  {
    dio = Dio(BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true
    ));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async
  {
    dio.options.headers =
    {
      'lang':'en',
      'Authorization': token??'',
      'Content-Type': 'application/json',
    };

    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData(
  {required String url,
     required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,}
  ) async
  {
    dio.options.headers =
    {
      'lang':'ar',
      'Authorization': token??'',
      'Content-Type': 'application/json',
    };

    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData(
     String url,
     Map<String, dynamic> data,
    Map<String, dynamic> query,
    String token,
  ) async
  {
    dio.options.headers =
    {
      'lang':'ar',
      'Authorization': token??'',
      'Content-Type': 'application/json',
    };

    return dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}