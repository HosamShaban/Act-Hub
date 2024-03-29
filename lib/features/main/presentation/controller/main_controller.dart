import 'package:acthub/core/resources/manager_assets.dart';
import 'package:acthub/core/resources/manager_colors.dart';
import 'package:acthub/core/resources/manager_size.dart';
import 'package:acthub/features/appointment/presentation/view/appointment_view.dart';
import 'package:acthub/features/category/presentation/view/category_view.dart';
import 'package:acthub/features/home/presentation/view/home_view.dart';
import 'package:acthub/features/profile/presentation/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class MainController extends GetxController {
  PersistentTabController persistentTabController =
      PersistentTabController(initialIndex: 0);

  Color color = ManagerColors.black;
  List<Widget> screens = [
    HomeView(),
    const CategoryView(),
    const AppointmentView(),
    const ProfileView()
  ];

  List<PersistentBottomNavBarItem> bottomNavBarItems = [
    PersistentBottomNavBarItem(
      icon: const ImageIcon(
        AssetImage(
          ManagerAssets.home,
        ),
      ),
      activeColorPrimary: ManagerColors.primaryColor,
      inactiveColorPrimary: ManagerColors.black,
      iconSize: ManagerRadius.r26,
    ),
    PersistentBottomNavBarItem(
      icon: const ImageIcon(
        AssetImage(
          ManagerAssets.category,
        ),
      ),
      activeColorPrimary: ManagerColors.primaryColor,
      inactiveColorPrimary: ManagerColors.black,
      iconSize: ManagerRadius.r26,
    ),
    PersistentBottomNavBarItem(
      icon: const ImageIcon(
        AssetImage(
          ManagerAssets.calender,
        ),
      ),
      activeColorPrimary: ManagerColors.primaryColor,
      inactiveColorPrimary: ManagerColors.black,
      iconSize: ManagerRadius.r26,
    ),
    PersistentBottomNavBarItem(
      icon: const ImageIcon(
        AssetImage(
          ManagerAssets.profile,
        ),
      ),
      iconSize: ManagerRadius.r26,
      activeColorPrimary: ManagerColors.primaryColor,
      inactiveColorPrimary: ManagerColors.black,
    ),
  ];
}
