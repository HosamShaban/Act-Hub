import 'package:acthub/core/error_handler/error_handler.dart';
import 'package:acthub/core/use_case/base_use_case.dart';
import 'package:acthub/features/auth/data/request/Register_request.dart';
import 'package:acthub/features/auth/domain/model/Register.dart';
import 'package:acthub/features/auth/domain/repository/register_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterUseCaseInput {
  String? name;
  String? email;
  String? password;
  String? confirmationPassword;
  String? phone;

  RegisterUseCaseInput({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmationPassword,
    required this.phone,
  });
}

class RegisterUseCase implements BaseUseCase<RegisterUseCaseInput, Register> {
  final RegisterRepository _registerRepository;

  RegisterUseCase(this._registerRepository);

  @override
  Future<Either<Failure, Register>> execute(RegisterUseCaseInput input) async {
    return await _registerRepository.register(RegisterRequest(
      name: input.name,
      email: input.email,
      password: input.password,
      confirmationPassword: input.confirmationPassword,
      phone: input.phone,
    ));
  }
}
