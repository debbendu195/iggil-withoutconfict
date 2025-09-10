import 'package:event_platform/core/app_routes/app_routes.dart';
import 'package:event_platform/utils/app_colors/app_colors.dart';
import 'package:event_platform/utils/app_images/app_images.dart';
import 'package:event_platform/view/components/custom_button/custom_button.dart';
import 'package:event_platform/view/components/custom_image/custom_image.dart';
import 'package:event_platform/view/components/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboarding1Screen extends StatelessWidget {
  const Onboarding1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: CustomImage(
              imageSrc: AppImages.onboarding1,
              height: 342,
              width: 320,
            )),
            CustomText(
              text: 'Secure Dental Case\n Sharing',
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
            SizedBox(
              height: 16,
            ),
            CustomText(
              text:
                  'Easily send case details, images, and voice notes to your lab without calls.',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
              maxLines: 2,
            ),
            SizedBox(
              height: 11,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                    color: AppColors.grey1,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                    color: AppColors.grey1,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            CustomButton(
              onTap: () {
                Get.toNamed(AppRoutes.onboarding2Screen);
              },
              title: 'Next',
              fontWeight: FontWeight.w600,
              fontSize: 16,

            ),
            TextButton(
                onPressed: () {},
                child: CustomText(
                  text: 'Sign in',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: AppColors.primary,
                )),
            TextButton(
                onPressed: () {},
                child: CustomText(
                  text: 'Skip',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColors.grey,
                )),
          ],
        ),
      ),
    ));
  }
}
