import 'package:acthub/core/extensions/extensions.dart';
import 'package:acthub/features/verification/domain/model/send_otp_model.dart';

import '../response/send_otp_response.dart';

extension SendOtpMapper on SendOtpResponse {
  toDomain() => SendOtpModel(status: status?.onNull());
}
