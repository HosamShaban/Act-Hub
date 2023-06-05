import 'package:acthub/core/error_handler/error_handler.dart';
import 'package:acthub/features/auth/data/request/Register_request.dart';
import 'package:acthub/features/auth/domain/model/Register.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterRepository {
  Future<Either<Failure, Register>> register(RegisterRequest registerRequest);
}
