import 'package:acthub/config/constants.dart';
import 'package:acthub/core/resources/manager_assets.dart';
import 'package:acthub/core/resources/manager_colors.dart';
import 'package:acthub/core/resources/manager_size.dart';
import 'package:acthub/core/widgets/scaffold_with_background_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget authView({Widget? child, bool isRegisterView = false}) {
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
            child: child,
          ),
        ),
      ],
    ),
    isRegisterView: isRegisterView,
  );
}
