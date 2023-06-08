import 'package:acthub/core/network/app_api.dart';
import 'package:acthub/features/verification/data/request/verfification_request.dart';
import 'package:acthub/features/verification/data/response/verification_response.dart';

abstract class RemoteVerificationDataSource {
  Future<VerificationResponse> verification(
      VerificationRequest verificationRequest);
}

class RemoteVerificationDataSourceImplementation
    extends RemoteVerificationDataSource {
  final AppApi _appApi;

  RemoteVerificationDataSourceImplementation(this._appApi);

  @override
  Future<VerificationResponse> verification(
      VerificationRequest verificationRequest) {
    return _appApi.emailVerification(
      verificationRequest.email,
      verificationRequest.otp,
    );
  }
}
