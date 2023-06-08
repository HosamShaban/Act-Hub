import 'package:acthub/config/dependency_injection.dart';
import 'package:acthub/core/state_renderer/state_renderer.dart';
import 'package:acthub/features/home/domain/model/category_model.dart';
import 'package:acthub/features/home/domain/model/course_model.dart';
import 'package:acthub/features/home/domain/model/slider_model.dart';
import 'package:acthub/features/home/domain/usecase/home_usecase.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late CarouselController carouselController;
  int selectedCategoryIndex = 0;
  int current = 0;

  List<SliderModel> sliders = [];

  List<CourseModel> popularCourses = [];

  List<CategoryModel> categories = [];

  final HomeUseCase _homeUseCase = instance<HomeUseCase>();

  @override
  void onInit() {
    super.onInit();
    home();
    carouselController = CarouselController();
  }

  void change(int index) {
    current = index;
    update();
  }

  void selectCategory(int index) {
    selectedCategoryIndex = index;
    update();
  }

  Future<void> home() async {
    BuildContext context = Get.context!;
    (await _homeUseCase.execute()).fold(
        (l) => {
              dialogRender(
                  context: context,
                  stateRenderType: StateRenderType.popUpErrorState,
                  message: l.message,
                  title: '')
            },
        (r) => {
              sliders = r.sliders!,
              categories = r.categories!,
              popularCourses,
            });
  }

  courseHoursFormat(int index) {
    return "${popularCourses[index].attributesCourseModel!.hours.toString()} hour";
  }
}
