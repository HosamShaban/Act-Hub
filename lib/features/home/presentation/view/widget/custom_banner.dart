import 'package:acthub/core/resources/manager_assets.dart';
import 'package:acthub/core/resources/manager_colors.dart';
import 'package:acthub/core/resources/manager_fonts.dart';
import 'package:acthub/core/resources/manager_size.dart';
import 'package:acthub/core/resources/manager_styles.dart';
import 'package:acthub/features/home/presentation/controller/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return CarouselSlider(
          carouselController: controller.carouselController,
          options: CarouselOptions(
            enlargeCenterPage: true,
            scrollPhysics: const BouncingScrollPhysics(),
            viewportFraction: 0.85,
            autoPlay: true,
            height: ManagerHeight.h160,
            onPageChanged: (index, reason) {
              controller.change(index);
            },
          ),
          items: controller.sliders.map((i) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: ManagerWidth.w10,
                vertical: ManagerHeight.h10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ManagerRadius.r14),
                image: DecorationImage(
                    image: i.attributeModel!.image!.isNotEmpty
                        ? NetworkImage(i.attributeModel!.image!.toString())
                        : const AssetImage(ManagerAssets.banner)
                            as ImageProvider,
                    fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    i.attributeModel!.title.toString(),
                    style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s16,
                      color: ManagerColors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ...List.generate(
                        controller.sliders.length,
                        (index) => Container(
                          width: ManagerWidth.w8,
                          height: ManagerHeight.h8,
                          margin: EdgeInsets.only(left: ManagerWidth.w2),
                          decoration: BoxDecoration(
                            color: controller.current == index
                                ? ManagerColors.primaryColor
                                : ManagerColors.greyLight,
                            borderRadius: BorderRadius.circular(
                              ManagerRadius.r10,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
