import 'package:acthub/core/resources/manager_colors.dart';
import 'package:acthub/core/resources/manager_fonts.dart';
import 'package:acthub/core/resources/manager_size.dart';
import 'package:acthub/core/resources/manager_styles.dart';
import 'package:acthub/features/out_boarding/presentation%20/view/widgets/slider_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OutBoardingItem extends StatelessWidget {
  String image;
  String title;
  String subTitle;

  OutBoardingItem({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: ManagerHeight.h70),
        SvgPicture.asset(
          image,
          width: double.infinity,
          height: ManagerHeight.h206,
        ),
        SizedBox(height: ManagerHeight.h70),
        const SliderIndicator(),
        SizedBox(height: ManagerHeight.h50),
        Text(
          title,
          style: getBoldTextStyle(
            fontSize: ManagerFontSize.s34,
            color: ManagerColors.textColor,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: ManagerHeight.h20),
        Text(
          subTitle,
          style: getTextStyle(
              fontSize: ManagerFontSize.s16,
              color: ManagerColors.textColorLight,
              weight: ManagerFontWight.w300),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: ManagerHeight.h20),
      ],
    );
  }
}
