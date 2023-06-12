import 'package:acthub/core/cache/cache.dart';
import 'package:acthub/core/state_renderer/state_renderer.dart';
import 'package:acthub/features/reset_password/domain/usecase/reset_password_use_case.dart';
import 'package:acthub/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/dependency_injection.dart';
import '../../../../core/resources/manager_string.dart';
import '../../../../core/validator/validator.dart';
import '../../../verification/domain/usecase/send_otp_usecase.dart';

class ResetPasswordController extends GetxController {
  late TextEditingController firstCodeTextController;
  late TextEditingController secondCodeTextController;
  late TextEditingController thirdCodeTextController;
  late TextEditingController fourthCodeTextController;
  late TextEditingController fifthCodeTextController;
  late TextEditingController sixthCodeTextController;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  final ResetPasswordUseCase _useCase = instance<ResetPasswordUseCase>();
  final SendOtpUseCase _sendOtpUseCase = instance<SendOtpUseCase>();
  FailedValidator validator = FailedValidator();

  late FocusNode firstFocusNode;
  late FocusNode secondFocusNode;
  late FocusNode thirdFocusNode;
  late FocusNode fourthFocusNode;
  late FocusNode fifthFocusNode;
  late FocusNode sixthFocusNode;
  late FocusNode seventhFocusNode;
  late FocusNode eightFocusNode;

  var formKey = GlobalKey<FormState>();

  void resetPassword(BuildContext context) async {
    CacheData cacheData = CacheData();
    String email = cacheData.getEmail();
    dialogRender(
      context: context,
      message: ManagerString.loading,
      title: '',
      stateRenderType: StateRenderType.popUpLoadingState,
      retryAction: () {},
    );
    (await _useCase.execute(
      ResetPasswordInput(
        email: email,
        password: password.text,
        otp: otp(),
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
      dialogRender(
          context: context,
          message: ManagerString.passwordChangeSuccess,
          title: '',
          stateRenderType: StateRenderType.popUpSuccessState,
          retryAction: () {
            Get.back();
            Get.offNamed(
              Routes.loginView,
            );
          });
    });
  }

  sendOtp({
    required BuildContext context,
  }) async {
    CacheData cacheData = CacheData();
    String email = cacheData.getEmail();
    dialogRender(
      context: context,
      message: ManagerString.loading,
      title: '',
      stateRenderType: StateRenderType.popUpLoadingState,
      retryAction: () {},
    );

    (await _sendOtpUseCase.execute(SendOtpInput(email: email))).fold((l) {
      Get.back();
      dialogRender(
        context: context,
        message: l.message,
        title: ManagerString.error,
        stateRenderType: StateRenderType.popUpErrorState,
        retryAction: () {
          Get.back();
        },
      );
    }, (r) {
      Get.back();
      dialogRender(
          context: context,
          message: ManagerString.sendOtpSuccess,
          title: '',
          stateRenderType: StateRenderType.popUpSuccessState,
          retryAction: () {
            Get.back();
          });
    });
  }

  @override
  void onInit() {
    super.onInit();
    firstCodeTextController = TextEditingController();
    secondCodeTextController = TextEditingController();
    thirdCodeTextController = TextEditingController();
    fourthCodeTextController = TextEditingController();
    fifthCodeTextController = TextEditingController();
    sixthCodeTextController = TextEditingController();
    sixthCodeTextController = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    firstFocusNode = FocusNode();
    secondFocusNode = FocusNode();
    thirdFocusNode = FocusNode();
    fourthFocusNode = FocusNode();
    fifthFocusNode = FocusNode();
    sixthFocusNode = FocusNode();
    seventhFocusNode = FocusNode();
    eightFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    firstCodeTextController.dispose();
    secondCodeTextController.dispose();
    thirdCodeTextController.dispose();
    fourthCodeTextController.dispose();
    fifthCodeTextController.dispose();
    sixthFocusNode.dispose();
    password.dispose();
    confirmPassword.dispose();

    firstFocusNode.dispose();
    secondFocusNode.dispose();
    thirdFocusNode.dispose();
    fourthFocusNode.dispose();
    fifthFocusNode.dispose();
    sixthFocusNode.dispose();
    seventhFocusNode.dispose();
    eightFocusNode.dispose();
    formKey.currentState!.dispose();
  }

  otp() {
    return "${firstCodeTextController.text}${secondCodeTextController.text}${thirdCodeTextController.text}${fourthCodeTextController.text}${fifthCodeTextController.text}${sixthCodeTextController.text}";
  }
}
