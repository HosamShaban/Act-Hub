import 'package:acthub/core/resources/manager_string.dart';
import 'package:acthub/core/state_renderer/state_renderer.dart';
import 'package:acthub/core/storage/local/app_settings_shared_preferences.dart';
import 'package:acthub/features/profile/data/request/edit_password_request.dart';
import 'package:acthub/features/profile/domain/usecase/edit_password_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/dependency_injection.dart';

class ProfileController extends GetxController {
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  final AppSettingsSharedPreferences _appSettingsPrefs =
      instance<AppSettingsSharedPreferences>();
  var formKey = GlobalKey<FormState>();
  final EditPasswordUseCase _editPasswordUseCase =
      instance<EditPasswordUseCase>();

  changePassword() async {
    BuildContext context = Get.context!;
    dialogRender(
        context: context,
        message: ManagerString.loading,
        title: "",
        stateRenderType: StateRenderType.popUpLoadingState,
        retryAction: () {});
    (await _editPasswordUseCase.execute(EditPasswordRequest(
            password: newPassController.text,
            confirmPassword: confirmPassController.text)))
        .fold((l) {
      Get.back();
      dialogRender(
        context: context,
        message: l.message,
        title: 'editPassFailed',
        stateRenderType: StateRenderType.popUpErrorState,
        retryAction: () {
          Get.back();
        },
      );
    }, (r) {
      Get.back();
      dialogRender(
          context: context,
          message: 'Success',
          title: ManagerString.thanks,
          stateRenderType: StateRenderType.popUpSuccessState,
          retryAction: () {
            Get.back();
          });
    });
    newPassController.text = "";
    confirmPassController.text = "";
  }
}
