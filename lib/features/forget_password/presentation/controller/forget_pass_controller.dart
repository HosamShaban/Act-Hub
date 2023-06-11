import 'package:acthub/core/resources/manager_string.dart';
import 'package:acthub/core/state_renderer/state_renderer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/dependency_injection.dart';
import '../../../../core/cache/cache.dart';
import '../../../../routes/routes.dart';
import '../../domain/usecase/forget_password_usecase.dart';

class ForgetPasswordController extends GetxController {
  final ForgetPasswordUseCase _useCase = instance<ForgetPasswordUseCase>();
  late TextEditingController email;
  var formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  void forgetPassword(BuildContext context) async {
    CacheData cacheData = CacheData();
    cacheData.setEmail(email.text);
    dialogRender(
      context: context,
      message: ManagerString.loading,
      title: '',
      stateRenderType: StateRenderType.popUpLoadingState,
      retryAction: () {},
    );
    (await _useCase.execute(
      ForgetPasswordInput(
        email: email.text,
      ),
    ))
        .fold((l) {
      Get.back();
      dialogRender(
        context: context,
        message: l.message,
        title: ManagerString.sorryFailed,
        stateRenderType: StateRenderType.popUpErrorState,
        retryAction: () {
          Get.back();
        },
      );
    }, (r) {
      Get.back();
      if (r.status!) {
        dialogRender(
            context: context,
            message: ManagerString.sendOtpSuccess,
            title: '',
            stateRenderType: StateRenderType.popUpSuccessState,
            retryAction: () {
              Get.back();
              Get.offNamed(
                Routes.reset_password,
              );
            });
      } else {
        dialogRender(
          context: context,
          message: ManagerString.sorryFailed,
          title: ManagerString.error,
          stateRenderType: StateRenderType.popUpErrorState,
          retryAction: () {
            Get.back();
          },
        );
      }
    });
  }
}
