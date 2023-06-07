import 'package:acthub/config/constants.dart';
import 'package:acthub/core/base_response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends BaseResponse {
  @JsonKey(name: ApiConstants.token)
  String? token;

  LoginResponse(this.token);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson(LoginResponse instance) =>
      _$LoginResponseToJson(this);
}
