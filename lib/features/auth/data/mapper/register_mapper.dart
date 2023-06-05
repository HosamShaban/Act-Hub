import 'package:acthub/core/extensions/extensions.dart';
import 'package:acthub/features/auth/data/response/register_response.dart';
import 'package:acthub/features/auth/domain/model/register.dart';

extension RegisterMapper on RegisterResponse {
  toDomain() {
    return Register(status: status.onNull());
  }
}
