import 'package:acthub/core/network/app_api.dart';
import 'package:acthub/features/verification/data/request/send_otp_request.dart';
import 'package:acthub/features/verification/data/response/send_otp_response.dart';

abstract class RemoteSendOtpDataSource {
  Future<SendOtpResponse> sendOtp(SendOtpRequest sendOtpRequest);
}

class RemoteSendOtpDataSourceImpl implements RemoteSendOtpDataSource {
  final AppApi _AppApi;

  RemoteSendOtpDataSourceImpl(this._AppApi);

  @override
  Future<SendOtpResponse> sendOtp(SendOtpRequest sendOtpRequest) async {
    return await _AppApi.sendOtp(
      sendOtpRequest.email,
    );
  }
}
