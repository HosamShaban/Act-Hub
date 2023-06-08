import 'package:acthub/core/resources/manager_size.dart';
import 'package:acthub/core/widgets/will_pop_scope.dart';
import 'package:acthub/features/main/presentation/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return willPopScope(
      child: GetBuilder<MainController>(
        builder: (controller) {
          return PersistentTabView(
            context,
            controller: controller.persistentTabController,
            backgroundColor: Colors.white,
            navBarStyle: NavBarStyle.style2,
            confineInSafeArea: true,
            navBarHeight: ManagerHeight.h60,
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  ManagerRadius.r16,
                ),
                topRight: Radius.circular(
                  ManagerRadius.r16,
                ),
              ),
            ),
            screens: controller.screens,
            items: controller.bottomNavBarItems,
          );
        },
      ),
    );
  }
}
