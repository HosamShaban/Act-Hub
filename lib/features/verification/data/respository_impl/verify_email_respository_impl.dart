import 'package:acthub/config/constants.dart';
import 'package:acthub/core/error_handler/error_handler.dart';
import 'package:acthub/core/internet_checker/internet_checker.dart';
import 'package:acthub/core/resources/manager_string.dart';
import 'package:acthub/features/verification/data/data_source/remote_verification_data_source.dart';
import 'package:acthub/features/verification/data/mapper/verification_mapper.dart';
import 'package:acthub/features/verification/data/request/verfification_request.dart';
import 'package:acthub/features/verification/domain/model/verification_model.dart';
import 'package:acthub/features/verification/domain/repository/verification_repository.dart';
import 'package:dartz/dartz.dart';

class VerificationRepositoryImpl implements VerificationRepository {
  final RemoteVerificationDataSource _remoteVerificationDataSource;
  final NetworkInfo _networkInfo;

  VerificationRepositoryImpl(
      this._networkInfo, this._remoteVerificationDataSource);

  @override
  Future<Either<Failure, VerificationModel>> verifyEmail(
      VerificationRequest verifyEmailRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteVerificationDataSource
            .verification(verifyEmailRequest);
        if (response.status != null) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              ResponseCode.BAD_REQUEST.value,
              ManagerString.badRequest,
            ),
          );
        }
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
        Failure(
          ResponseCode.NO_INTERNET_CONNECTION.value,
          ApiConstants.noInternetConnection,
        ),
      );
    }
  }
}
