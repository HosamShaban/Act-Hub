import 'package:acthub/config/constants.dart';
import 'package:acthub/core/resources/manager_assets.dart';
import 'package:acthub/core/resources/manager_string.dart';
import 'package:acthub/features/out_boarding/presentation%20/view/widgets/out_boarding_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OutBoardingController extends GetxController {
  late PageController pageController;
  static const int firstPage = 0;
  static const int lastPage = 2;
  int currentPage = firstPage;

  List pageViewItems = <OutBoardingItem>[
    OutBoardingItem(
      image: ManagerAssets.outBoardingIllustration1,
      title: ManagerString.outBoardingTitle1,
      subTitle: ManagerString.outBoardingSubTitle1,
    ),
    OutBoardingItem(
      image: ManagerAssets.outBoardingIllustration2,
      title: ManagerString.outBoardingTitle2,
      subTitle: ManagerString.outBoardingSubTitle2,
    ),
    OutBoardingItem(
      image: ManagerAssets.outBoardingIllustration3,
      title: ManagerString.outBoardingTitle3,
      subTitle: ManagerString.outBoardingSubTitle3,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void setCurrentPage(int index) {
    currentPage = index;
    update();
  }

  void skipPage() {
    animateToPage(index: lastPage);
    currentPage = lastPage;
    update();
  }

  void nextPage() {
    if (isNotLastedPage()) {
      animateToPage(index: ++currentPage);
      update();
    }
  }

  void previousPage() {
    if (isNotFirstPage()) {
      animateToPage(index: --currentPage);
      update();
    }
  }

  Future<void> animateToPage({required int index}) {
    return pageController.animateToPage(
      index,
      duration: const Duration(seconds: Constants.outBoardingDurationTime),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  bool isNotLastedPage() {
    return currentPage < lastPage;
  }

  bool isNotFirstPage() {
    return currentPage > firstPage;
  }

  bool showBackButton() {
    return currentPage > firstPage && currentPage < lastPage;
  }
}
