import 'package:acthub/core/resources/manager_colors.dart';
import 'package:acthub/core/resources/manager_fonts.dart';
import 'package:acthub/core/resources/manager_size.dart';
import 'package:acthub/core/resources/manager_string.dart';
import 'package:acthub/core/resources/manager_styles.dart';
import 'package:acthub/core/widgets/arrow_back_button.dart';
import 'package:acthub/core/widgets/base_text_form_field.dart';
import 'package:acthub/core/widgets/mainButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/constants.dart';
import '../../../../core/validator/validator.dart';
import '../../../verification/presentation/view/widget/code_verification.dart';
import '../controller/reset_password_controller.dart';

class ResetPasswordView extends StatelessWidget {
  ResetPasswordView({Key? key}) : super(key: key);

  final FailedValidator _validator = FailedValidator();

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<ResetPasswordController>(
          builder: (controller) {
            return Stack(
              children: [
                Container(
                  height: ManagerHeight.h205,
                  decoration: BoxDecoration(
                    color: ManagerColors.primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(ManagerRadius.r20),
                      bottomRight: Radius.circular(ManagerRadius.r20),
                    ),
                  ),
                ),
                Container(
                  alignment: AlignmentDirectional.centerStart,
                  margin: EdgeInsets.symmetric(
                    vertical: ManagerHeight.h44,
                    horizontal: ManagerWidth.w20,
                  ),
                  child: arrowBackButton(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: ManagerHeight.h110,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: ManagerHeight.h575,
                    margin: EdgeInsets.symmetric(
                      horizontal: ManagerWidth.w10,
                      vertical: ManagerHeight.h30,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: ManagerWidth.w10,
                      vertical: ManagerHeight.h20,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          ManagerRadius.r20,
                        ),
                        color: ManagerColors.backgroundForm,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(
                              ManagerOpacity.op0_3,
                            ),
                            blurRadius: ConstantSize.s5,
                            spreadRadius: ConstantSize.s2,
                          )
                        ]),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          Text(
                            ManagerString.changePassword,
                            style: getMediumTextStyle(
                                fontSize: ManagerFontSize.s20,
                                color: ManagerColors.primaryColor),
                          ),
                          SizedBox(
                            height: ManagerHeight.h8,
                          ),
                          Text(
                            ManagerString.resetSubTitle,
                            textAlign: TextAlign.center,
                            style: getRegularTextStyle(
                              fontSize: ManagerFontSize.s12,
                              color: ManagerColors.grey,
                            ),
                          ),
                          SizedBox(
                            height: ManagerHeight.h28,
                          ),
                          Container(
                            child: Row(
                              children: [
                                CodeVerification(
                                  controller:
                                      controller.firstCodeTextController,
                                  focusNode: controller.firstFocusNode,
                                  previousFocusNode: controller.firstFocusNode,
                                  onChanged: (String value) {
                                    if (value.isNotEmpty) {
                                      controller.secondFocusNode.requestFocus();
                                    }
                                  },
                                  validator: (value) =>
                                      controller.validator.validateCode(value),
                                ),
                                SizedBox(
                                  width: ManagerWidth.w6,
                                ),
                                CodeVerification(
                                  controller:
                                      controller.secondCodeTextController,
                                  focusNode: controller.secondFocusNode,
                                  previousFocusNode: controller.firstFocusNode,
                                  onChanged: (String value) {
                                    if (value.isNotEmpty) {
                                      controller.thirdFocusNode.requestFocus();
                                    } else {
                                      controller.firstFocusNode.requestFocus();
                                    }
                                  },
                                  validator: (value) =>
                                      controller.validator.validateCode(value),
                                ),
                                SizedBox(
                                  width: ManagerWidth.w6,
                                ),
                                CodeVerification(
                                  controller:
                                      controller.thirdCodeTextController,
                                  focusNode: controller.thirdFocusNode,
                                  previousFocusNode: controller.secondFocusNode,
                                  onChanged: (String value) {
                                    if (value.isNotEmpty) {
                                      controller.fourthFocusNode.requestFocus();
                                    }
                                  },
                                  validator: (value) =>
                                      controller.validator.validateCode(value),
                                ),
                                SizedBox(
                                  width: ManagerWidth.w6,
                                ),
                                CodeVerification(
                                  controller:
                                      controller.fourthCodeTextController,
                                  focusNode: controller.fourthFocusNode,
                                  previousFocusNode: controller.thirdFocusNode,
                                  onChanged: (String value) {
                                    if (value.isNotEmpty) {
                                      controller.fifthFocusNode.requestFocus();
                                    }
                                  },
                                  validator: (value) =>
                                      controller.validator.validateCode(value),
                                ),
                                SizedBox(
                                  width: ManagerWidth.w6,
                                ),
                                CodeVerification(
                                  controller:
                                      controller.fifthCodeTextController,
                                  focusNode: controller.fifthFocusNode,
                                  previousFocusNode: controller.fourthFocusNode,
                                  onChanged: (String value) {
                                    if (value.isNotEmpty) {
                                      controller.sixthFocusNode.requestFocus();
                                    }
                                  },
                                  validator: (value) =>
                                      controller.validator.validateCode(value),
                                ),
                                SizedBox(
                                  width: ManagerWidth.w6,
                                ),
                                CodeVerification(
                                  controller:
                                      controller.sixthCodeTextController,
                                  focusNode: controller.sixthFocusNode,
                                  previousFocusNode: controller.fifthFocusNode,
                                  onChanged: (String value) {
                                    if (value.isNotEmpty) {
                                      controller.seventhFocusNode
                                          .requestFocus();
                                    }
                                  },
                                  validator: (value) =>
                                      controller.validator.validateCode(value),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: ManagerHeight.h28,
                          ),
                          baseTextFormField(
                            hintText: ManagerString.password,
                            controller: controller.password,
                            validator: (value) => _validator.validatePassword(
                              value,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            focusNode: controller.seventhFocusNode,
                          ),
                          SizedBox(
                            height: ManagerHeight.h28,
                          ),
                          baseTextFormField(
                            hintText: ManagerString.confirmPass,
                            controller: controller.confirmPassword,
                            validator: (value) => _validator.validatePassword(
                              value,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            focusNode: controller.eightFocusNode,
                          ),
                          SizedBox(
                            height: ManagerHeight.h28,
                          ),
                          SizedBox(
                            height: ManagerHeight.h40,
                            child: mainButton(
                              onPressed: () {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  controller.resetPassword(context);
                                }
                              },
                              minWidth: double.infinity,
                              child: Text(
                                ManagerString.confirm,
                                style: getRegularTextStyle(
                                  fontSize: ManagerFontSize.s14,
                                  color: ManagerColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ManagerHeight.h10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                ManagerString.resendCode,
                                style: getRegularTextStyle(
                                  fontSize: ManagerFontSize.s14,
                                  color: ManagerColors.grey,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              mainButton(
                                onPressed: () {
                                  controller.sendOtp(context: context);
                                },
                                child: Text(
                                  ManagerString.resend,
                                  style: getMediumTextStyle(
                                    fontSize: ManagerFontSize.s14,
                                    color: ManagerColors.primaryColor,
                                  ),
                                ),
                                height: ManagerHeight.h8,
                                padding: EdgeInsetsDirectional.only(
                                  start: ManagerWidth.w2,
                                ),
                                color: ManagerColors.transparent,
                                elevation: Constants.elevation,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
