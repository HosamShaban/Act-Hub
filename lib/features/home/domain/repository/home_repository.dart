import 'package:acthub/core/error_handler/error_handler.dart';
import 'package:acthub/features/home/domain/model/home_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeModel>> home();
}
