import 'package:acthub/core/error_handler/error_handler.dart';
import 'package:acthub/core/use_case/base_use_case.dart';
import 'package:acthub/features/auth/data/request/fcm_token_request.dart';
import 'package:acthub/features/auth/domain/model/fcm_token_model.dart';
import 'package:acthub/features/auth/domain/repository/fcm_token_repository.dart';
import 'package:dartz/dartz.dart';

class FcmTokenUseCaseInput {
  String? fcmToken;

  FcmTokenUseCaseInput({
    required this.fcmToken,
  });
}

class FcmTokenUseCase
    implements BaseUseCase<FcmTokenUseCaseInput, FcmTokenModel> {
  final FcmTokenRepository _fcmTokenRepository;

  FcmTokenUseCase(this._fcmTokenRepository);

  @override
  Future<Either<Failure, FcmTokenModel>> execute(
      FcmTokenUseCaseInput input) async {
    return await _fcmTokenRepository.sendFcmToken(
      FcmTokenRequest(
        fcmToken: input.fcmToken,
      ),
    );
  }
}
