import 'package:acthub/config/dependency_injection.dart';
import 'package:acthub/core/cache/cache.dart';
import 'package:acthub/core/resources/manager_size.dart';
import 'package:acthub/core/resources/manager_string.dart';
import 'package:acthub/core/state_renderer/state_renderer.dart';
import 'package:acthub/core/widgets/dialog_button.dart';
import 'package:acthub/features/auth/domain/use_case/register_use_case.dart';
import 'package:acthub/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  late TextEditingController email = TextEditingController();
  late TextEditingController fullName = TextEditingController();
  late TextEditingController phone = TextEditingController();
  late TextEditingController password = TextEditingController();
  late TextEditingController confirmPassword = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final RegisterUseCase _registerUseCase = instance<RegisterUseCase>();
  bool isAgreementPolicy = false;

  changePolicyStatus(bool status) {
    isAgreementPolicy = status;
    update();
  }

  void performRegister(BuildContext context) {
    if (formKey.currentState!.validate()) {
      if (isAgreementPolicy) {
        _register(context);
      } else {
        dialogRender(
          context: context,
          stateRenderType: StateRenderType.popUpErrorState,
          message: ManagerString.shouldAgreeTerms,
          title: ManagerString.error,
          child: dialogButton(
            message: ManagerString.ok,
            onPressed: () {
              Get.back();
            },
          ),
        );
      }
    }
  }

  Future<void> _register(BuildContext context) async {
    CacheData cacheData = CacheData();
    cacheData.setEmail(email.text);
    dialogRender(
      context: context,
      stateRenderType: StateRenderType.popUpLoadingState,
      message: ManagerString.loading,
      title: '',
    );
    (await _registerUseCase.execute(
      RegisterUseCaseInput(
        name: fullName.text,
        email: email.text,
        password: password.text,
        confirmationPassword: confirmPassword.text,
        phone: phone.text,
      ),
    ))
        .fold((l) {
      Get.back();
      dialogRender(
        context: context,
        stateRenderType: StateRenderType.popUpErrorState,
        message: l.message,
        title: '',
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w65,
          ),
          child: dialogButton(
              message: ManagerString.ok,
              onPressed: () {
                Get.back();
              }),
        ),
      );
    }, (r) {
      Get.back();
      dialogRender(
        context: context,
        stateRenderType: StateRenderType.popUpSuccessState,
        message: ManagerString.thanks,
        title: '',
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w65,
          ),
          child: dialogButton(
            onPressed: () {
              Get.back();
              Get.offAllNamed(Routes.verificationView);
            },
            message: ManagerString.thanks,
          ),
        ),
      );
    });
  }
}
