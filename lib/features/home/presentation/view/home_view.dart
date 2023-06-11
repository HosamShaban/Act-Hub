import 'package:acthub/core/resources/manager_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_string.dart';
import '../../../../core/widgets/will_pop_scope.dart';
import '../controller/home_controller.dart';
import 'widget/custom_banner.dart';
import 'widget/custom_category.dart';
import 'widget/custom_course.dart';
import 'widget/custom_text.dart';
import 'widget/home_app_bar.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return willPopScope(
      child: Scaffold(
        appBar: homeAppBar(),
        body: GetBuilder<HomeController>(
          builder: (controller) {
            return ListView(
              children: [
                SizedBox(height: ManagerHeight.h20),
                const CustomBanner(),
                CustomText(
                  name: ManagerString.categories,
                  nameButton: ManagerString.seeAll,
                  buttonColor: ManagerColors.black.withOpacity(
                    ManagerOpacity.op0_5,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: ManagerHeight.h48,
                  child: ListView.builder(
                    itemCount: controller.categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CustomCategory(
                        name: controller
                            .categories[index].attributeCategoryModel!.title
                            .toString(),
                        imagePath: controller
                            .categories[index].attributeCategoryModel!.image
                            .toString(),
                        index: index,
                      );
                    },
                  ),
                ),
                const CustomText(
                  name: ManagerString.popularCourses,
                  nameButton: ManagerString.viewAll,
                  buttonColor: ManagerColors.primaryColor,
                ),
                Container(
                  height: ManagerHeight.h500, // Replace with the desired height
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.popularCourses.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CustomCourse(
                            index: index,
                            // onTap: () => Get.to(() => CourseDescriptionView(index: index + 1)),
                          ),
                          Divider(
                            indent: ManagerWidth.w14,
                            endIndent: ManagerWidth.w14,
                            color: ManagerColors.greyLight,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: ManagerHeight.h20),
              ],
            );
          },
        ),
      ),
    );
  }
}
