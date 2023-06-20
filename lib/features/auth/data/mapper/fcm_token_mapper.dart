import 'package:acthub/core/extensions/extensions.dart';
import 'package:acthub/features/auth/data/response/fcm_token_response.dart';
import 'package:acthub/features/auth/domain/model/fcm_token_model.dart';

extension FcmTokenMapper on FcmTokenResponse {
  FcmTokenModel toDomain() {
    return FcmTokenModel(
      status: status.onNull(),
    );
  }
}
