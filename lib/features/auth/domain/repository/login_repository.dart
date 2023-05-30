import 'package:acthub/core/error_handler/error_handler.dart';
import 'package:acthub/features/auth/data/request/login_request.dart';
import 'package:acthub/features/auth/domain/model/login.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository {
  Future<Either<Failure, Login>> login(LoginRequest loginRequest);
}
