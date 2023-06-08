import 'package:acthub/core/resources/manager_colors.dart';
import 'package:acthub/core/resources/manager_fonts.dart';
import 'package:acthub/core/resources/manager_size.dart';
import 'package:acthub/core/resources/manager_string.dart';
import 'package:acthub/core/resources/manager_styles.dart';
import 'package:acthub/core/validator/validator.dart';
import 'package:acthub/core/widgets/base_text_form_field.dart';
import 'package:acthub/core/widgets/custom_check_box.dart';
import 'package:acthub/core/widgets/mainButton.dart';
import 'package:acthub/features/auth/presentation/controller/registert_controller.dart';
import 'package:acthub/features/auth/presentation/view/widget/auth_view.dart';
import 'package:acthub/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  final FailedValidator _failedValidator = FailedValidator();

  @override
  Widget build(BuildContext context) {
    return authView(
      isRegisterView: true,
      child: GetBuilder<RegisterController>(
        builder: (controller) {
          return Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    ManagerString.signUp,
                    style: getMediumTextStyle(
                      fontSize: ManagerFontSize.s24,
                      color: ManagerColors.black,
                    ),
                  ),
                  SizedBox(height: ManagerHeight.h30),
                  baseTextFormField(
                    controller: controller.fullName,
                    hintText: ManagerString.fullName,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => _failedValidator.validateFullName(
                      value,
                    ),
                  ),
                  SizedBox(height: ManagerHeight.h16),
                  baseTextFormField(
                    controller: controller.email,
                    hintText: ManagerString.email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => _failedValidator.validateEmail(
                      value,
                    ),
                  ),
                  SizedBox(height: ManagerHeight.h16),
                  baseTextFormField(
                    controller: controller.phone,
                    hintText: ManagerString.phone,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => _failedValidator.validatePhone(
                      value,
                    ),
                  ),
                  SizedBox(height: ManagerHeight.h16),
                  baseTextFormField(
                    controller: controller.password,
                    hintText: ManagerString.password,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    validator: (value) => _failedValidator.validatePassword(
                      value,
                    ),
                  ),
                  SizedBox(height: ManagerHeight.h16),
                  baseTextFormField(
                    controller: controller.confirmPassword,
                    hintText: ManagerString.confirmPassword,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    validator: (value) => _failedValidator.validatePassword(
                      value,
                    ),
                  ),
                  Row(
                    children: [
                      customCheckbox(
                          state: controller.isAgreementPolicy,
                          onChanged: (status) {
                            controller.changePolicyStatus(status!);
                          }),
                      Text(
                        ManagerString.agreePolicy,
                        style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s10,
                          color: ManagerColors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: ManagerHeight.h40),
                  mainButton(
                      child: Text(
                        ManagerString.signUp,
                        style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s16,
                          color: ManagerColors.white,
                        ),
                      ),
                      minWidth: double.infinity,
                      color: ManagerColors.primaryColor,
                      height: ManagerHeight.h40,
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller.performRegister(context);
                        }
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ManagerString.haveAccount,
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.black),
                      ),
                      mainButton(
                          child: Text(
                            ManagerString.login,
                            style: getRegularTextStyle(
                              fontSize: ManagerFontSize.s14,
                              color: ManagerColors.primaryColor,
                            ),
                          ),
                          onPressed: () {
                            Get.offAllNamed(Routes.loginView);
                          }),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
