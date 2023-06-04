import 'package:acthub/core/resources/manager_colors.dart';
import 'package:acthub/core/resources/manager_fonts.dart';
import 'package:acthub/core/resources/manager_size.dart';
import 'package:acthub/core/resources/manager_string.dart';
import 'package:acthub/core/resources/manager_styles.dart';
import 'package:acthub/core/validator/validator.dart';
import 'package:acthub/core/widgets/base_text_form_field.dart';
import 'package:acthub/core/widgets/mainButton.dart';
import 'package:acthub/features/auth/presentation/controller/login_controller.dart';
import 'package:acthub/features/auth/presentation/view/widget/auth_view.dart';
import 'package:acthub/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  final FailedValidator _failedValidator = FailedValidator();

  @override
  Widget build(BuildContext context) {
    return authView(
      child: GetBuilder<LoginController>(
        builder: (controller) {
          return Form(
            key: controller.formKey,
            child: Column(
              children: [
                Text(
                  ManagerString.signIn,
                  style: getMediumTextStyle(
                    fontSize: ManagerFontSize.s24,
                    color: ManagerColors.black,
                  ),
                ),
                SizedBox(height: ManagerHeight.h30),
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
                  controller: controller.password,
                  hintText: ManagerString.password,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  validator: (value) => _failedValidator.validatePassword(
                    value,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: (value) {},
                          activeColor: ManagerColors.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(ManagerRadius.r4)),
                        ),
                        Text(
                          ManagerString.rememberMe,
                          style: getMediumTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.black,
                          ),
                        ),
                      ],
                    ),
                    mainButton(
                      child: Text(
                        ManagerString.forgotPassword,
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.primaryColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ManagerHeight.h90),
                mainButton(
                    child: Text(
                      ManagerString.signIn,
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
                        controller.login(context);
                      }
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ManagerString.haveNotAccount,
                      style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s14,
                          color: ManagerColors.black),
                    ),
                    mainButton(
                        child: Text(
                          ManagerString.signUp,
                          style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.primaryColor,
                          ),
                        ),
                        onPressed: () {
                          Get.offAllNamed(Routes.registerView);
                        }),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
