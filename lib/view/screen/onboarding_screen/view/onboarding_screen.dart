import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../controller/onboarding_controller.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFdcf8ed),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.15,
          vertical: screenHeight * 0.08,
        ),
        child: Column(
          children: [
            Expanded(
              child: Obx(() => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    controller.onboardingPages[controller.currentPage.value].image,
                    height: screenHeight * 0.35,
                    width: screenWidth * 0.7,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    controller.onboardingPages[controller.currentPage.value].title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    controller.onboardingPages[controller.currentPage.value].description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      color: Colors.grey,
                    ),
                  ),
                ],
              )),
            ),
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.onboardingPages.length,
                    (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 6,
                  width: index == controller.currentPage.value ? 20 : 6,
                  decoration: BoxDecoration(
                    color: index == controller.currentPage.value
                        ? AppColors.primary
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (controller.currentPage.value == controller.onboardingPages.length - 1) {
                  controller.completeOnboarding();
                } else {
                  controller.nextPage();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                minimumSize: Size(screenWidth, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Next",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: controller.skipOnboarding,
              child: const Text(
                "Skip",
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}

