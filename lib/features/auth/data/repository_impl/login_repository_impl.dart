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
  final RemoteLoginDataSource _dataSource;
  final NetworkInfo networkInfo;
  LoginRepositoryImplement(this._dataSource, this.networkInfo);

  @override
  Future<Either<Failure, Login>> login(LoginRequest loginRequest) async {
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
