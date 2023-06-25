import 'package:acthub/core/resources/manager_assets.dart';
import 'package:acthub/core/resources/manager_colors.dart';
import 'package:acthub/core/resources/manager_fonts.dart';
import 'package:acthub/core/resources/manager_size.dart';
import 'package:acthub/core/resources/manager_styles.dart';
import 'package:acthub/features/profile/presentation/controller/profile_controller.dart';
import 'package:acthub/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/custom_photo.dart';
import 'widget/custom_profile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ManagerColors.backgroundForm,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ManagerColors.primaryColor,
          actions: [
            TextButton(
                onPressed: () {},
                child: Text(
                  'Edit',
                  style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s18,
                      color: ManagerColors.black),
                ))
          ],
          title: Text(
            'profile',
            style: getRegularTextStyle(
                fontSize: ManagerFontSize.s18, color: ManagerColors.white),
          ),
        ),
        body: GetBuilder(
          init: ProfileController(),
          builder: (controller) {
            return ListView(
              children: [
                const CustomPhoto(visible: false),
                SizedBox(
                  height: ManagerHeight.h20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: ManagerColors.backgroundForm,
                    borderRadius: BorderRadius.circular(ManagerRadius.r10),
                    boxShadow: const [
                      BoxShadow(
                        color: ManagerColors.greyLight,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.symmetric(
                      horizontal: ManagerWidth.w16,
                      vertical: ManagerHeight.h16),
                  child: Column(
                    children: [
                      const CustomProfile(
                        imagePath: ManagerAssets.userProfile,
                        textName: 'editProfile',
                      ),
                      const Divider(),
                      CustomProfile(
                        imagePath: ManagerAssets.setting,
                        textName: 'setting',
                        onTap: () => Get.toNamed(Routes.setting),
                      ),
                      const Divider(),
                      const CustomProfile(
                          imagePath: ManagerAssets.send, textName: 'share'),
                      const Divider(),
                      const CustomProfile(
                          imagePath: ManagerAssets.stars, textName: 'rates'),
                      const Divider(),
                      const CustomProfile(
                          imagePath: ManagerAssets.document,
                          textName: 'document'),
                      const Divider(),
                      CustomProfile(
                        imagePath: ManagerAssets.logout,
                        textName: 'logout',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }
}
