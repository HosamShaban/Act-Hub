import 'package:acthub/config/dependency_injection.dart';
import 'package:acthub/core/extensions/extensions.dart';
import 'package:acthub/core/resources/manager_size.dart';
import 'package:acthub/core/resources/manager_string.dart';
import 'package:acthub/core/state_renderer/state_renderer.dart';
import 'package:acthub/features/verification/domain/usecase/send_otp_usecase.dart';
import 'package:acthub/features/verification/domain/usecase/verification_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/cache/cache.dart';
import '../../../../core/validator/validator.dart';
import '../../../../core/widgets/dialog_button.dart';
import '../../../../routes/routes.dart';

class VerificationController extends GetxController {
  late TextEditingController firstCodeTextController;
  late TextEditingController secondCodeTextController;
  late TextEditingController thirdCodeTextController;
  late TextEditingController fourthCodeTextController;
  late TextEditingController fifthCodeTextController;
  late TextEditingController sixthCodeTextController;
  FailedValidator validator = FailedValidator();
  var formKey = GlobalKey<FormState>();

  late FocusNode firstFocusNode;
  late FocusNode secondFocusNode;
  late FocusNode thirdFocusNode;
  late FocusNode fourthFocusNode;
  late FocusNode fifthFocusNode;
  late FocusNode sixthFocusNode;
  final VerificationUseCase _verificationUseCase =
      instance<VerificationUseCase>();
  final SendOtpUseCase _sendOtpUseCase = instance<SendOtpUseCase>();

  void verifyEmail(BuildContext context) async {
    CacheData cacheData = CacheData();
    String email = cacheData.getEmail();
    dialogRender(
      context: context,
      message: ManagerString.loading,
      title: '',
      stateRenderType: StateRenderType.popUpLoadingState,
      retryAction: () {},
    );
    (await _verificationUseCase.execute(
      VerificationUseCaseInput(
        email: email,
        otp: otp(),
      ),
    ))
        .fold(
      (l) {
        Get.back();
        dialogRender(
          context: context,
          message: l.message,
          title: ManagerString.error,
          stateRenderType: StateRenderType.popUpErrorState,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ManagerWidth.w65,
            ),
            child: dialogButton(
              message: ManagerString.ok,
              onPressed: () {
                Get.back();
              },
            ),
          ),
        );
      },
      (r) {
        Get.back();
        dialogRender(
          context: context,
          message: ManagerString.verificationSuccess,
          title: ManagerString.thanks,
          stateRenderType: StateRenderType.popUpSuccessState,
          child: dialogButton(
            message: ManagerString.ok,
            onPressed: () {
              Get.back();
              Get.offAllNamed(Routes.loginView);
            },
          ),
        );
      },
    );
  }

  otp() {
    return "${firstCodeTextController.text}${secondCodeTextController.text}${thirdCodeTextController.text}${fourthCodeTextController.text}${fifthCodeTextController.text}${sixthCodeTextController.text}";
  }

  sendOtp({
    required BuildContext context,
    String? route,
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
            if (route.onNull() != '') {
              Get.offAllNamed(route!);
            }
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
    firstFocusNode = FocusNode();
    secondFocusNode = FocusNode();
    thirdFocusNode = FocusNode();
    fourthFocusNode = FocusNode();
    fifthFocusNode = FocusNode();
    sixthFocusNode = FocusNode();
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
    firstFocusNode.dispose();
    secondFocusNode.dispose();
    thirdFocusNode.dispose();
    fourthFocusNode.dispose();
    fifthFocusNode.dispose();
    sixthFocusNode.dispose();
    formKey.currentState!.dispose();
  }
}
