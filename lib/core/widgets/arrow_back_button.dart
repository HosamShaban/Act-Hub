import 'package:acthub/config/constants.dart';
import 'package:acthub/core/resources/manager_colors.dart';
import 'package:acthub/core/resources/manager_icons.dart';
import 'package:acthub/core/resources/manager_size.dart';
import 'package:acthub/core/service/icon_service.dart';
import 'package:acthub/core/widgets/mainButton.dart';
import 'package:acthub/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

Widget arrowBackButton({Color? color}) {
  return Container(
    margin: EdgeInsetsDirectional.only(
      top: ManagerHeight.h12,
    ),
    child: mainButton(
      onPressed: () {
        Get.offAllNamed(Routes.loginView);
      },
      child: IconService().getIcon(
        icon: ManagerIcons.arrow_back_ios,
        color: color ?? ManagerColors.white,
        iconSize: ManagerIconSize.s24,
      ),
      color: ManagerColors.transparent,
      elevation: Constants.arrowBackButtonElevation,
    ),
  );
}
