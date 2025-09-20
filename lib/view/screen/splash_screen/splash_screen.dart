import 'package:event_platform/utils/app_images/app_images.dart';
import 'package:event_platform/view/components/custom_image/custom_image.dart';
import 'package:event_platform/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/app_routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.onboardingScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: CustomImage(imageSrc: AppImages.splashScreenImage)),
          SizedBox(height: 50),
          CustomText(
            text: 'DentalConnect',
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 8),
          CustomText(
            text: 'Secure case communication for dentists & labs',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
