import 'package:acthub/config/constants.dart';
import 'package:acthub/core/error_handler/error_handler.dart';
import 'package:acthub/core/internet_checker/internet_checker.dart';
import 'package:acthub/features/auth/data/data_source/remote_login_data_source.dart';
import 'package:acthub/features/auth/data/mapper/login_mapper.dart';
import 'package:acthub/features/auth/data/request/login_request.dart';
import 'package:acthub/features/auth/domain/model/login.dart';
import 'package:acthub/features/auth/domain/repository/login_repository.dart';
import 'package:dartz/dartz.dart';

class LoginRepositoryImplement implements LoginRepository {
  final RemoteLoginDataSource _remoteLoginDataSource;
  final NetworkInfo _networkInfo;
  LoginRepositoryImplement(this._remoteLoginDataSource, this._networkInfo);
  @override
  Future<Either<Failure, Login>> login(LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      final response = await _remoteLoginDataSource.login(loginRequest);
      return Right(response.toDomain());
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
