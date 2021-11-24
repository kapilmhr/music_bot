import 'package:dio/dio.dart';

import 'apiurl.dart';
import 'exception.dart';

class ApiServices {
  Future<dynamic> get(url) async {
    var dio = Dio();
    dio.interceptors.add(
        LogInterceptor(responseBody: true, request: true, requestBody: true));

    dio.options.headers['content-Type'] = 'application/json';
    // dio.options.headers["Authorization"] = "Bearer ${token}";

    try {
      var response = await dio.get(ApiUrl.baseUrl + url);
      return response.data;
    } on DioError catch (e) {
      print('ERROR ====> ${getDioException(e)}');
      print(getDioException(e));
      throw Exception(getDioException(e));
    }
  }
}
