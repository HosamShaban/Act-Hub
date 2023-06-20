import 'package:acthub/config/constants.dart';
import 'package:acthub/core/error_handler/error_handler.dart';
import 'package:acthub/core/internet_checker/internet_checker.dart';
import 'package:acthub/features/auth/data/data_source/remote_fcm_token_data_source.dart';
import 'package:acthub/features/auth/data/mapper/fcm_token_mapper.dart';
import 'package:acthub/features/auth/data/request/fcm_token_request.dart';
import 'package:acthub/features/auth/domain/model/fcm_token_model.dart';
import 'package:acthub/features/auth/domain/repository/fcm_token_repository.dart';
import 'package:dartz/dartz.dart';

class FcmTokenRepositoryImpl implements FcmTokenRepository {
  final RemoteFcmTokenDataSource _dataSource;
  final NetworkInfo networkInfo;

  FcmTokenRepositoryImpl(this._dataSource, this.networkInfo);

  @override
  Future<Either<Failure, FcmTokenModel>> sendFcmToken(
      FcmTokenRequest loginRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await _dataSource.login(loginRequest);
        return Right(response.toDomain());
      } catch (e) {
        return Left(
          ErrorHandler.handle(e).failure,
        );
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
