import 'package:acthub/core/extensions/extensions.dart';
import 'package:acthub/features/auth/data/response/login_response.dart';
import 'package:acthub/features/auth/domain/model/login.dart';

extension LoginMapper on LoginResponse {
  toDomain() {
    return Login(token: token.onNull());
  }
}
