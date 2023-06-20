import 'package:acthub/core/error_handler/error_handler.dart';
import 'package:acthub/features/auth/data/request/fcm_token_request.dart';
import 'package:acthub/features/auth/domain/model/fcm_token_model.dart';
import 'package:dartz/dartz.dart';

abstract class FcmTokenRepository {
  Future<Either<Failure, FcmTokenModel>> sendFcmToken(
      FcmTokenRequest loginRequest);
}
