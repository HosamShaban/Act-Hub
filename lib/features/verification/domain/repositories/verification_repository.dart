import 'package:acthub/features/verification/data/request/verfification_request.dart';
import 'package:acthub/features/verification/domain/model/verification_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_handler/error_handler.dart';

abstract class VerificationRepository {
  Future<Either<Failure, VerificationModel>> verifyEmail(
    VerificationRequest verificationRequest,
  );
}
