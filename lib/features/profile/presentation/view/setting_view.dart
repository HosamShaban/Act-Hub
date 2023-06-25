import 'package:acthub/core/resources/manager_colors.dart';
import 'package:acthub/core/resources/manager_fonts.dart';
import 'package:acthub/core/resources/manager_size.dart';
import 'package:acthub/core/resources/manager_styles.dart';
import 'package:acthub/features/profile/presentation/view/widget/custom_account.dart';
import 'package:acthub/features/profile/presentation/view/widget/custom_general.dart';
import 'package:acthub/features/profile/presentation/view/widget/custom_notification.dart';
import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ManagerColors.primaryColor,
        centerTitle: true,
        iconTheme: const IconThemeData(color: ManagerColors.white),
        title: Text(
          'setting',
          style: getRegularTextStyle(
              fontSize: ManagerFontSize.s16, color: ManagerColors.white),
        ),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: ManagerHeight.h60,
                color: ManagerColors.primaryColor,
              ),
              const CustomNotification(),
            ],
          ),
          SizedBox(
            height: ManagerHeight.h30,
          ),
          const CustomGeneral(),
          SizedBox(
            height: ManagerHeight.h30,
          ),
          const CustomAccount()
        ],
      ),
    );
  }
}
