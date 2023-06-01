import 'package:acthub/config/constants.dart';
import 'package:acthub/core/resources/manager_assets.dart';
import 'package:acthub/core/resources/manager_colors.dart';
import 'package:acthub/core/resources/manager_fonts.dart';
import 'package:acthub/core/resources/manager_size.dart';
import 'package:acthub/core/resources/manager_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ManagerColors.primaryColor,
        body: Column(
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
                  color: ManagerColors.white,
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(ManagerRadius.r44),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: ManagerWidth.w16, vertical: ManagerHeight.h30),
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      'Login',
                      style: getMediumTextStyle(
                          fontSize: ManagerFontSize.s24,
                          color: ManagerColors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
