import 'package:acthub/core/error_handler/error_handler.dart';
import 'package:acthub/core/use_case/base_use_case.dart';
import 'package:acthub/features/auth/data/request/login_request.dart';
import 'package:acthub/features/auth/domain/model/login.dart';
import 'package:acthub/features/auth/domain/repository/login_repository.dart';
import 'package:dartz/dartz.dart';

class LoginBaseUseCaseInput {
  String? email;
  String? password;

  LoginBaseUseCaseInput({
    required this.email,
    required this.password,
  });
}

class LoginUseCase implements BaseUseCase<LoginBaseUseCaseInput, Login> {
  final LoginRepository _loginRepository;

  LoginUseCase(this._loginRepository);

  @override
  Future<Either<Failure, Login>> execute(LoginBaseUseCaseInput input) async {
    return await _loginRepository
        .login(LoginRequest(email: input.email, password: input.password));
  }
}
