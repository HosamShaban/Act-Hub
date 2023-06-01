import 'package:acthub/config/dependency_injection.dart';
import 'package:acthub/features/auth/domain/use_case/login_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();
  late final LoginUseCase _loginUseCase = instance<LoginUseCase>();
  var formKey = GlobalKey<FormState>();

  Future<void> login() async {
    (await _loginUseCase.execute(
      LoginBaseUseCaseInput(email: email.text, password: password.text),
    ))
        .fold((l) {
      print('failed');
    }, (r) {
      print('success');
    });
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    formKey.currentState!.dispose();
    super.onClose();
  }
}
