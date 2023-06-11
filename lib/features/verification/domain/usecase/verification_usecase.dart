import 'package:acthub/core/error_handler/error_handler.dart';
import 'package:acthub/core/use_case/base_use_case.dart';
import 'package:acthub/features/verification/data/request/verfification_request.dart';
import 'package:acthub/features/verification/domain/model/verification_model.dart';
import 'package:acthub/features/verification/domain/repositories/verification_repository.dart';
import 'package:dartz/dartz.dart';

class VerificationUseCase
    extends BaseUseCase<VerificationUseCaseInput, VerificationModel> {
  final VerificationRepository _verificationRepository;

  VerificationUseCase(this._verificationRepository);

  @override
  Future<Either<Failure, VerificationModel>> execute(
      VerificationUseCaseInput input) async {
    return await _verificationRepository.verifyEmail(
      VerificationRequest(
        email: input.email,
        otp: input.otp,
      ),
    );
  }
}

class VerificationUseCaseInput {
  String email;
  String otp;

  VerificationUseCaseInput({required this.email, required this.otp});
}
