import 'package:dio/dio.dart';
import 'package:retrofit_starter/core/utils/response_handlers.dart';

class DioConfig {
  DioConfig._();

  static Dio dio([String jwt = ""]) {
    Map<String, dynamic> headers = {
      "Accept": "*/*",
      "Content-Type": "application/json"
    };
    if (jwt.isNotEmpty) {
      headers["Authorization"] = "Bearer $jwt";
    }
    Dio dio = Dio();
    dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      headers: headers,
      validateStatus: (status) {
        return true;
      },
    );
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: false,
      responseBody: true,
      responseHeader: false,
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options);
      },
      onResponse: (response, handler) {
        Response resp = ResponseHandlers.handleDioResponse(response);
        return handler.next(resp);
      },
      onError: (DioException e, handler) {
        return handler.next(e);
      },
    ));
    return dio;
  }
}
