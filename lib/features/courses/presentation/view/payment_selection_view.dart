import 'package:acthub/core/resources/manager_fonts.dart';
import 'package:acthub/core/resources/manager_size.dart';
import 'package:acthub/core/resources/manager_string.dart';
import 'package:acthub/core/resources/manager_styles.dart';
import 'package:acthub/core/widgets/custom_app_bar.dart';
import 'package:acthub/core/widgets/mainButton.dart';
import 'package:acthub/features/courses/presentation/controller/stepper_controller.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/constants.dart';
import '../../../../../core/resources/manager_colors.dart';

class PaymentSelectionView extends StatelessWidget {
  const PaymentSelectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.scaffoldBackgroundColorLight,
      appBar: CustomAppBar(
        title: ManagerString.bookingCourse,
      ),
      body: GetBuilder<StepperController>(
        builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: ManagerHeight.h70,
                child: EasyStepper(
                  activeStep: controller.activeStep,
                  lineLength: ManagerWidth.w80,
                  lineSpace: Constants.zero,
                  lineType: LineType.dotted,
                  defaultLineColor: ManagerColors.greyLight,
                  finishedLineColor: ManagerColors.primaryColor,
                  activeStepTextColor: ManagerColors.white,
                  finishedStepTextColor: ManagerColors.grey,
                  internalPadding: Constants.zero,
                  showLoadingAnimation: false,
                  stepRadius: ManagerRadius.r26,
                  showStepBorder: false,
                  finishedStepBackgroundColor: ManagerColors.transparent,
                  padding: EdgeInsetsDirectional.only(
                    bottom: ManagerHeight.h6,
                  ),
                  steps: controller.steps,
                  onStepReached: controller.onStepReached,
                ),
              ),
              SizedBox(height: ManagerHeight.h20),
              controller.content[controller.currentStep],
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ManagerWidth.w16,
                ),
                child: mainButton(
                  color: ManagerColors.primaryColor,
                  minWidth: double.infinity,
                  height: ManagerHeight.h48,
                  onPressed: () {
                    controller.performPayment();
                  },
                  child: Text(
                    controller.currentStep == controller.lastStepIndex
                        ? ManagerString.reservation
                        : ManagerString.next,
                    style: getMediumTextStyle(
                      fontSize: ManagerFontSize.s18,
                      color: ManagerColors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: ManagerHeight.h115),
            ],
          );
        },
      ),
    );
  }
}
