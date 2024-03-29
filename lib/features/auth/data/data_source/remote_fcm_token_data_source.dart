import 'package:acthub/core/network/app_api.dart';
import 'package:acthub/features/auth/data/request/fcm_token_request.dart';
import 'package:acthub/features/auth/data/response/fcm_token_response.dart';

abstract class RemoteFcmTokenDataSource {
  Future<FcmTokenResponse> login(FcmTokenRequest loginRequest);
}

class RemoteFcmTokenDataSourceImplement implements RemoteFcmTokenDataSource {
  final AppApi _appApi;

  RemoteFcmTokenDataSourceImplement(this._appApi);

  @override
  Future<FcmTokenResponse> login(FcmTokenRequest fcmTokenRequest) async {
    return await _appApi.sendFcmToken(
      fcmTokenRequest.fcmToken,
    );
  }
}
