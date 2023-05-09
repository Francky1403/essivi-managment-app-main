import 'dart:developer';

import 'package:dio/dio.dart';

///This class contains all services that we created with the package 'Dio'
class DioService {
  DioService();

  ///This method make a GET call to the API
  Future<dynamic> getMethod(String url) async {
    Dio dio = Dio();

    return dio
        .get(
      url,
      options: Options(
        responseType: ResponseType.json,
        method: 'GET',
      ),
    )
        .then((response) {
      log(response.toString());
      return response;
    });
  }

  Future<dynamic> postMethod(String url, dynamic data) async {
    Dio dio = Dio();

    return dio
        .post(url,
            options: Options(
              responseType: ResponseType.json,
              method: 'GET',
            ),
            data: data)
        .then((response) {
      log(response.toString());
      return response;
    });
  }
}
