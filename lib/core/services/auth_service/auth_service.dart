import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofit_starter/core/dio_config.dart';
import 'package:retrofit_starter/core/models/login/request/login_request.dart';
import 'package:retrofit_starter/core/models/login/response/login_response.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: "https://my-example-base-url.com/api/auth")
abstract class AuthService {
  factory AuthService() {
    return _AuthService(DioConfig.dio());
  }

  @POST("/login")
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);
}
