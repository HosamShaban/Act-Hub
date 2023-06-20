import 'package:acthub/config/constants.dart';
import 'package:acthub/config/dependency_injection.dart';
import 'package:acthub/core/extensions/extensions.dart';
import 'package:acthub/core/resources/manager_size.dart';
import 'package:acthub/core/resources/manager_string.dart';
import 'package:acthub/core/state_renderer/state_renderer.dart';
import 'package:acthub/core/storage/local/app_settings_shared_preferences.dart';
import 'package:acthub/core/widgets/dialog_button.dart';
import 'package:acthub/features/auth/domain/use_case/fcm_token_use_case.dart';
import 'package:acthub/features/auth/domain/use_case/login_use_case.dart';
import 'package:acthub/routes/routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();
  late final LoginUseCase _loginUseCase = instance<LoginUseCase>();
  var formKey = GlobalKey<FormState>();
  final AppSettingsSharedPreferences _appSettingsSharedPreferences =
      instance<AppSettingsSharedPreferences>();
  bool rememberMe = false;
  final FcmTokenUseCase _tokenUseCase = instance<FcmTokenUseCase>();

  changeRememberMe(bool status) {
    rememberMe = status;
    update();
  }

  void performLogin(BuildContext context) {
    if (formKey.currentState!.validate()) {
      _login(context);
    }
  }

  Future<void> _login(BuildContext context) async {
    dialogRender(
        context: context,
        stateRenderType: StateRenderType.popUpLoadingState,
        message: ManagerString.loading,
        title: '',
        retryAction: () {});
    (await _loginUseCase.execute(
      LoginBaseUseCaseInput(email: email.text, password: password.text),
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
    }, (r) async {
      String? fcmToken = await FirebaseMessaging.instance.getToken();
      _tokenUseCase.execute(FcmTokenUseCaseInput(fcmToken: fcmToken));

      if (rememberMe) {
        _appSettingsSharedPreferences.setEmail(email.text);
        _appSettingsSharedPreferences.setPassword(password.text);
        _appSettingsSharedPreferences.setLoggedIn();
      }
      _appSettingsSharedPreferences.setToken(r.token.onNull());
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
              Get.offAllNamed(Routes.mainView);
            },
            message: ManagerString.thanks,
          ),
        ),
      );
      Future.delayed(
          const Duration(
            seconds: Constants.loginTimer,
          ), () {
        Get.offAllNamed(Routes.mainView);
      });
    });
  }
}
