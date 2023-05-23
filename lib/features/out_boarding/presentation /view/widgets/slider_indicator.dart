import 'package:acthub/config/constants.dart';
import 'package:acthub/core/resources/manager_colors.dart';
import 'package:acthub/core/resources/manager_size.dart';
import 'package:acthub/features/out_boarding/presentation%20/controller/out_boarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliderIndicator extends StatelessWidget {
  const SliderIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OutBoardingController>(builder: (controller) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w65),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ManagerRadius.r12),
          color: ManagerColors.greyLight,
        ),
        width: double.infinity,
        height: ManagerHeight.h4,
        child: Row(
          children: [
            ...List.generate(
              Constants.sliderItems,
              (index) => Expanded(
                child: AnimatedContainer(
                  duration: const Duration(
                    seconds: Constants.outBoardingDurationTime,
                  ),
                  curve: Curves.fastLinearToSlowEaseIn,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      ManagerRadius.r12,
                    ),
                    color: controller.currentPage == index
                        ? ManagerColors.primaryColor
                        : ManagerColors.greyLight,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
