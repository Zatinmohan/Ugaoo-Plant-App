import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Model/onBoarding_info.dart';

//Class for On-Boarding Page, Same page but text and images are different.

class OnBoardingController extends GetxController {
  var selectedPageIndex = 0.obs; //Page numbers for the onboarding screen.
  var pageController = PageController();

  bool get isLastPage => selectedPageIndex.value == onBoardingPages.length - 1;

  nextPage() {
    if (isLastPage)
      Get.offAllNamed('/Login');
    else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.easeIn);
  }

  //Data for On-Boarding Page

  final List<OnboardingInfo> onBoardingPages = [
    OnboardingInfo("assets/onboarding/first.png", "Welcome",
        "Ugaoo is for you plant lovers! Get your gardening equipments and green pants from us and become part of our global community"),
    OnboardingInfo("assets/onboarding/second.png", "Shop",
        "Need to add more to your plant collection? Find varity of plants and seeds from Ugaoo and be a part of this family."),
    OnboardingInfo("assets/onboarding/third.png", "Go Green!",
        "Be a part of our community and help us to make our mother earth greener and healthier."),
  ];
}
