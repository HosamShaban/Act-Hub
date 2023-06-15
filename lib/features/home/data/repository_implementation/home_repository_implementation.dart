import 'package:acthub/config/constants.dart';
import 'package:acthub/core/error_handler/error_handler.dart';
import 'package:acthub/core/internet_checker/internet_checker.dart';
import 'package:acthub/features/home/data/data_source/remote_home_data_source.dart';
import 'package:acthub/features/home/data/mapper/home_mapper.dart';
import 'package:acthub/features/home/domain/model/home_model.dart';
import 'package:acthub/features/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImplementation implements HomeRepository {
  final RemoteHomeDataSource _dataSource;
  final NetworkInfo _networkInfo;

  HomeRepositoryImplementation(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, HomeModel>> home() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.homeData();
        return Right(response.toDomain());
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(Failure(ResponseCode.NO_INTERNET_CONNECTION.value,
          ApiConstants.noInternetConnection));
    }
  }
}
