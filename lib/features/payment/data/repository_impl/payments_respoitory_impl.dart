import 'package:acthub/core/resources/manager_string.dart';
import 'package:acthub/features/payment/data/mapper/payments_mapper.dart';
import 'package:acthub/features/payment/domain/model/payments_model.dart';
import 'package:acthub/features/payment/domain/repository/payments_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/internet_checker/internet_checker.dart';
import '../data_source/payments_remote_data_source.dart';

class PaymentsRepositoryImplementation implements PaymentsRepository {
  final RemotePaymentsDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  PaymentsRepositoryImplementation(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, PaymentsModel>> payments() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.categories();
        return Right(response.toDomain());
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
        Failure(
          ResponseCode.NO_INTERNET_CONNECTION.value,
          ManagerString.NO_INTERNT_CONNECTION,
        ),
      );
    }
  }
}
