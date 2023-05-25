import 'package:acthub/core/resources/manager_colors.dart';
import 'package:acthub/core/resources/manager_fonts.dart';
import 'package:acthub/core/resources/manager_size.dart';
import 'package:acthub/core/resources/manager_string.dart';
import 'package:acthub/core/resources/manager_styles.dart';
import 'package:acthub/core/widgets/mainButton.dart';
import 'package:acthub/features/out_boarding/presentation%20/view/widgets/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/out_boarding_controller.dart';

class OutBoardingView extends StatelessWidget {
  const OutBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w20,
            vertical: ManagerHeight.h10,
          ),
          child: GetBuilder<OutBoardingController>(builder: (controller) {
            return Column(
              children: [
                Visibility(
                  visible: controller.isNotLastedPage(),
                  maintainSize: true,
                  maintainState: true,
                  maintainAnimation: true,
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: mainButton(
                      onPressed: () {
                        controller.skipPage();
                      },
                      child: Text(
                        ManagerString.skip,
                        style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s16,
                          color: ManagerColors.textColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: controller.pageController,
                    children: [
                      ...controller.pageViewItems,
                    ],
                    onPageChanged: (index) {
                      controller.setCurrentPage(index);
                    },
                  ),
                ),
                Visibility(
                  visible: controller.isNotLastedPage(),
                  replacement: mainButton(
                      child: Text(
                        ManagerString.getStartButton,
                        style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s14,
                          color: ManagerColors.white,
                        ),
                      ),
                      minWidth: double.infinity,
                      height: ManagerHeight.h40,
                      color: ManagerColors.primaryColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: controller.showBackButton(),
                        child: circleButton(
                          onPressed: () {
                            controller.previousPage();
                          },
                          iconData: Icons.arrow_back_outlined,
                        ),
                      ),
                      circleButton(
                        onPressed: () {
                          controller.nextPage();
                        },
                        iconData: Icons.arrow_forward_outlined,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
