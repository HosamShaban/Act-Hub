import 'package:acthub/config/constants.dart';
import 'package:acthub/core/resources/manager_assets.dart';
import 'package:acthub/core/resources/manager_colors.dart';
import 'package:acthub/core/resources/manager_fonts.dart';
import 'package:acthub/core/resources/manager_size.dart';
import 'package:acthub/core/resources/manager_string.dart';
import 'package:acthub/core/resources/manager_styles.dart';
import 'package:acthub/core/validator/validator.dart';
import 'package:acthub/core/widgets/base_text_form_field.dart';
import 'package:acthub/core/widgets/mainButton.dart';
import 'package:acthub/core/widgets/scaffold_with_background_image.dart';
import 'package:acthub/features/auth/presentation/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  final FailedValidator _failedValidator = FailedValidator();

  @override
  Widget build(BuildContext context) {
    return scaffoldWithBackGroundImage(
        child: Column(
      children: [
        Expanded(
          flex: Constants.loginFirstPartFlex,
          child: Container(
            margin: EdgeInsetsDirectional.only(top: ManagerHeight.h12),
            alignment: Alignment.center,
            child: SvgPicture.asset(ManagerAssets.logo),
          ),
        ),
        Expanded(
          flex: Constants.loginSecondPartFlex,
          child: Container(
            decoration: BoxDecoration(
              color: ManagerColors.backgroundForm,
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(
                  ManagerRadius.r44,
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: ManagerWidth.w16,
              vertical: ManagerHeight.h30,
            ),
            width: double.infinity,
            child: GetBuilder<LoginController>(
              builder: (controller) {
                return Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      Text(
                        ManagerString.login,
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
                      SizedBox(height: ManagerHeight.h40),
                      mainButton(
                          child: Text(
                            ManagerString.login,
                            style: getRegularTextStyle(
                                fontSize: ManagerFontSize.s16,
                                color: ManagerColors.white
                            ),
                          ),
                        minWidth: double.infinity,
                        color: ManagerColors.primaryColor,
                        height: ManagerHeight.h40,
                        onPressed: (){
                            if(controller.formKey.currentState!.validate()){
                              controller.login();
                            }
                        }
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    ));
  }
}
