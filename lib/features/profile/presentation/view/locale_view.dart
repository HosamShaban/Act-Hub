import 'package:acthub/core/extensions/extensions.dart';
import 'package:acthub/core/resources/manager_colors.dart';
import 'package:acthub/core/resources/manager_fonts.dart';
import 'package:acthub/core/resources/manager_size.dart';
import 'package:acthub/core/resources/manager_string.dart';
import 'package:acthub/core/resources/manager_styles.dart';
import 'package:acthub/core/widgets/custom_app_bar.dart';
import 'package:acthub/features/profile/presentation/controller/loacle_notifier_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleView extends StatelessWidget {
  const LocaleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: ManagerString.localePage,
      ),
      body: GetBuilder<LocaleNotifierController>(builder: (controller) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w20),
          child: SizedBox(
            height: ManagerHeight.h100,
            width: double.infinity,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                customButton: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.language,
                      size: ManagerIconSize.s24,
                    ),
                    const Spacer(),
                    Text(
                      ManagerString.language,
                      style: getMediumTextStyle(
                        fontSize: ManagerFontSize.s16,
                        color: ManagerColors.black,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      controller.languageList[controller.currentLanguage]
                          .onNull(),
                      style: getMediumTextStyle(
                        fontSize: ManagerFontSize.s16,
                        color: ManagerColors.primaryColor,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_back_ios_new,
                      size: ManagerIconSize.s24,
                    ),
                  ],
                ),
                items: controller.languageList.values.map((value) {
                  return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: getTextStyle(
                          fontSize: ManagerFontSize.s18,
                          color: ManagerColors.black,
                        ),
                      ));
                }).toList(),
                isExpanded: true,
                value: controller.languageList[controller.currentLanguage],
                onChanged: (value) {
                  for (var entry in controller.languageList.entries) {
                    if (entry.value == value) {
                      controller.changeLanguage(
                        context: context,
                        langCode: entry.key,
                      );
                    }
                  }
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
