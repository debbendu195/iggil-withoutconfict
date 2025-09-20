import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_images/app_images.dart';

class OnboardingModel {
  final String title;
  final String description;
  final String image;

  OnboardingModel({
    required this.title,
    required this.description,
    required this.image,
  });
}

class OnboardingController extends GetxController {
  final storage = GetStorage();

  late PageController pageController;
  var currentPage = 0.obs;

  /// Onboarding pages data
  final List<OnboardingModel> onboardingPages = [
    OnboardingModel(
      title: "Secure Dental Case\n Sharing",
      description: "Easily send case details, images, and voice notes to your lab without calls.",
      image: AppImages.onboarding1,
    ),
    OnboardingModel(
      title: "Stay Organized",
      description: "Track case progress in one place, without phone calls.",
      image: AppImages.onboarding2,
    ),
    OnboardingModel(
      title: "Quick Media Sharing",
      description: "Record short videos or voice notes and send instantly.",
      image: AppImages.onboarding3,
    ),
  ];

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void nextPage() {
    if (currentPage.value < onboardingPages.length - 1) {
      currentPage.value++;
      pageController.animateToPage(
        currentPage.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void skipOnboarding() {
    _completeOnboarding();
  }

  void completeOnboarding() {
    _completeOnboarding();
  }

  void _completeOnboarding() {
    storage.write('onboarding_completed', true);
    Get.offAllNamed(AppRoutes.loginScreen);
  }
}
