import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit_starter/core/models/token/token.dart';
import 'package:retrofit_starter/core/models/user/user.dart';

part 'login_data.freezed.dart';
part 'login_data.g.dart';

@freezed
class LoginData with _$LoginData {
  const factory LoginData({
    required User user,
    required Token token,
  }) = _LoginData;

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataImpl.fromJson(json);
}
