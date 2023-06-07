import 'package:acthub/config/constants.dart';
import 'package:acthub/config/dependency_injection.dart';
import 'package:acthub/core/extensions/extensions.dart';
import 'package:acthub/core/resources/manager_colors.dart';
import 'package:acthub/core/resources/manager_fonts.dart';
import 'package:acthub/core/resources/manager_size.dart';
import 'package:acthub/core/resources/manager_string.dart';
import 'package:acthub/core/resources/manager_styles.dart';
import 'package:acthub/core/state_renderer/state_renderer.dart';
import 'package:acthub/core/storage/local/app_settings_shared_preferences.dart';
import 'package:acthub/core/widgets/mainButton.dart';
import 'package:acthub/features/auth/domain/use_case/login_use_case.dart';
import 'package:acthub/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();
  late final LoginUseCase _loginUseCase = instance<LoginUseCase>();
  var formKey = GlobalKey<FormState>();
  final AppSettingsSharedPreferences _appSettingsSharedPreferences =
      instance<AppSettingsSharedPreferences>();

  Future<void> login(BuildContext context) async {
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
          child: mainButton(
            child: Text(
              ManagerString.ok,
              style: getMediumTextStyle(
                fontSize: ManagerFontSize.s16,
                color: ManagerColors.white,
              ),
            ),
            onPressed: () {
              Get.back();
            },
            color: ManagerColors.primaryColor,
            height: ManagerHeight.h40,
          ),
        ),
        retryAction: () {},
      );
    }, (r) {
      _appSettingsSharedPreferences.setEmail(email.text);
      _appSettingsSharedPreferences.setPassword(password.text);
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
          child: mainButton(
            child: Text(
              ManagerString.ok,
              style: getMediumTextStyle(
                fontSize: ManagerFontSize.s16,
                color: ManagerColors.white,
              ),
            ),
            onPressed: () {
              Get.back();
            },
            color: ManagerColors.primaryColor,
            height: ManagerHeight.h40,
          ),
        ),
        retryAction: () {},
      );
      Future.delayed(
          const Duration(
            seconds: Constants.loginTimer,
          ), () {
        Get.offAllNamed(Routes.homeView);
      });
    });
  }
}
