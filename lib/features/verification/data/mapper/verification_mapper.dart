import 'package:acthub/core/extensions/extensions.dart';
import 'package:acthub/features/verification/data/response/verification_response.dart';
import 'package:acthub/features/verification/domain/model/verification_model.dart';

extension VerificationMapper on VerificationResponse {
  VerificationModel toDomain() {
    return VerificationModel(
      status: status.onNull(),
    );
  }
}
